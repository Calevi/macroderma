<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrito de compras</title>
 <link rel="stylesheet" href="/CSS/dashboard.css">
 <link rel="stylesheet" href="/CSS/carrito.css">
 
</head>
<body>
	 <header>
        <nav>
            <div class="header">
                <c:choose>
                    <c:when test="${usuarioEnSesion != null}">
                        <p><c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">[ADMIN] </c:if>Bienvenid@, ${usuarioEnSesion.nombre}</p>
                        <a href="/logout" class="logout-button">Cerrar Sesion</a>
                        <!-- Agrega enlaces para administradores -->
                        <c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">
                            <a href="/misproductos" class="dashboard-link">Ver Mis Productos</a>
                            <a href="/subirproductos" class="dashboard-link">Subir Nuevos Productos</a>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <a href="/registrarse" class="inicioregistro">Registrarse</a><p>|</p><a href="/login" class="inicioregistro">Iniciar Sesion</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </header>
	
	
	<div class="columns">
        <nav class="main-nav">
            <ul>
            	<li><a href="/"><img src="/img/cropped-IMG_2592.png" alt="Tu Logo" class="logonegro"></a></li>
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
	
	
	
	
	       <div class="cart-content">
			    <c:choose>
			        <c:when test="${not empty carrito}">
			            <c:forEach items="${carrito}" var="producto">
			                <div>
			                    <img src="img/${producto.imagen}" alt="${producto.nombre}" class="imagenproducto">
			                    <div class="product-info">
			                        <h4>${producto.nombre}</h4>
			                        <h4 id="precio">$${producto.precio} CLP</h4>
			                    </div>
			                </div>
			            </c:forEach>
			        </c:when>
			        <c:otherwise>
			            <div class="carritovacio">
			                <h2 class="texto">No hay productos en tu carrito.</h2>
			            </div>
			        </c:otherwise>
			    </c:choose>
			</div>

			<div class="total-container">
		    <div class="total-label">Total:</div>
		    <div class="total-amount">$${total} CLP</div>
		    
		    <form:form action="/checkout" method="post" modelAttribute="nuevaCompra">
		    <input type="hidden" value="${usuarioEnSesion.id}" path="usuario">
		    <input type="hidden" value="${carrito}" path="productos">
		    <input type="submit" class="checkout-button" value="Pagar"> 
		    </form:form>
			</div>
	
	
	
	<footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="img/logoblanco.png" alt="Tu Logo" class="logo"></a>
            </div>
            <div class="footer-column">
                <ul>
                    <li>Macroderma estetica - All rights reserved.</li>
                    <li><img src="https://auroraestetica.cl/wp-content/uploads/2023/01/pagos.png"></li>
                    <li><img src="https://auroraestetica.cl/wp-content/uploads/2023/01/SEREMISALUDMET.png"></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Paginas Legales</h4>
                <ul>
                    <li><a href="/PyP">Politica de Privacidad</a></li>
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
        		<a href="https://wa.me/+56933876798" target="_blank"><img src="/img/wtsp.png" alt="WhatsApp"></a>
    		</div>
		</div>

    </footer>
</body>
</html>