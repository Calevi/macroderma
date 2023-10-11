<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <h1>Aviso Legal</h1>
            <a href="/" class="cta-button">Pagina principal</a>
        </div>
    </section>
    
    <section class="legal">
        <h2>Aviso Legal</h2>
        <p>SkinCare Chile es una empresa registrada en Chile bajo el nombre "Nombre de la Empresa SPA" y con domicilio en:</p>
        <p>Dirección: Calle Ejemplo #1234, Santiago, Chile</p>
        <p>Teléfono de Contacto: +56 9 1234 5678</p>
        <p>Correo Electrónico: contacto@ejemplo.com</p>

        <p>Este sitio web es propiedad de SkinCare Chile y su uso está sujeto a los siguientes términos y condiciones:</p>
    </section>

    <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="Images/cropped-IMG_2592.png" alt="Tu Logo" class="logonegro"></a>
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