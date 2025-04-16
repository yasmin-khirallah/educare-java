package com.educare.dao;

import com.educare.model.Parent;
import com.educare.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ParentDAO {

    public List<Parent> getAllParentsWithProfile() throws SQLException {
        List<Parent> parents = new ArrayList<>();
        String sql = "SELECT p.*, u.photo_profil FROM parent p " +
                "JOIN user u ON p.user_id = u.id " +
                "WHERE u.role = 'PARENT'";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Parent parent = new Parent();
                parent.setId(rs.getInt("id"));
                parent.setNom(rs.getString("nom"));
                parent.setPrenom(rs.getString("prenom"));
                parent.setEmail(rs.getString("email"));
                parent.setTelephone(rs.getString("telephone"));
                parent.setPhotoProfil(rs.getString("photo_profil"));
                parents.add(parent);
            }
        }
        return parents;
    }
}