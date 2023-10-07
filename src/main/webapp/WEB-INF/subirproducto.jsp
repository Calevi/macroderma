<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Cuidado de la piel</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
    <link rel="stylesheet" href="CSS/formularioproducto.css">
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

    <div class="container">
        <h2>Subir Nuevo Producto</h2>
        <form:form modelAttribute="nuevoProducto" action="/nuevoproducto" method="post" enctype="multipart/form-data">
			    <div class="form-group">
			        <form:label path="nombre">Nombre:</form:label>
			        <form:input path="nombre" id="nombre" class="form-control" />
			        <form:errors path="nombre" cssClass="error" />
			    </div>
			    <div class="form-group">
			        <form:label path="descripcion">Descripcion:</form:label>
			        <form:input path="descripcion" id="descripcion" class="form-control" />
			        <form:errors path="descripcion" cssClass="error" />
			    </div>
			    <div class="form-group">
			        <form:label path="precio">Precio:</form:label>
			        <form:input type="number" path="precio" id="precio" class="form-control" />
			        <form:errors path="precio" cssClass="error" />
			    </div>
			    <div class="form-group">
		        	<label>Imagen del producto:</label>
		        	<input type="file" class="form-control" id="imagenProducto" name="image"/>
		    	</div>
			    <button type="submit" class="btn btn-primary">Guardar Producto</button>
		</form:form>


        <c:if test="${not empty mensaje}">
            <p>${mensaje}</p>
        </c:if>
    </div>
</body>
</html>
