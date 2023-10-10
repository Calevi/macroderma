<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
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
                <li><a href="#nosotros">Nosotros</a></li>
                <li><a href="#experiencias">Experiencias</a></li>
            </ul>
        </nav>
        
        <div class="search-bar">
            <input type="text" placeholder="Buscar productos...">
            <button type="button">Buscar</button>
        </div>
        
         <div class="cart">
            <img src="img/carrito.png" alt="Carrito de compras">
            <span>0</span>
        </div>
    </div>
    <section class="hero">
        <div class="hero-content">
            <h1>Bienvenido a Nuestra Tienda de Cuidado de la Piel</h1>
            <p>Descubre nuestra amplia gama de tratamientos sobre cuidado de la piel para lucir radiante y saludable todos los d�as.</p>
            <a href="#productos" class="cta-button">Explora nuestros tratamientos</a>
        </div>
    </section>
    <section class="products">
        <!-- Contenido de la secci�n de productos -->
        <div class="product">
            <img src="" alt="Producto 1">
            <h3>Botox</h3>
            <p>Descripci�n del Producto 1.</p>
            <span class="price">$99.99</span>
            <a href="#" class="buy-button">Comprar</a>
        </div>

        <div class="product">
            <img src="https://us.123rf.com/450wm/pitinan/pitinan1806/pitinan180600494/104972017-hermosa-mujer-con-un-tratamiento-de-exfoliaci%C3%B3n-cosm%C3%A9tica-facial-de-un-dermat%C3%B3logo-profesional-en-un.jpg?ver=6" alt="Producto 2">
            <h3>Hilos tensores</h3>
            <p>Descripci�n del Producto 2.</p>
            <span class="price">$79.99</span>
            <a href="#" class="buy-button">Comprar</a>
        </div>

        <div class="product">
            <img src="" alt="Producto 1">
            <h3>Botox</h3>
            <p>Descripci�n del Producto 1.</p>
            <span class="price">$99.99</span>
            <a href="#" class="buy-button">Comprar</a>
        </div>
        <div class="product">
            <img src="" alt="Producto 1">
            <h3>Botox</h3>
            <p>Descripci�n del Producto 1.</p>
            <span class="price">$99.99</span>
            <a href="#" class="buy-button">Comprar</a>
        </div>
        <div class="product">
            <img src="" alt="Producto 1">
            <h3>Botox</h3>
            <p>Descripci�n del Producto 1.</p>
            <span class="price">$99.99</span>
            <a href="#" class="buy-button">Comprar</a>
        </div>
    </section>
    <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <img src="img/logoblanco.png" alt="Logo de la Empresa" class="logo">
            </div>
            <div class="footer-column">
                <h4>Servicios de SkinCare</h4>
                <ul>
                    <li><a href="#servicio1">Servicio 1</a></li>
                    <li><a href="#servicio2">Servicio 2</a></li>
                    <li><a href="#servicio3">Servicio 3</a></li>
                    <li><a href="#servicio4">Servicio 4</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>P�ginas Legales</h4>
                <ul>
                    <li><a href="/PyP">Pol�tica de Privacidad</a></li>
                    <li><a href="/condiciones">Condiciones de Uso</a></li>
                    <li><a href="#aviso-legal">Aviso Legal</a></li>
                </ul>
            </div>
        </div>
        <div class="social-section">
            <h4>S�guenos en Redes Sociales</h4>
            <div class="social-buttons">
                <a href="#" class="social-button facebook">Facebook</a>
                <a href="#" class="social-button twitter">Twitter</a>
                <a href="#" class="social-button instagram">Instagram</a>
                <a href="#" class="social-button linkedin">LinkedIn</a>
            </div>
        </div>
    </footer>
</body>
</html>