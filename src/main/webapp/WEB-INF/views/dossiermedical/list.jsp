<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/fragments/header.jspf" %>

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f4f4f9;
        color: #333;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 1100px;
        margin: 50px auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
    }

    .d-flex {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 40px;
    }

    h2 {
        color: #3f51b5;
        font-size: 2rem;
        margin: 0;
    }

    .btn-primary {
        background-color: #007bff;
        color: white;
        font-weight: bold;
        padding: 10px 18px;
        border: none;
        border-radius: 8px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .btn-sm {
        padding: 6px 12px;
        font-size: 14px;
        border-radius: 6px;
        margin: 2px;
    }

    .btn-warning {
        background-color: #ff9800;
        color: white;
        border: none;
    }

    .btn-warning:hover {
        background-color: #fb8c00;
    }

    .btn-danger {
        background-color: #f44336;
        color: white;
        border: none;
    }

    .btn-danger:hover {
        background-color: #d32f2f;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .table th, .table td {
        padding: 14px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    .table th {
        background-color: #3f51b5;
        color: white;
    }

    .table-hover tbody tr:hover {
        background-color: #f5f5f5;
    }

    .alert {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
        padding: 10px;
        border-radius: 8px;
        margin-bottom: 20px;
    }

    .alert button.close {
        background: none;
        border: none;
        color: #721c24;
        font-size: 1.5em;
        padding: 0;
        margin-left: 15px;
        cursor: pointer;
    }

    /* Animation Dossier Médical */
    .medical-card {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
        margin-bottom: 40px;
    }

    .file {
        perspective: 1500px;
    }

    .file > div {
        border-radius: 16px;
    }
</style>

<div class="container">
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show">
                ${errorMessage}
            <button type="button" class="close" data-dismiss="alert"><span>&times;</span></button>
        </div>
    </c:if>

    <div class="d-flex">
        <h2>Gestion des Dossiers Médicaux</h2>
        <a href="${pageContext.request.contextPath}/dossiers/new" class="btn btn-primary">
            <i data-feather="plus"></i> Nouveau
        </a>
    </div>

    <!-- Animation des dossiers -->
    <div class="medical-card">
        <section class="relative group flex flex-col items-center justify-center w-60 h-40">
            <div class="file relative w-60 h-40 cursor-pointer origin-bottom z-50">
                <div class="work-5 bg-amber-600 w-full h-full origin-top rounded-2xl rounded-tl-none group-hover:shadow-[0_20px_40px_rgba(0,0,0,.2)] transition-all ease duration-300 relative after:absolute after:content-[''] after:bottom-[99%] after:left-0 after:w-20 after:h-4 after:bg-amber-600 after:rounded-t-2xl before:absolute before:content-[''] before:-top-[15px] before:left-[75.5px] before:w-4 before:h-4 before:bg-amber-600 before:[clip-path:polygon(0_35%,0%_100%,50%_100%);]"></div>
                <div class="work-4 absolute inset-1 bg-zinc-400 rounded-2xl transition-all ease duration-300 origin-bottom select-none group-hover:[transform:rotateX(-20deg)]"></div>
                <div class="work-3 absolute inset-1 bg-zinc-300 rounded-2xl transition-all ease duration-300 origin-bottom group-hover:[transform:rotateX(-30deg)]"></div>
                <div class="work-2 absolute inset-1 bg-zinc-200 rounded-2xl transition-all ease duration-300 origin-bottom group-hover:[transform:rotateX(-38deg)]"></div>
                <div class="work-1 absolute bottom-0 bg-gradient-to-t from-amber-500 to-amber-400 w-full h-[156px] rounded-2xl rounded-tr-none after:absolute after:content-[''] after:bottom-[99%] after:right-0 after:w-[146px] after:h-[16px] after:bg-amber-400 after:rounded-t-2xl before:absolute before:content-[''] before:-top-[10px] before:right-[142px] before:size-3 before:bg-amber-400 before:[clip-path:polygon(100%_14%,50%_100%,100%_100%);] transition-all ease duration-300 origin-bottom flex items-end group-hover:shadow-[inset_0_20px_40px_#fbbf24,_inset_0_-20px_40px_#d97706] group-hover:[transform:rotateX(-46deg)_translateY(1px)]"></div>
            </div>

        </section>
    </div>

    <!-- Tableau des dossiers -->
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Enfant</th>
            <th>Type</th>
            <th>Remarques</th>
            <th>Score</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dossiers}" var="dossier">
            <tr>
                <td>${dossier.id}</td>
                <td>${dossier.enfantId}</td>
                <td>${dossier.typeEnfant}</td>
                <td>${dossier.remarquesMedecin}</td>
                <td>${dossier.sciResJeux}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/dossiers/edit?id=${dossier.id}" class="btn btn-sm btn-warning">✏️</a>
                    <a href="${pageContext.request.contextPath}/dossiers/delete?id=${dossier.id}" class="btn btn-sm btn-danger" onclick="return confirm('Confirmer la suppression ?');">🗑️</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="/WEB-INF/fragments/footer.jspf" %>
