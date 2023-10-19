<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Cuidado de la piel</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
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
            <h1>Bienvenido a Nuestra Tienda de Cuidado de la Piel</h1>
            <p>Descubre nuestra amplia gama de productos de cuidado de la piel para lucir radiante y saludable todos los días.</p>
            <a href="/productos" class="cta-button">Explora nuestros productos</a>
        </div>
    </section>
    <section class="feature-section">
        <div class="feature-image">
            <img src="https://www.topdoctors.mx/files/Image/large/14dc75abcfecc85167564fdecd531666.jpg" alt="Imagen de Destacado">
        </div>
        <div class="feature-content">
            <h2>Descubre Nuestros Servicios de Cuidado de la Piel</h2>
            <p>Somos una tienda especializada en productos y tratamientos de cuidado de la piel. Ofrecemos una amplia gama de productos de alta calidad para ayudarte a mantener tu piel saludable y radiante. Nuestros expertos en cuidado de la piel están aquí para ayudarte a encontrar los mejores tratamientos para tus necesidades.</p>
            <a href="/tratamientos" class="cta-button">Ver tratamientos</a>
        </div>
    </section>
    <section class="gallery-section">
        <h2>Galería de Imágenes</h2>
        <div class="image-gallery">
            <img src="https://semprebella.com.ar/wp-content/uploads/2023/06/limpieza-de-cutis-profunda-estetica-sempre-bella.jpg" alt="Imagen 1">
            <img src="https://s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2019/07/11061838/Tratamientos-faciales.jpg" alt="Imagen 2">
            <img src="https://www.hedonai.com/wp-content/uploads/2018/07/peeling-prx.jpg" alt="Imagen 3">
            <img src="https://www.hedonai.com/wp-content/uploads/2021/11/diferencia-entre-peeling-y-exfoliante.jpg" alt="Imagen 4">
            <img src="https://d1kw0nx8pk9xzh.cloudfront.net/0001/fc77c508/resize-crop(w=1600;h=900):sharpen(level=0):output(format=jpeg)/up/dt/2023/05/Ojeras1_Vitriol.jpg" alt="Imagen 5">
            <img src="https://media.glamour.mx/photos/619b3334dd26e0d8fb30a666/16:9/w_2560%2Cc_limit/266948.jpg" alt="Imagen 6">
        </div>
    </section>
<footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="img/logoblanco.png" alt="Tu Logo" class="logo"></a>
            </div>
            <div class="footer-column">
                <ul>
                    <li>MacroDerma estetica © All rights reserved.</li>
                    <li><img src ="https://auroraestetica.cl/wp-content/uploads/2023/01/pagos.png"></li>
                    <li><img src ="https://auroraestetica.cl/wp-content/uploads/2023/01/SEREMISALUDMET.png"></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Páginas Legales</h4>
                <ul>
                    <li><a href="/PyP">Política de Privacidad</a></li>
                    <li><a href="/condiciones">Condiciones de uso</a></li>
                    <li><a href="/aviso">Aviso Legal</a></li>
                </ul>
            </div>
        </div>
        <div class="social-section">
            <h4>Síguenos en Instagram</h4>
            <div class="social-buttons">
                <a href="https://www.instagram.com/macroderma/" class="social-button instagram" target="_blank">Instagram</a>  
                <a href="https://wa.me/+56933876798" class="social-button whatsapp" target="_blank">WhatsApp</a>          
            </div>
        </div>
    </footer>
</body>
</html>