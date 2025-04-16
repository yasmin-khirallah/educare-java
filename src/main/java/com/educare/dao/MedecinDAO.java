package com.educare.dao;

import com.educare.util.DBConnection;
import java.sql.*;

public class MedecinDAO {
    public boolean exists(int id) throws SQLException {
        String sql = "SELECT id FROM medecin WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeQuery().next();
        }
    }
}