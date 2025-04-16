<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/fragments/header.jspf" %>

<style>
    /* Styles spécifiques à l'animation */
    body {
        font-family: "Segoe UI", sans-serif;
        background-color: #f9f9f9;
        margin-left:170px;
        color: #333;
        line-height: 1.7;
        padding: 30px;
    }
    h1, h2 {
        color: #2c3e50;
    }
    .section {
        background: #ffffff;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 25px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.08);
    }
    a {
        color: #3498db;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
    .loader-container {
        position: absolute;
        top: 250px;
        left: 110px;
        z-index: 1000;
    }

    .loader {
        margin-left: 90px;
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .inline-block {
        display: inline-block;
    }

    .w-2 {
        width: 0.3em;
    }

    /* Animations */
    .dash {
        animation: dashArray 2s ease-in-out infinite,
        dashOffset 2s linear infinite;
    }

    .spin {
        animation: spinDashArray 2s ease-in-out infinite,
        spin 8s ease-in-out infinite,
        dashOffset 2s linear infinite;
        transform-origin: center;
    }

    @keyframes dashArray {
        0% { stroke-dasharray: 0 1 359 0; }
        50% { stroke-dasharray: 0 359 1 0; }
        100% { stroke-dasharray: 359 1 0 0; }
    }

    @keyframes spinDashArray {
        0% { stroke-dasharray: 270 90; }
        50% { stroke-dasharray: 0 360; }
        100% { stroke-dasharray: 270 90; }
    }

    @keyframes dashOffset {
        0% { stroke-dashoffset: 365; }
        100% { stroke-dashoffset: 5; }
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
</style>

<div class="loader-container"class="content-wrapper">
    <div class="loader">
        <!-- Gardez seulement les lettres EDUCARE -->
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 64 64" height="40" width="40" class="inline-block">
            <!-- E -->
            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="4" stroke="#973BED" d="M 4,4 h 56 v 8 H 12 v 16 h 40 v 8 H 12 v 16 h 48 v 8 H 4 Z" class="dash" pathLength="360"/>
        </svg>

        <!-- D -->
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 64 64" height="40" width="40" class="inline-block">
            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="4" stroke="#FFC800" d="M 4,4 h 32 a 28,28 0 0 1 0,56 H 4 Z" class="dash" pathLength="360"/>
        </svg>

        <!-- U -->
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 64 64" height="40" width="40" class="inline-block">
            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="4" stroke="#00E0ED" d="M 4,60 V 4 h 8 v 48 h 40 v 8 Z" class="dash" pathLength="360"/>
        </svg>

        <!-- C -->
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 64 64" height="40" width="40" class="inline-block">
            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="4" stroke="#FF6B6B" d="M 32,4 a 28,28 0 0 0 -28,28 a 28,28 0 0 0 28,28" class="spin" pathLength="360"/>
        </svg>

        <!-- A -->
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 64 64" height="40" width="40" class="inline-block">
            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="4" stroke="#FF1493" d="M 4,60 L 32,4 L 60,60 M 32,4 L 32,60" class="dash" pathLength="360"/>
        </svg>

        <!-- R -->
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 64 64" height="40" width="40" class="inline-block">
            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="4" stroke="#00CED1" d="M 4,4 h 32 a 28,28 0 0 1 0,56 H 4 Z M 32,32 L 60,60" class="dash" pathLength="360"/>
        </svg>

        <!-- E -->
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 64 64" height="40" width="40" class="inline-block">
            <path stroke-linejoin="round" stroke-linecap="round" stroke-width="4" stroke="#FF4500" d="M 4,4 h 56 v 8 H 12 v 16 h 40 v 8 H 12 v 16 h 48 v 8 H 4 Z" class="dash" pathLength="360"/>
        </svg>
    </div>
</div>

<div class="content-wrapper" style="margin-top: 150px;">
    <h2>Bienvenue sur la plateforme Educare</h2>
    <h1>🌿 EduCare : L’intelligence  du service de l’éducation tunisienne 🌿</h1>

    <div class="section">
        <p><strong>EduCare</strong> est une société tunisienne dédiée à la <strong>formation</strong> et au <strong>soutien en éducation positive</strong>. Elle s'adresse aux <strong>parents</strong>, <strong>enseignants</strong> et <strong>animateurs</strong>, leur offrant des outils pour construire un monde éducatif plus <em>bienveillant</em>, plus <em>humain</em>, plus <em>lumineux</em>. ✨</p>

        <p>Sur leur site officiel :
            <a href="https://www.educare.tn" target="_blank">www.educare.tn</a>,<br>
            et leur page Instagram :
            <a href="https://www.instagram.com/educare.tunisie/" target="_blank">@educare.tunisie</a>,<br>
            <strong>EduCare</strong> propose un éventail de formations : parentalité consciente, gestion émotionnelle, approches pédagogiques innovantes...
        </p>
    </div>

    <div class="section">
        <h2> Et les enfants sourds ? Le silence comme langue du cœur 🌿💙</h2>
        <p>
            Bien que <strong>EduCare</strong> ne propose pas encore de programmes spécifiques pour les <strong>enfants sourds</strong>, des initiatives tunisiennes existent :
        </p>
        <ul>
            <li>
                L’<strong>Académie Sportive et Éducative des Sourds de Tunis</strong> propose des activités adaptées :
                <a href="https://www.facebook.com/AcademieSportiveEtEducativeDesSourdsDeTunis" target="_blank">
                    Facebook
                </a>
            </li>
            <li>
                Un <strong>modèle éducatif trilingue et biculturel</strong> est aussi à l’étude, combinant Langue des Signes Tunisienne, Arabe Dialectal et Arabe Standard Moderne.
                <br>
                Source :
                <a href="https://www.lpl-aix.fr/actualite/quel-modele-educatif-pour-les-enfants-sourds-en-tunisie/?utm_source=chatgpt.com" target="_blank">
                    En savoir plus
                </a>
            </li>
        </ul>

        <p>Un jour peut-être, <strong>EduCare</strong> fera danser ses ateliers au rythme des mains qui parlent, des yeux qui écoutent, et des cœurs qui comprennent...</p>
    </div>

    <div class="section">
        <h2>🌼 Vers une inclusion plus tendre avec EduCare 🌼</h2>
        <p>
            Pourquoi ne pas rêver que <strong>EduCare</strong> ouvre demain ses bras aux enfants du silence ? Que les mains deviennent mots, et les gestes des poèmes éducatifs ?<br>
            L’inclusion commence par l’intention, et <strong>EduCare</strong>, avec sa vision positive, pourrait un jour accueillir ces enfants dans son jardin d’éducation.
        </p>
        <p>
            Pour en savoir plus ou contacter <strong>EduCare</strong> :
        <ul>
            <li>Site : <a href="https://www.educare.tn" target="_blank">www.educare.tn</a></li>
            <li>Instagram : <a href="https://www.instagram.com/educare.tunisie/" target="_blank">@educare.tunisie</a></li>
        </ul>
        </p>
    </div>

    <div class="footer">
        🌙 Que l’éducation soit une mélodie que tous les enfants, avec ou sans voix, puissent danser ensemble... dans le silence ou dans les mots, mais toujours dans l’amour.
    </div>
</div>



<%@ include file="/WEB-INF/fragments/footer.jspf" %>