package com.educare.controller;

import com.educare.dao.ParentDAO;
import com.educare.model.Parent;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/messagerie")
public class MessagerieServlet extends HttpServlet {
    private ParentDAO parentDAO;

    @Override
    public void init() {
        parentDAO = new ParentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Parent> parents = parentDAO.getAllParentsWithProfile();
            request.setAttribute("parents", parents);
            request.getRequestDispatcher("/WEB-INF/views/messagerie/list.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Erreur de base de données");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }
    }
}