
        document.querySelectorAll('.filter-title').forEach(button => {
        button.addEventListener('click', () => {
            // Toggle active class en el título
            button.classList.toggle('active');

            // Obtener el contenido siguiente
            const content = button.nextElementSibling;

            // Toggle show class en el contenido
            content.classList.toggle('show');
        });
        });
