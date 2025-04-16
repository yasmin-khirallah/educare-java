<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/fragments/header.jspf" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Rendez-vous</title>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #eaeef6;
            font-family: 'Open Sans', sans-serif;
            margin-left: 25px;
            padding: 0rem;
        }

        h2, h3 {
            color: #406ff3;
            margin-bottom: 2px;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.95rem;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .btn-primary {
            background-color: #406ff3;
            color: white;
            margin-bottom: 5px;
        }

        .btn-primary:hover {
            background-color: #2e5ae2;
        }

        .btn-warning {
            background-color: #ffc107;
            color: white;
            margin-right: 0.5rem;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
            overflow: hidden;
        }

        .table thead {
            background-color: #406ff3;
            color: white;
        }

        .table th, .table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        .table tbody tr:hover {
            background-color: #f3f7fd;
        }

        .flex-container {
            display: flex;
            justify-content: space-between;
            gap: 2rem;
            align-items: flex-start;
        }

        .left-panel {
            flex: 3;
            min-width: 650px;
        }

        .right-panel {
            flex: 2;
            background-color: #fff;
            padding: 1rem;
            border-left: 2px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.03);
            max-width: 500px;
            height: 100%;
        }

        #calendar {
            width: 100%;
            height: 100px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

    </style>
</head>
<body>

<div class="container flex-container">
    <!-- Tableau des rendez-vous -->
    <div class="left-panel">
        <h2>Liste des Rendez-vous</h2><br>

        <a href="rendezvous?action=new" class="btn btn-primary">➕ Nouveau RDV</a><br><br>

        <table class="table">
            <thead>
            <tr>
                <th>Enfant</th>
                <th>Date</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${rendezVousList}" var="rdv">
                <tr>
                    <td>${rdv.enfantId}</td>
                    <td>${rdv.date}</td>
                    <td>${rdv.description}</td>
                    <td>
                        <div class="action-buttons">
                            <a href="rendezvous?action=edit&id=${rdv.id}" class="btn btn-warning" title="Modifier">✏️</a>
                            <a href="rendezvous?action=delete&id=${rdv.id}"
                               class="btn btn-danger"
                               onclick="return confirm('Supprimer ce RDV ?')"
                               title="Supprimer">🗑️</a>
                        </div>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Calendrier -->
    <div class="right-panel">
        <h3>📅 Calendrier</h3>
        <div id="calendar"></div>
    </div>
</div>

<%@ include file="/WEB-INF/fragments/footer.jspf" %>

<!-- FullCalendar JS -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const calendarEl = document.getElementById('calendar');
        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'fr',
            height: 600,
            events: [
                <c:forEach items="${rendezVousList}" var="rdv">
                {
                    title: "${rdv.description}",
                    start: "${rdv.date}"
                },
                </c:forEach>
            ]
        });
        calendar.render();
    });
</script>
</body>
</html>
