<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar producto</title>
<link rel="stylesheet" href="/CSS/dashboard.css">
<link rel="stylesheet" href="/CSS/formularioproducto.css">
</head>
<body>
	    <header>
        <nav>
            <div class="header">
                <c:choose>
                    <c:when test="${usuarioEnSesion != null}">
                        <p><c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">[ADMIN] </c:if>Bienvenid@, ${usuarioEnSesion.nombre}</p>
                        <a href="/logout" class="logout-button">Cerrar Sesi�n</a>
                        <!-- Agrega enlaces para administradores -->
                        <c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">
                            <a href="/misproductos" class="dashboard-link">Ver Mis Productos</a>
                            <a href="/subirproductos" class="dashboard-link">Subir Nuevos Productos</a>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <a href="/registrarse"  class="inicioregistro">Registrarse</a><p>|</p><a href="/login"  class="inicioregistro" >Iniciar Sesi�n</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </header>

    <div class="container">
        <h2>Editar Producto</h2>
        <form:form modelAttribute="producto" action="/actualizar/${producto.id}" method="post" enctype="multipart/form-data">
        		<input type="hidden" name="_method" value="PUT">
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
			        <form:label path="stock">Stock:</form:label>
			        <form:input type="number" path="stock" id="precio" class="form-control" />
			        <form:errors path="stock" cssClass="error" />
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
    <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="img/logoblanco.png" alt="Tu Logo" class="logo"></a>
            </div>
            <div class="footer-column">
                <ul>
                    <li>MacroDerma estetica � All rights reserved.</li>
                    <li><img src ="https://auroraestetica.cl/wp-content/uploads/2023/01/pagos.png"></li>
                    <li><img src ="https://auroraestetica.cl/wp-content/uploads/2023/01/SEREMISALUDMET.png"></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>P�ginas Legales</h4>
                <ul>
                    <li><a href="/PyP">Pol�tica de Privacidad</a></li>
                    <li><a href="/condiciones">Condiciones de uso</a></li>
                    <li><a href="/aviso">Aviso Legal</a></li>
                </ul>
            </div>
        </div>
        <div class="social-section">
    		<div class="social-button-container">
				<a href="https://www.instagram.com/macroderma/" target="_blank"><img src="/img/instagram.png" alt="Instagram"></a>
    		</div>
    		<div class="social-button-container">
        		<a href="https://wa.me/+56933876798" target="_blank"><img src=""/img/wtsp.png" alt="WhatsApp"></a>
    		</div>
		</div>
    </footer>
</body>
</html>