<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aviso Legal - SkinCare Chile</title>
    <!-- Enlace al archivo CSS externo -->
    <link rel="stylesheet" href="CSS/dashboard.css">
</head>
<body>
    <header>
	    <nav>
	        <div class="header">
	            <c:choose>
	                <c:when test="${usuarioEnSesion != null}">
	                    <p><c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">[ADMIN] </c:if>Bienvenid@, ${usuarioEnSesion.nombre}</p>
	                    <a href="/logout" class="logout-button">Cerrar Sesi�n</a>
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
    <section class="hero">
        <div class="hero-content">
            <h1>Aviso Legal</h1>
            <a href="/" class="cta-button">Pagina principal</a>
        </div>
    </section>
    
    <section class="legal">
        <h2>Aviso Legal</h2>
        <p>SkinCare Chile es una empresa registrada en Chile bajo el nombre "Nombre de la Empresa SPA" y con domicilio en:</p>
        <p>Direcci�n: Calle Ejemplo #1234, Santiago, Chile</p>
        <p>Tel�fono de Contacto: +56 9 1234 5678</p>
        <p>Correo Electr�nico: contacto@ejemplo.com</p>

        <p>Este sitio web es propiedad de SkinCare Chile y su uso est� sujeto a los siguientes t�rminos y condiciones:</p>
    </section>

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
            <h4>S�guenos en Instagram</h4>
            <div class="social-buttons">
                <a href="https://www.instagram.com/macroderma/" class="social-button instagram" target="_blank">Instagram</a>  
                <a href="https://wa.me/+56933876798" class="social-button whatsapp" target="_blank">WhatsApp</a>          
            </div>
        </div>
    </footer>
</body>
</html>