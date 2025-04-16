<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../fragments/header.jspf" %>

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f7f7f7;
        color: #333;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 900px;
        margin: 40px auto;
        padding: 25px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #3f51b5;
        font-size: 1.8em;
        margin-bottom: 30px;
    }

    .alert {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
        padding: 10px;
        border-radius: 6px;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        font-weight: bold;
        font-size: 1em;
        color: #333;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        font-size: 1em;
        border: 1px solid #ccc;
        border-radius: 6px;
        margin-top: 5px;
    }

    .form-control:focus {
        border-color: #3f51b5;
        box-shadow: 0 0 5px rgba(63, 81, 181, 0.5);
    }

    button.btn {
        font-weight: bold;
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        transition: background-color 0.3s ease;
    }

    .btn-success {
        background-color: #4caf50;
        color: white;
    }

    .btn-success:hover {
        background-color: #45a049;
    }

    .btn-secondary {
        background-color: #6c757d;
        color: white;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
    }

    .btn i {
        margin-right: 5px;
    }
</style>

<div class="container mt-4">
    <h2 class="mb-4">
        <c:choose>
            <c:when test="${not empty dossier}">Modification du dossier #${dossier.id}</c:when>
            <c:otherwise>Création d'un nouveau dossier</c:otherwise>
        </c:choose>
    </h2>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/dossiers${not empty dossier ? '/update' : '/insert'}">
        <c:if test="${not empty dossier}">
            <input type="hidden" name="id" value="${dossier.id}">
        </c:if>

        <div class="form-group">
            <label>Enfant :</label>
            <select name="enfantId" class="form-control" required>
                <option value="">Sélectionner un enfant</option>
                <c:forEach items="${enfants}" var="enfant">
                    <option value="${enfant.id}"
                        ${dossier.enfantId == enfant.id ? 'selected' : ''}>
                            ${enfant.username} (${enfant.code}) - ${enfant.type}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Type d'Enfant :</label>
            <select name="typeEnfant" class="form-control" required>
                <option value="Normal" ${dossier.typeEnfant == 'Normal' ? 'selected' : ''}>Normal</option>
                <option value="Handicape" ${dossier.typeEnfant == 'Handicape' ? 'selected' : ''}>Handicapé</option>
                <option value="Surdoue" ${dossier.typeEnfant == 'Surdoue' ? 'selected' : ''}>Surdoué</option>
            </select>
        </div>

        <div class="form-group">
            <label>Remarques Médicales :</label>
            <textarea name="remarques"
                      class="form-control"
                      rows="5"
                      required>${dossier.remarquesMedecin}</textarea>
        </div>

        <div class="form-group">
            <label>Score Scientifique :</label>
            <input type="number" name="sciResJeux"
                   value="${dossier.sciResJeux}"
                   class="form-control"
                   required
                   min="0"
                   max="100">
        </div>

        <button type="submit" class="btn btn-success">
            <i data-feather="save"></i> Enregistrer
        </button>
        <a href="${pageContext.request.contextPath}/dossiers" class="btn btn-secondary">
            <i data-feather="x"></i> Annuler
        </a>
    </form>
</div>

<%@ include file="../../fragments/footer.jspf" %>
