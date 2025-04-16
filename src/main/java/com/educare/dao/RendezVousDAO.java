package com.educare.dao;

import com.educare.model.RendezVous;
import com.educare.util.DBConnection;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class RendezVousDAO {

    public List<RendezVous> getAllRendezVous() throws SQLException {
        List<RendezVous> rendezVousList = new ArrayList<>();
        String sql = "SELECT * FROM rendez_vous";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                RendezVous rdv = new RendezVous();
                rdv.setId(rs.getInt("id"));
                rdv.setEnfantId(rs.getInt("enfant_id"));
                rdv.setDate(rs.getTimestamp("date").toLocalDateTime());
                rdv.setDescription(rs.getString("description"));
                rendezVousList.add(rdv);
            }
        }
        return rendezVousList;
    }

    public boolean createRendezVous(RendezVous rdv) throws SQLException {
        String sql = "INSERT INTO rendez_vous (enfant_id, date, description) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, rdv.getEnfantId());
            pstmt.setTimestamp(2, Timestamp.valueOf(rdv.getDate()));
            pstmt.setString(3, rdv.getDescription());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean updateRendezVous(RendezVous rdv) throws SQLException {
        String sql = "UPDATE rendez_vous SET enfant_id=?, date=?, description=? WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, rdv.getEnfantId());
            pstmt.setTimestamp(2, Timestamp.valueOf(rdv.getDate()));
            pstmt.setString(3, rdv.getDescription());
            pstmt.setInt(4, rdv.getId());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean deleteRendezVous(int id) throws SQLException {
        String sql = "DELETE FROM rendez_vous WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        }
    }

    public RendezVous getRendezVousById(int id) throws SQLException {
        String sql = "SELECT * FROM rendez_vous WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    RendezVous rdv = new RendezVous();
                    rdv.setId(rs.getInt("id"));
                    rdv.setEnfantId(rs.getInt("enfant_id"));
                    rdv.setDate(rs.getTimestamp("date").toLocalDateTime());
                    rdv.setDescription(rs.getString("description"));
                    return rdv;
                }
            }
        }
        return null;
    }
}