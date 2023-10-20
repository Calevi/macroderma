<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/dashboard.css">
<meta charset="ISO-8859-1">
<title>Resultados de B�squeda</title>
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
    <div class="columns">
        <nav class="main-nav">
            <ul>
            	<li><a href="/"><img src="img/cropped-IMG_2592.png" alt="Tu Logo" class="logonegro"></a></li>
                <li><a href="/tratamientos">Tratamientos</a></li>
                <li><a href="/productos">Productos</a></li>
                <li><a href="/nosotros">Nosotros</a></li>      
            </ul>
        </nav>
        
        <form action="/busqueda" method="get">
		    <div class="search-bar">
		        <input type="text" placeholder="Buscar productos..." name="nombre">
		        <input type="submit" value="Buscar">
		    </div>
		</form>
        
        <div class="cart">
            <a href="/carrito"><img src="/img/carrito.png" alt="Carrito de compras"></a>
            <span>${not empty carrito ? carrito.size() : 0}</span>
        </div>
    </div>


	
	
    <div class="product-grid">
        <c:forEach var="producto" items="${productos}">
            <div class="product-card">
            	<div class="product-image">
                	<img src="img/${producto.imagen}" alt="${producto.nombre}">
                </div>
                <a href="/verproducto/${producto.id}"><h3>${producto.nombre}</h3></a> 
                <p>${producto.descripcion}</p>
                
                <span class="price">Precio: $${producto.precio} CLP</span>
                <a href="#" class="buy-button">Comprar</a>
            </div>
        </c:forEach>
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