<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../fragments/header.jspf" %>

<div class="container mt-5">
    <div class="alert alert-danger">
        <h4>Une erreur est survenue :</h4>
        <p>${errorMessage}</p>
    </div>
    <a href="${pageContext.request.contextPath}/dossiers" class="btn btn-primary">
        Retour à la liste
    </a>
</div>

<%@include file="../fragments/footer.jspf" %>