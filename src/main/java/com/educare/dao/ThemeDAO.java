package com.educare.dao;

import com.educare.model.Theme;
import com.educare.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ThemeDAO {
    private static final String SELECT_ALL_SQL = "SELECT * FROM theme";

    public List<Theme> getAllThemes() {
        List<Theme> themes = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = ps.executeQuery()) {

            while(rs.next()) {
                Theme theme = new Theme();
                theme.setId(rs.getInt("id"));
                theme.setNomTheme(rs.getString("nom_theme"));
                theme.setDescriptionTheme(rs.getString("description_theme"));
                theme.setImageTheme(rs.getString("image_theme"));
                theme.setDateAjout(rs.getTimestamp("date_ajout_theme"));
                theme.setDateModification(rs.getTimestamp("date_derniere_modfication"));
                themes.add(theme);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return themes;
    }
}