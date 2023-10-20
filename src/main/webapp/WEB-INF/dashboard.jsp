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
    <section class="hero">
        <div class="hero-content">
            <h1>Bienvenido a Nuestra Tienda de Cuidado de la Piel</h1>
            <p>Descubre nuestra amplia gama de productos de cuidado de la piel para lucir radiante y saludable todos los d�as.</p>
            <a href="/productos" class="cta-button">Explora nuestros productos</a>
        </div>
    </section>
    <section class="feature-section">
        <div class="feature-image">
            <img src="https://www.topdoctors.mx/files/Image/large/14dc75abcfecc85167564fdecd531666.jpg" alt="Imagen de Destacado">
        </div>
        <div class="feature-content">
            <h2>Descubre Nuestros Servicios de Cuidado de la Piel</h2>
            <p>Somos una tienda especializada en productos y tratamientos de cuidado de la piel. Ofrecemos una amplia gama de productos de alta calidad para ayudarte a mantener tu piel saludable y radiante. Nuestros expertos en cuidado de la piel est�n aqu� para ayudarte a encontrar los mejores tratamientos para tus necesidades.</p>
            <a href="/tratamientos" class="cta-button">Ver tratamientos</a>
        </div>
    </section>
    <section class="gallery-section">
        <h2>Galer�a de Im�genes</h2>
        <div class="image-gallery">
            <img src="/img/1.PNG" alt="Tratamiento de aumento de labios con acido hyaluronico">
        	</img src="img/2.png" alt="Tratamiento de arminizacion facial con acido hyaluronico">
        	</img src="img/9.jpg" alt="Tratamiento con toxina botulinica">
        	</img src="img/3.png" alt="Tratamiento con toxina botulinica en frente">
        	</img src="img/4.png" alt="Tratamiento criolipolisis">
        	</img src="img/7.png" alt="Tratamiento de aumento de labios con acido hyaluronico">
        	</img src="img/8.png" alt="Tratamiento de aumento de rinomodelacion con acido hyaluronico">
			<img src="/img/5.png" alt="Tratamiento criolipolisis">
			<img src="/img/6.png" alt="Tratamiento de depilación, torso de hombre">
        </div>
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