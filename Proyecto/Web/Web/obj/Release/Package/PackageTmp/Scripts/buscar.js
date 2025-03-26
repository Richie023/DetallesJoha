// Función para hacer la búsqueda
function buscarProductos() {
    var categoria = $("#categoriaSelect").val();
    var nombreProducto = $("#searchInput").val();

    // Hacer la llamada AJAX para consultar productos
    $.ajax({
        url: '@Url.Action("ConsultarProductos", "Buscar")',
        type: 'GET',
        data: { nombre: nombreProducto },
        success: function (respuesta) {
            if (respuesta.Codigo === 0) {
                // Mostrar productos
                var productosHTML = "";
                respuesta.Datos.forEach(function (producto) {
                    productosHTML += "<div class='producto'>";
                    productosHTML += "<h3>" + producto.NombreProducto + "</h3>";
                    productosHTML += "<p>Precio: $" + producto.Precio + "</p>";
                    productosHTML += "<p>Descripción: " + producto.Descripcion + "</p>";
                    productosHTML += "<p>Categoría: " + producto.NombreCategoria + "</p>";
                    productosHTML += "</div>";
                });
                $("#productosResultados").html(productosHTML);
            } else {
                $("#productosResultados").html("<p>No se encontraron productos.</p>");
            }
        },
        error: function () {
            $("#productosResultados").html("<p>Se presentó un error en el sistema.</p>");
        }
    });
}