document.addEventListener('DOMContentLoaded', function() {
    // Initialisation des icônes
    feather.replace();

    // Gestion de l'élément actif
    const currentPath = window.location.pathname;
    const links = document.querySelectorAll('.navbar__link');

    links.forEach(link => {
        if (link.getAttribute('href') === currentPath) {
            link.classList.add('active');
            link.closest('.navbar__item').classList.add('active-item');
        }
    });

    // Correction du padding du body
    const navbar = document.querySelector('.navbar');
    const updatePadding = () => {
        document.body.style.paddingLeft = navbar.offsetWidth + 'px';
    };

    updatePadding();
    window.addEventListener('resize', updatePadding);
});