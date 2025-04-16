package com.educare.controller;

import com.educare.dao.JeuDAO;
import com.educare.model.Jeu;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/jeux")
public class JeuServlet extends HttpServlet {
    private JeuDAO jeuDAO = new JeuDAO();

    // Afficher liste + formulaire
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("edit".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Jeu jeu = jeuDAO.getJeuById(id); // Nouvelle méthode dans DAO
            request.setAttribute("jeu", jeu);
            request.getRequestDispatcher("/WEB-INF/views/jeux/form.jsp").forward(request, response);
        } else {
            request.setAttribute("jeux", jeuDAO.getAllJeux());
            request.getRequestDispatcher("/WEB-INF/views/jeux/list.jsp").forward(request, response);
        }
    }

    // Traiter la modification
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String description = request.getParameter("description");

        if (jeuDAO.updateDescription(id, description)) {
            response.sendRedirect("jeux");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Échec de la mise à jour");
        }
    }
}