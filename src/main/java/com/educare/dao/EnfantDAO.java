package com.educare.dao;

import com.educare.model.Enfant;
import com.educare.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnfantDAO {

    public List<Enfant> getAllEnfants() throws SQLException {
        List<Enfant> enfants = new ArrayList<>();
        String sql = "SELECT id, username, code, type FROM enfant";

        Connection conn = DBConnection.getConnection();
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Enfant enfant = new Enfant();
                enfant.setId(rs.getInt("id"));
                enfant.setUsername(rs.getString("username"));
                enfant.setCode(rs.getString("code"));
                enfant.setType(rs.getString("type"));
                enfants.add(enfant);
            }
        }
        return enfants;
    }

    public Enfant getEnfantById(int id) throws SQLException {
        String sql = "SELECT * FROM enfant WHERE id=?";
        Connection conn = DBConnection.getConnection();
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Enfant enfant = new Enfant();
                    enfant.setId(rs.getInt("id"));
                    enfant.setParentId(rs.getInt("parent_id"));
                    enfant.setUsername(rs.getString("username"));
                    enfant.setCode(rs.getString("code"));
                    enfant.setType(rs.getString("type"));
                    return enfant;
                }
            }
        }
        return null;
    }
}