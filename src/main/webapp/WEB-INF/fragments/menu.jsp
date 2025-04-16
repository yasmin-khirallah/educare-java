<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Menu Magique</title>
    <script src="https://unpkg.com/feather-icons"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@600&display=swap');

        :root {
            --border-radius: 10px;
            --spacer: 1rem;
            --primary: #406ff3;
            --text: #6a778e;
            --link-height: calc(var(--spacer) * 3.5);
            --transition-time: 250ms;
        }

        body {
            margin: 0;
            font-family: 'Open Sans', sans-serif;
            background: #eaeef6;
            padding-left: calc(var(--spacer) * 7); /* Espace à gauche pour la navbar */
        }

        .navbar {
            margin-top: 100px;
            position: fixed; /* <-- ici la magie opère */
            top: calc(var(--spacer) * 4);
            left: var(--spacer);
            background: #fff;
            border-radius: var(--border-radius);
            padding: var(--spacer) 0;
            box-shadow: 0 0 40px rgba(0, 0, 0, 0.05);
            max-height: calc(100% - calc(var(--spacer) * 4));
            z-index: 1000;
        }



        .navbar__menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .navbar__item {
            position: relative;
        }

        .navbar__item:hover::before {
            content: '';
            position: absolute;
            top: 50%;
            left: calc(var(--spacer) * 0.5);
            transform: translateY(-50%);
            width: var(--link-height);
            height: var(--link-height);
            background: var(--primary);
            border-radius: calc(var(--border-radius) * 1.75);
            z-index: -1;
            transition: var(--transition-time);
            opacity: 1;
        }

        .navbar__link {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            height: var(--link-height);
            width: calc(var(--spacer) * 5.5);
            color: var(--text);
            transition: var(--transition-time);
            text-decoration: none;
        }

        .navbar__link i {
            z-index: 2;
        }

        .navbar__link span {
            position: absolute;
            left: 100%;
            transform: translateX(calc(-1 * var(--spacer) * 3));
            margin-left: 1rem;
            opacity: 0;
            pointer-events: none;
            color: var(--primary);
            background: #fff;
            padding: calc(var(--spacer) * 0.75);
            transition: var(--transition-time);
            border-radius: calc(var(--border-radius) * 1.75);
            white-space: nowrap;
            z-index: 1;
        }

        .navbar__link:hover {
            color: #fff;
        }

        .navbar__link:hover span {
            opacity: 1;
            transform: translateX(0);
        }
    </style>
</head>
<body>
<nav class="navbar">
    <ul class="navbar__menu">
        <li class="navbar__item">
            <a href="http://localhost:8080/Educare/" class="navbar__link">
                <i data-feather="home"></i><span>Accueil</span>
            </a>
        </li>
        <li class="navbar__item">
            <a href="${pageContext.request.contextPath}/apropos" class="navbar__link">
                <i data-feather="user"></i><span>Inf</span>
            </a>
        </li>
        <li class="navbar__item">
            <a href="${pageContext.request.contextPath}/rendezvous" class="navbar__link">
                <i data-feather="calendar"></i><span>Rendez-vous</span>
            </a>
        </li>
        <li class="navbar__item">
            <a href="${pageContext.request.contextPath}/dossiers" class="navbar__link">
                <i data-feather="folder"></i><span>Dossiers médicaux</span>
            </a>
        </li>
        <li class="navbar__item">
            <a href="${pageContext.request.contextPath}/jeux" class="navbar__link">
                <i data-feather="activity"></i><span>Jeux éducatifs</span>
            </a>
        </li>
        <li class="navbar__item">
            <a href="${pageContext.request.contextPath}/messagerie" class="navbar__link">
                <i data-feather="message-circle"></i><span>Messagerie</span>
            </a>
        </li>
        <li class="navbar__item">
            <a href="${pageContext.request.contextPath}/apropos" class="navbar__link">
                <i data-feather="user-check"></i><span>Assistant</span>
            </a>
        </li>
        <li class="navbar__item">
            <a href="${pageContext.request.contextPath}/apropos" class="navbar__link">
                <i data-feather="mail"></i><span>Mail</span>
            </a>
        </li>
    </ul>
</nav>

<script>
    feather.replace();
</script>
</body>
</html>
