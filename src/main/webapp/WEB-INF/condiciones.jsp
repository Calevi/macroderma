<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Condiciones de Uso - SkinCare Chile</title>
    <!-- Enlace al archivo CSS externo -->
    <link rel="stylesheet" href="/CSS/dashboard.css">
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
            <h1>Condiciones de Uso</h1>
            <a href="/" class="cta-button">Pagina principal</a>
        </div>
    </section>
    <section class="terms">
        <!-- Contenido de la secciï¿½n de condiciones de uso -->
        <h2>Condiciones de Uso</h2>
        <p>Bienvenido a Macroderma. Estas son las condiciones de uso que rigen tu acceso y uso de nuestro sitio web. Al acceder o utilizar este sitio, aceptas estas condiciones en su totalidad.</p>

        <h3>1. Uso Apropiado</h3>
        <p>Debes utilizar este sitio web de manera adecuada y de acuerdo con todas las leyes y regulaciones aplicables en Chile. No se permite el uso indebido, ilegal o inapropiado de este sitio.</p>

        <h3>2. Propiedad Intelectual</h3>
        <p>Todo el contenido de este sitio web, incluyendo texto, imágenes, logotipos y marcas registradas, estan protegido por derechos de propiedad intelectual y no puedes utilizarlo sin nuestro permiso.</p>

        <h3>3. Privacidad</h3>
        <p>Nuestra politica de privacidad describe cómo recopilamos, utilizamos y protegemos tu información personal. Al utilizar este sitio, aceptas nuestras prácticas de privacidad.</p>

        <h3>4. Cambios en las Condiciones</h3>
        <p>Nos reservamos el derecho de modificar estas condiciones en cualquier momento. Es tu responsabilidad revisarlas periodicamente para estar al tanto de cualquier cambio.</p>

        <h3>5. Contacto</h3>
        <p>Si tienes preguntas o comentarios sobre estas condiciones, puedes <a href="/nosotros">contactarnos</a>.</p>
    </section>

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