package com.educare.dao;

import com.educare.model.Jeu;
import com.educare.model.Theme;
import com.educare.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JeuDAO {
    private static final String SELECT_ALL_SQL =
            "SELECT j.id, j.nom_jeu, j.description, t.id as theme_id, t.nom_theme " +
                    "FROM jeu j JOIN theme t ON j.theme_id = t.id";

    private static final String UPDATE_DESCRIPTION_SQL =
            "UPDATE jeu SET description = ? WHERE id = ?";

    public List<Jeu> getAllJeux() {
        List<Jeu> jeux = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
                Jeu jeu = new Jeu();
                jeu.setId(rs.getInt("id"));
                jeu.setNomJeu(rs.getString("nom_jeu"));
                jeu.setDescription(rs.getString("description"));

                Theme theme = new Theme();
                theme.setId(rs.getInt("theme_id"));
                theme.setNomTheme(rs.getString("nom_theme"));
                jeu.setTheme(theme);

                jeux.add(jeu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jeux;
    }
    public Jeu getJeuById(int id) {
        String sql = "SELECT j.*, t.nom_theme FROM jeu j JOIN theme t ON j.theme_id = t.id WHERE j.id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Jeu jeu = new Jeu();
                    jeu.setId(rs.getInt("id"));
                    jeu.setNomJeu(rs.getString("nom_jeu"));
                    jeu.setDescription(rs.getString("description"));

                    Theme theme = new Theme();
                    theme.setId(rs.getInt("theme_id"));
                    theme.setNomTheme(rs.getString("nom_theme"));
                    jeu.setTheme(theme);

                    return jeu;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean updateDescription(int id, String nouvelleDescription) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_DESCRIPTION_SQL)) {

            ps.setString(1, nouvelleDescription);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}