document.addEventListener('DOMContentLoaded', function() {
    // Gestion des messages flash
    const flashMessages = document.querySelectorAll('.flash-message');
    flashMessages.forEach(msg => {
        setTimeout(() => {
            msg.style.opacity = '0';
            setTimeout(() => msg.remove(), 500);
        }, 3000);
    });

    // Confirmation avant suppression
    const deleteButtons = document.querySelectorAll('.btn-delete');
    deleteButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            if (!confirm('Êtes-vous sûr de vouloir effectuer cette action ?')) {
                e.preventDefault();
            }
        });
    });
});
// Chemin : src/main/webapp/static/js/main.js
document.addEventListener('DOMContentLoaded', function() {
    // Animation au survol des lignes
    document.querySelectorAll('tr').forEach(row => {
        row.style.transition = 'all 0.3s ease';
        row.addEventListener('mouseover', () => {
            row.style.transform = 'scale(1.02)';
            row.style.boxShadow = '0 2px 8px rgba(0,0,0,0.1)';
        });
        row.addEventListener('mouseout', () => {
            row.style.transform = 'scale(1)';
            row.style.boxShadow = 'none';
        });
    });

    // Confirmation avant suppression
    document.querySelectorAll('.btn-danger').forEach(btn => {
        btn.addEventListener('click', (e) => {
            if (!confirm('Cette action est irréversible. Confirmer la suppression ?')) {
                e.preventDefault();
            }
        });
    });
});