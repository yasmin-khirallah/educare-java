<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/fragments/header.jspf" %>

<style>
    .container {
        max-width: 600px;
        margin: 40px auto;
        padding: 25px;
        background-color: #fdfdfd;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        font-family: 'Segoe UI', sans-serif;
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #3f51b5;
    }

    label {
        font-weight: 600;
        margin-bottom: 6px;
        display: block;
        color: #333;
    }

    .form-select,
    .form-control,
    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        transition: border-color 0.3s;
    }

    .form-select:focus,
    .form-control:focus,
    textarea:focus {
        border-color: #3f51b5;
        outline: none;
        box-shadow: 0 0 4px #3f51b5aa;
    }

    .mb-3 {
        margin-bottom: 20px;
    }

    button.btn-success,
    a.btn-secondary {
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        margin-right: 10px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    button.btn-success {
        background-color: #4caf50;
        color: white;
    }

    button.btn-success:hover {
        background-color: #43a047;
    }

    a.btn-secondary {
        background-color: #9e9e9e;
        color: white;
    }

    a.btn-secondary:hover {
        background-color: #757575;
    }
</style>

<div class="container">
    <h2>${empty rendezVous ? 'Nouveau' : 'Édition'} Rendez-vous</h2>

    <form action="rendezvous" method="post">
        <c:if test="${not empty rendezVous}">
            <input type="hidden" name="id" value="${rendezVous.id}">
        </c:if>
        <input type="hidden" name="action" value="${empty rendezVous ? 'insert' : 'update'}">

        <div class="mb-3">
            <label>Enfant</label>
            <select name="enfant_id" class="form-select" required>
                <c:forEach items="${enfants}" var="enfant">
                    <option value="${enfant.id}"
                        ${rendezVous.enfantId == enfant.id ? 'selected' : ''}>
                            ${enfant.username}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label>Date/Heure</label>
            <input type="datetime-local" name="date"
                   value="${rendezVous.date}"
                   class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control" required>${rendezVous.description}</textarea>
        </div>

        <button type="submit" class="btn btn-success">Enregistrer</button>
        <a href="rendezvous" class="btn btn-secondary">Annuler</a>
    </form>
</div>

<%@ include file="/WEB-INF/fragments/footer.jspf" %>
