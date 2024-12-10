document.addEventListener('DOMContentLoaded', () => {
    // Función para manejar la redirección AJAX basada en el tipo de filtro
    const handleFilterAjax = (endpoint, categoryId) => {
        fetch(endpoint, {
            method: 'POST', // Usamos POST para mantener limpia la URL
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ IdCategoria: categoryId }) // Envía el ID de categoría en el cuerpo de la solicitud
        })
            .then(response => response.text())
            .then(html => {
                // Actualiza el contenido de la página con los productos filtrados
                document.querySelector('.main-content').innerHTML = html;
            })
            .catch(error => console.error(`Error al filtrar productos desde ${endpoint}:`, error));
    };

    // Manejar clics en checkboxes
    const initializeCheckboxEvents = () => {
        const checkboxes = document.querySelectorAll('.checkbox');

        checkboxes.forEach(checkbox => {
            const parentLi = checkbox.closest('li'); // Encuentra el elemento <li> padre
            checkbox.addEventListener('click', () => {
                const categoryId = parentLi.getAttribute('data-category'); // Obtén el ID de categoría
                const filterType = parentLi.closest('.filter-section').getAttribute('data-filter-type'); // Tipo de filtro

                // Determinar el endpoint según el tipo de filtro
                let endpoint;
                if (filterType === 'categoria') {
                    endpoint = '/Inicio/FiltrarPorCategoria';
                } else if (filterType === 'precio') {
                    endpoint = '/Inicio/FiltrarPorPrecio';
                } else if (filterType === 'mct') {
                    endpoint = '/Inicio/FiltrarPorMCT';
                }

                if (endpoint) {
                    handleFilterAjax(endpoint, categoryId); // Llama a la función genérica
                }
            });
        });
    };

    // Toggle de secciones de filtros
    const initializeFilterToggle = () => {
        document.querySelectorAll('.filter-title').forEach(title => {
            title.addEventListener('click', () => {
                const content = title.nextElementSibling;
                const icon = title.querySelector('.filter-toggle-icon');

                content.classList.toggle('active');
                icon.classList.toggle('rotated');
            });
        });
    };

    // Manejo de filtros seleccionados
    const initializeSelectedFilters = () => {
        const selectedFilters = new Set();
        const selectedFiltersContainer = document.getElementById('selected-filters');

        document.querySelectorAll('.filter-list li').forEach(item => {
            const checkbox = item.querySelector('.checkbox');

            item.addEventListener('click', () => {
                // Toggle checkbox
                checkbox.classList.toggle('checked');

                // Obtener detalles del filtro
                const filterType = item.closest('.filter-section').querySelector('h3').textContent;
                const filterValue = item.querySelector('span').textContent;
                const filterId = `${filterType}-${filterValue}`;

                if (checkbox.classList.contains('checked')) {
                    // Agregar filtro
                    selectedFilters.add(filterId);

                    // Crear etiqueta de filtro
                    const filterTag = document.createElement('div');
                    filterTag.classList.add('selected-filter-tag');
                    filterTag.id = filterId;
                    filterTag.innerHTML = `
                        ${filterValue}
                        <span class="remove-filter" data-filter="${filterId}">×</span>
                    `;

                    // Agregar al contenedor de filtros seleccionados
                    selectedFiltersContainer.appendChild(filterTag);
                } else {
                    // Eliminar filtro
                    selectedFilters.delete(filterId);

                    // Eliminar etiqueta de filtro
                    const filterTag = document.getElementById(filterId);
                    if (filterTag) {
                        filterTag.remove();
                    }
                }

                // Log de filtros seleccionados (puedes reemplazarlo con tu lógica)
                console.log('Selected Filters:', Array.from(selectedFilters));
            });
        });

        // Manejar la eliminación de etiquetas de filtro
        selectedFiltersContainer.addEventListener('click', (e) => {
            if (e.target.classList.contains('remove-filter')) {
                const filterId = e.target.getAttribute('data-filter');

                // Eliminar del conjunto de filtros seleccionados
                selectedFilters.delete(filterId);

                // Eliminar la etiqueta
                const filterTag = document.getElementById(filterId);
                if (filterTag) {
                    filterTag.remove();
                }

                // Deseleccionar el checkbox correspondiente
                const checkboxItem = document.querySelector(`.filter-list li:has(span:contains('${filterId.split('-')[1]}'))`);
                if (checkboxItem) {
                    const checkbox = checkboxItem.querySelector('.checkbox');
                    checkbox.classList.remove('checked');
                }
            }
        });
    };

    // Inicializar todas las funcionalidades
    initializeCheckboxEvents();
    initializeFilterToggle();
    initializeSelectedFilters();
});
