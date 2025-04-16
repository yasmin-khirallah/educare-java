<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/fragments/header.jspf" %>

<div class="messenger-container">
    <!-- Liste des parents (colonne gauche) -->
    <div class="sidebar">
        <h4 class="mb-3"> Liste des  Parents</h4>
        <input type="text" id="searchInput" placeholder="Rechercher..." onkeyup="filterParents()" class="search-box">
        <div class="parent-list" id="parentList">
            <c:forEach items="${parents}" var="parent">
                <div class="parent-item" onclick="openConversation('${parent.id}', '${parent.prenom} ${parent.nom}')">
                    <c:choose>
                        <c:when test="${not empty parent.photoProfil}">
                            <img src="${pageContext.request.contextPath}/uploads/${parent.photoProfil}" class="avatar" />
                        </c:when>
                        <c:otherwise>
                            <div class="default-avatar"><i class="fas fa-user-circle fa-2x"></i></div>
                        </c:otherwise>
                    </c:choose>
                    <span>${parent.prenom} ${parent.nom}</span>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Zone de discussion (colonne droite) -->
    <div class="chat-area">
        <div class="chat-header">
            <h5 id="chatTitle">Choisissez un parent</h5>
        </div>
        <div class="chat-body" id="chatBody">
            <p class="text-muted">Aucune conversation sélectionnée.</p>
        </div>
        <div class="chat-footer">
            <input type="text" id="messageInput" placeholder="Écrire un message..." />
            <button onclick="sendMessage()">Envoyer</button>
        </div>
    </div>
</div>

<script>
    function filterParents() {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        document.querySelectorAll('.parent-item').forEach(item => {
            const name = item.textContent.toLowerCase();
            item.style.display = name.includes(searchTerm) ? 'flex' : 'none';
        });
    }

    function openConversation(id, name) {
        document.getElementById('chatTitle').innerText = name;
        const body = document.getElementById('chatBody');
        body.innerHTML = '';

        // Exemple de messages fictifs (à remplacer par un appel Ajax)
        const messages = [
            { text: "Bonjour, avez-vous reçu les devoirs ?", sender: "parent" },
            { text: "Oui, je les ai bien reçus, merci !", sender: "me" },
            { text: "N'hésitez pas si vous avez des questions.", sender: "parent" }
        ];

        messages.forEach(msg => {
            const bubble = document.createElement('div');
            bubble.className = msg.sender === "me" ? "bubble me" : "bubble";
            bubble.innerText = msg.text;
            body.appendChild(bubble);
        });

        body.scrollTop = body.scrollHeight;
    }

    function sendMessage() {
        const input = document.getElementById("messageInput");
        const text = input.value.trim();
        if (!text) return;

        const bubble = document.createElement("div");
        bubble.className = "bubble me";
        bubble.innerText = text;
        document.getElementById("chatBody").appendChild(bubble);
        input.value = "";

        const body = document.getElementById("chatBody");
        body.scrollTop = body.scrollHeight;
    }
</script>

<style>
    .messenger-container {
        display: flex;
        height: 85vh;
        border: 1px solid #ccc;
        border-radius: 8px;
        overflow: hidden;
        margin: 20px;
        font-family: 'Segoe UI', sans-serif;
    }

    .sidebar {
        width: 30%;
        background-color: #f7f7f7;
        padding: 20px;
        border-right: 1px solid #ccc;
        overflow-y: auto;
    }

    .chat-area {
        width: 70%;
        display: flex;
        flex-direction: column;
    }

    .chat-header {
        background-color: #031381;
        color: white;
        padding: 15px;
    }

    .chat-body {
        flex-grow: 1;
        padding: 20px;
        background: #e5f6ff;
        overflow-y: auto;
    }

    .chat-footer {
        padding: 10px;
        background: #f0f0f0;
        display: flex;
    }

    .chat-footer input {
        flex-grow: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 20px;
        margin-right: 10px;
    }

    .chat-footer button {
        background: #00b8ff;
        border: none;
        padding: 10px 20px;
        color: white;
        border-radius: 20px;
        cursor: pointer;
    }

    .search-box {
        width: 100%;
        padding: 8px 12px;
        margin-bottom: 15px;
        border-radius: 20px;
        border: 1px solid #ccc;
    }

    .parent-list {
        max-height: 70vh;
        overflow-y: auto;
    }

    .parent-item {
        display: flex;
        align-items: center;
        padding: 10px;
        border-radius: 10px;
        margin-bottom: 10px;
        cursor: pointer;
        transition: background 0.2s ease;
    }

    .parent-item:hover {
        background: #e0f7ff;
    }

    .avatar, .default-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
        margin-right: 10px;
    }

    .default-avatar {
        display: flex;
        justify-content: center;
        align-items: center;
        background: #ddd;
        color: #888;
    }

    .bubble {
        max-width: 60%;
        background: #ffffff;
        margin-bottom: 10px;
        padding: 10px 15px;
        border-radius: 15px;
        position: relative;
        width: fit-content;
        clear: both;
    }

    .bubble.me {
        background: #00b8ff;
        color: white;
        align-self: flex-end;
        margin-left: auto;
    }
</style>

<%@include file="/WEB-INF/fragments/footer.jspf" %>
