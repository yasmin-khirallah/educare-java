package com.educare.controller;

import com.educare.dao.MedecinDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/educare/*")
public class MedecinGatewayServlet extends HttpServlet {

    private MedecinDAO medecinDao = new MedecinDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            // Extraire l'ID de l'URL
            String[] pathParts = req.getPathInfo().split("/");
            int medecinId = Integer.parseInt(pathParts[1]);

            // Vérifier l'existence
            if (medecinDao.exists(medecinId)) {
                req.setAttribute("medecinId", medecinId); // <-- Ajouter cette ligne
                req.getRequestDispatcher("/WEB-INF/menu.jsp").forward(req, resp);
            }
            else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Médecin non trouvé");
            }

        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "URL invalide");
        }
    }
}