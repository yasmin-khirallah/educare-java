<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/fragments/header.jspf" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier le Dossier</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f8f9fb, #e2e8f0);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .form-container {
            max-width: 700px;
            width: 100%;
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border: 1px solid #d1d5db;
            animation: fadeIn 0.7s ease-in-out;
        }

        .form-container h2 {
            text-align: center;
            color: #1e40af;
            font-size: 24px;
            margin-bottom: 24px;
            font-weight: bold;
        }

        .form-container span {
            font-style: italic;
            color: #4b5563;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 10px;
            color: #374151;
            font-size: 14px;
        }

        textarea {
            width: 100%;
            padding: 15px;
            border-radius: 12px;
            border: 1px solid #cbd5e1;
            font-size: 16px;
            background-color: #f9fafb;
            transition: all 0.3s ease;
            resize: vertical;
        }

        textarea:focus {
            outline: none;
            border-color: #3b82f6;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
        }

        .btn-group {
            margin-top: 30px;
            display: flex;
            justify-content: flex-end;
            gap: 15px;
        }

        .btn {
            padding: 10px 20px;
            font-weight: 600;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        .btn-cancel {
            background: none;
            color: #6b7280;
        }

        .btn-cancel:hover {
            color: #ef4444;
            transform: scale(1.05);
        }

        .btn-submit {
            background-color: #2563eb;
            color: white;
        }

        .btn-submit:hover {
            background-color: #1d4ed8;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .form-container {
                padding: 25px;
            }

            .form-container h2 {
                font-size: 20px;
            }

            textarea {
                font-size: 14px;
            }

            .btn {
                font-size: 14px;
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>

<form action="jeux" method="post" class="form-container">
    <input type="hidden" name="id" value="${jeu.id}" />

    <h2>✍️ Modifier le Dossier : <span>${jeu.nomJeu}</span></h2>

    <div class="mb-6">
        <label for="description">Nouvelle description du cas :</label>
        <textarea
                id="description"
                name="description"
                rows="6"
                placeholder="Détaillez les antécédents, symptômes ou remarques importantes..."
        >${jeu.description}</textarea>
    </div>

    <div class="btn-group">
        <a href="jeux" class="btn btn-cancel">❌ Annuler</a>
        <button type="submit" class="btn btn-submit">💾 Enregistrer</button>
    </div>
</form>

</body>
</html>
