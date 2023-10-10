<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Condiciones de Uso - SkinCare Chile</title>
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
	                    <a href="/logout" class="logout-button">Cerrar Sesión</a>
	                </c:when>
	                <c:otherwise>
	                    <a href="/registrarse"  class="inicioregistro">Registrarse</a><p>|</p><a href="/login"  class="inicioregistro" >Iniciar Sesión</a>
	                </c:otherwise>
	            </c:choose>
	        </div>
	    </nav>
	</header>

   <section class="hero">
        <div class="hero-content">
            <h1>Condiciones de Uso</h1>
            <a href="/" class="cta-button">Pagina principal</a>
        </div>
    </section>
    <section class="terms">
        <!-- Contenido de la sección de condiciones de uso -->
        <h2>Condiciones de Uso</h2>
        <p>Bienvenido a SkinCare Chile. Estas son las condiciones de uso que rigen tu acceso y uso de nuestro sitio web. Al acceder o utilizar este sitio, aceptas estas condiciones en su totalidad.</p>

        <h3>1. Uso Apropiado</h3>
        <p>Debes utilizar este sitio web de manera adecuada y de acuerdo con todas las leyes y regulaciones aplicables en Chile. No se permite el uso indebido, ilegal o inapropiado de este sitio.</p>

        <h3>2. Propiedad Intelectual</h3>
        <p>Todo el contenido de este sitio web, incluyendo texto, imágenes, logotipos y marcas registradas, está protegido por derechos de propiedad intelectual y no puedes utilizarlo sin nuestro permiso.</p>

        <h3>3. Privacidad</h3>
        <p>Nuestra política de privacidad describe cómo recopilamos, utilizamos y protegemos tu información personal. Al utilizar este sitio, aceptas nuestras prácticas de privacidad.</p>

        <h3>4. Cambios en las Condiciones</h3>
        <p>Nos reservamos el derecho de modificar estas condiciones en cualquier momento. Es tu responsabilidad revisarlas periódicamente para estar al tanto de cualquier cambio.</p>

        <h3>5. Contacto</h3>
        <p>Si tienes preguntas o comentarios sobre estas condiciones, puedes <a href="contacto.html">contactarnos</a>.</p>
    </section>

    <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="img/cropped-IMG_2592.png" alt="Tu Logo" class="logonegro"></a>
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
                <a href="https://www.instagram.com/macroderma/" class="social-button instagram">Instagram</a>              
            </div>
        </div>
    </footer>
</body>
</html>