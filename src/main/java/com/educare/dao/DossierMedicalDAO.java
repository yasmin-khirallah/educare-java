package com.educare.dao;

import com.educare.model.DossierMedical;
import com.educare.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DossierMedicalDAO {

    public void createDossier(DossierMedical dossier) throws SQLException {
        String sql = "INSERT INTO dossier_medical (enfant1_id, type_enfant, remarques_medecin, sci_res_jeux) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, dossier.getEnfantId());
            pstmt.setString(2, dossier.getTypeEnfant());
            pstmt.setString(3, dossier.getRemarquesMedecin());
            pstmt.setInt(4, dossier.getSciResJeux());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Échec de la création du dossier");
            }

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    dossier.setId(generatedKeys.getInt(1));
                }
            }
        }
    }

    public List<DossierMedical> getAllDossiers() throws SQLException {
        List<DossierMedical> dossiers = new ArrayList<>();
        String sql = "SELECT * FROM dossier_medical";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                dossiers.add(mapResultSetToDossier(rs));
            }
        }
        return dossiers;
    }

    public DossierMedical getDossierById(int id) throws SQLException {
        String sql = "SELECT * FROM dossier_medical WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToDossier(rs);
                }
            }
        }
        return null;
    }

    public void updateDossier(DossierMedical dossier) throws SQLException {
        String sql = "UPDATE dossier_medical SET enfant1_id=?, type_enfant=?, remarques_medecin=?, sci_res_jeux=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, dossier.getEnfantId());
            pstmt.setString(2, dossier.getTypeEnfant());
            pstmt.setString(3, dossier.getRemarquesMedecin());
            pstmt.setInt(4, dossier.getSciResJeux());
            pstmt.setInt(5, dossier.getId());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Aucun dossier trouvé avec l'ID : " + dossier.getId());
            }
        }
    }

    public void deleteDossier(int id) throws SQLException {
        String sql = "DELETE FROM dossier_medical WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    private DossierMedical mapResultSetToDossier(ResultSet rs) throws SQLException {
        DossierMedical dossier = new DossierMedical();
        dossier.setId(rs.getInt("id"));
        dossier.setEnfantId(rs.getInt("enfant1_id"));
        dossier.setTypeEnfant(rs.getString("type_enfant"));
        dossier.setRemarquesMedecin(rs.getString("remarques_medecin"));
        dossier.setSciResJeux(rs.getInt("sci_res_jeux"));
        return dossier;
    }
}