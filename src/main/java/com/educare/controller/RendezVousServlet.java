package com.educare.controller;

import com.educare.dao.EnfantDAO;
import com.educare.dao.RendezVousDAO;
import com.educare.model.Enfant;
import com.educare.model.RendezVous;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "RendezVousServlet", urlPatterns = "/rendezvous")
public class RendezVousServlet extends HttpServlet {
    private RendezVousDAO rdvDAO;
    private EnfantDAO enfantDAO;

    @Override
    public void init() {
        rdvDAO = new RendezVousDAO();
        enfantDAO = new EnfantDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "list" : request.getParameter("action");

        try {
            switch (action) {
                case "new":
                    showForm(request, response, null);
                    break;
                case "edit":
                    showForm(request, response, Integer.parseInt(request.getParameter("id")));
                    break;
                case "delete":
                    deleteRendezVous(request, response);
                    break;
                default:
                    listRendezVous(request, response);
            }
        } catch (Exception e) {
            handleError(request, response, e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("insert".equals(action)) {
                insertRendezVous(request, response);
            } else if ("update".equals(action)) {
                updateRendezVous(request, response);
            }
        } catch (Exception e) {
            handleError(request, response, e.getMessage());
        }
    }

    private void listRendezVous(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<RendezVous> rdvList = rdvDAO.getAllRendezVous();
            request.setAttribute("rendezVousList", rdvList);
            request.getRequestDispatcher("/WEB-INF/views/rendezvous/list.jsp").forward(request, response);
        } catch (SQLException e) {
            handleError(request, response, "Erreur base de données: " + e.getMessage());
        }
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response, Integer id)
            throws ServletException, IOException {
        try {
            List<Enfant> enfants = enfantDAO.getAllEnfants();
            request.setAttribute("enfants", enfants);

            if (id != null) {
                RendezVous rdv = rdvDAO.getRendezVousById(id);
                request.setAttribute("rendezVous", rdv);
            }
            request.getRequestDispatcher("/WEB-INF/views/rendezvous/form.jsp").forward(request, response);
        } catch (SQLException e) {
            handleError(request, response, "Erreur base de données: " + e.getMessage());
        }
    }

    private void insertRendezVous(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int enfantId = Integer.parseInt(request.getParameter("enfant_id"));
        LocalDateTime date = LocalDateTime.parse(request.getParameter("date"));
        String description = request.getParameter("description");

        RendezVous rdv = new RendezVous();
        rdv.setEnfantId(enfantId);
        rdv.setDate(date);
        rdv.setDescription(description);

        rdvDAO.createRendezVous(rdv);
        response.sendRedirect("rendezvous");
    }

    private void updateRendezVous(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int enfantId = Integer.parseInt(request.getParameter("enfant_id"));
        LocalDateTime date = LocalDateTime.parse(request.getParameter("date"));
        String description = request.getParameter("description");

        RendezVous rdv = new RendezVous();
        rdv.setId(id);
        rdv.setEnfantId(enfantId);
        rdv.setDate(date);
        rdv.setDescription(description);

        rdvDAO.updateRendezVous(rdv);
        response.sendRedirect("rendezvous");
    }

    private void deleteRendezVous(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        rdvDAO.deleteRendezVous(id);
        response.sendRedirect("rendezvous");
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        listRendezVous(request, response);
    }
}