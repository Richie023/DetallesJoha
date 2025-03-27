document.addEventListener('DOMContentLoaded', function () {
    // Seleccionar todos los títulos de las secciones de filtro
    const filterTitles = document.querySelectorAll('.filter-title');

    // Inicializar el estado del acordeón al cargar la página
    filterTitles.forEach(function (title) {
        const filterContent = title.nextElementSibling;

        // Establecer explícitamente el estilo inicial
        // Por defecto todo estará cerrado
        filterContent.style.maxHeight = '0';
    });

    // Agregar evento click a cada título
    filterTitles.forEach(function (title) {
        title.addEventListener('click', function (e) {
            e.preventDefault(); // Prevenir comportamiento predeterminado del enlace si existe

            // Alternar la clase active en el título
            this.classList.toggle('active');

            // Obtener el contenido asociado a este título
            const content = this.nextElementSibling;

            // Alternar la visibilidad del contenido
            if (this.classList.contains('active')) {
                // Si está activo, mostrar el contenido
                content.style.maxHeight = content.scrollHeight + 'px';
            } else {
                // Si no está activo, ocultar el contenido
                content.style.maxHeight = '0';
            }

            // Opcional: activar/desactivar la sección padre también
            const parentSection = this.parentElement;
            if (parentSection.classList.contains('filter-section')) {
                parentSection.classList.toggle('active');
            }
        });
    });

    // Para depuración - verifica si el script está funcionando
    console.log('Script de acordeón inicializado con ' + filterTitles.length + ' secciones');
});