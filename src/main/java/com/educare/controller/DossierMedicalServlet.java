package com.educare.controller;

import com.educare.dao.DossierMedicalDAO;
import com.educare.dao.EnfantDAO;
import com.educare.model.DossierMedical;
import com.educare.model.Enfant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "DossierMedicalServlet", value = "/dossiers/*")
public class DossierMedicalServlet extends HttpServlet {
    private DossierMedicalDAO dossierDAO;
    private EnfantDAO enfantDAO;

    @Override
    public void init() {
        dossierDAO = new DossierMedicalDAO();
        enfantDAO = new EnfantDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo() == null ? "/list" : request.getPathInfo();

        try {
            switch (action) {
                case "/new":
                    showForm(request, response, null);
                    break;
                case "/edit":
                    showForm(request, response, Integer.parseInt(request.getParameter("id")));
                    break;
                case "/delete":
                    deleteDossier(request, response);
                    break;
                case "/insert":
                    insertDossier(request, response);
                    break;
                case "/update":
                    updateDossier(request, response);
                    break;
                case "/list":
                default:
                    listDossiers(request, response);
                    break;
            }
        } catch (Exception e) {
            handleError(request, response, "Erreur système : " + e.getMessage());
        }
    }

    private void listDossiers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<DossierMedical> dossiers = dossierDAO.getAllDossiers();
            request.setAttribute("dossiers", dossiers);
            request.getRequestDispatcher("/WEB-INF/views/dossiermedical/list.jsp").forward(request, response);
        } catch (SQLException e) {
            handleError(request, response, "Erreur base de données : " + e.getMessage());
        }
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response, Integer id)
            throws ServletException, IOException {
        try {
            List<Enfant> enfants = enfantDAO.getAllEnfants();
            request.setAttribute("enfants", enfants);

            if (id != null) {
                DossierMedical dossier = dossierDAO.getDossierById(id);
                if (dossier == null) {
                    handleError(request, response, "Dossier introuvable");
                    return;
                }
                request.setAttribute("dossier", dossier);
            }
            request.getRequestDispatcher("/WEB-INF/views/dossiermedical/form.jsp").forward(request, response);
        } catch (SQLException e) {
            handleError(request, response, "Erreur de chargement : " + e.getMessage());
        }
    }

    private void insertDossier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int enfantId = Integer.parseInt(request.getParameter("enfantId"));
            validateEnfantExistence(enfantId);

            DossierMedical dossier = new DossierMedical(
                    enfantId,
                    request.getParameter("typeEnfant"),
                    request.getParameter("remarques"),
                    Integer.parseInt(request.getParameter("sciResJeux"))
            );

            dossierDAO.createDossier(dossier);
            request.getSession().setAttribute("successMessage", "Dossier créé avec succès !");
            response.sendRedirect("list");

        } catch (NumberFormatException e) {
            handleError(request, response, "Format de données invalide");
        } catch (SQLException e) {
            handleError(request, response, "Erreur création dossier : " + e.getMessage());
        } catch (IllegalArgumentException e) {
            handleError(request, response, e.getMessage());
        }
    }

    private void updateDossier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int enfantId = Integer.parseInt(request.getParameter("enfantId"));
            validateEnfantExistence(enfantId);

            DossierMedical dossier = new DossierMedical(
                    enfantId,
                    request.getParameter("typeEnfant"),
                    request.getParameter("remarques"),
                    Integer.parseInt(request.getParameter("sciResJeux"))
            );
            dossier.setId(id);

            dossierDAO.updateDossier(dossier);
            request.getSession().setAttribute("successMessage", "Dossier mis à jour avec succès !");
            response.sendRedirect("list");

        } catch (NumberFormatException e) {
            handleError(request, response, "Format de données invalide");
        } catch (SQLException e) {
            handleError(request, response, "Erreur mise à jour : " + e.getMessage());
        } catch (IllegalArgumentException e) {
            handleError(request, response, e.getMessage());
        }
    }

    private void deleteDossier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            dossierDAO.deleteDossier(id);
            request.getSession().setAttribute("successMessage", "Dossier supprimé avec succès !");
            response.sendRedirect("list");
        } catch (NumberFormatException e) {
            handleError(request, response, "ID invalide");
        } catch (SQLException e) {
            handleError(request, response, "Erreur suppression : " + e.getMessage());
        }
    }

    private void validateEnfantExistence(int enfantId) throws SQLException, IllegalArgumentException {
        Enfant enfant = enfantDAO.getEnfantById(enfantId);
        if (enfant == null) {
            throw new IllegalArgumentException("Aucun enfant trouvé avec l'ID : " + enfantId);
        }
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        listDossiers(request, response);
    }
}