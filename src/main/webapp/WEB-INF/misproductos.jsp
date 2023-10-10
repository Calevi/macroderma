<!DOCTYPE html>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="CSS/dashboard.css">
<meta charset="ISO-8859-1">
<title>Mis Productos</title>
</head>
<body>

    	<header>
        <nav>
            <div class="header">
                <c:choose>
                    <c:when test="${usuarioEnSesion != null}">
                        <p><c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">[ADMIN] </c:if>Bienvenid@, ${usuarioEnSesion.nombre}</p>
                        <a href="/logout" class="logout-button">Cerrar Sesión</a>
                        <!-- Agrega enlaces para administradores -->
                        <c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">
                            <a href="/misproductos" class="dashboard-link">Ver Mis Productos</a>
                            <a href="/subirproductos" class="dashboard-link">Subir Nuevos Productos</a>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <a href="/registrarse"  class="inicioregistro">Registrarse</a><p>|</p><a href="/login"  class="inicioregistro" >Iniciar Sesión</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </header>
    
    <table border="1">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="producto" items="${misProductos}">
            <tr>
                <td>${producto.nombre}</td>
                <td>${producto.descripcion}</td>
                <td>${producto.precio}</td>
                <td>
                    <a href="/editarproducto?id=${producto.id}">Editar</a>
                    <a href="/eliminarproducto?id=${producto.id}">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>