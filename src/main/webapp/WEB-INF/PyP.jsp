<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pol�ticas y Privacidad - SkinCare Chile</title>
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

    <section class="hero">
        <div class="hero-content">
            <h1>Politicas y Privacidad</h1>
            <a href="/" class="cta-button">Pagina principal</a>
        </div>
    </section>
    <section class="policy">
        <!-- Contenido de la secci�n de pol�ticas y privacidad -->
        <h2>Pol�ticas y Privacidad</h2>
        <p>En SkinCare Chile, nos preocupamos por la privacidad y la seguridad de nuestros clientes. A continuaci�n, se describen nuestras pol�ticas y pr�cticas de privacidad:</p>

        <h3>Recopilaci�n de Informaci�n Personal</h3>
        <p>Recopilamos informaci�n personal de nuestros clientes, como nombre, direcci�n y correo electr�nico, con el �nico prop�sito de procesar y enviar pedidos. No compartimos esta informaci�n con terceros.</p>

        <h3>Cookies</h3>
        <p>Utilizamos cookies para mejorar la experiencia de navegaci�n de nuestros usuarios. Estas cookies no almacenan informaci�n personal y se utilizan solo con fines estad�sticos y de an�lisis.</p>

        <h3>Seguridad</h3>
        <p>Tomamos medidas para proteger la informaci�n personal de nuestros clientes. Utilizamos protocolos de seguridad est�ndar de la industria para garantizar la confidencialidad de los datos.</p>

        <h3>Contacto</h3>
        <p>Si tienes alguna pregunta o inquietud sobre nuestras pol�ticas de privacidad, no dudes en <a href="contacto.html">contactarnos</a>.</p>
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
                <a href="https://www.instagram.com/macroderma/" class="social-button instagram">Instagram</a>              
            </div>
        </div>
    </footer>
</body>
</html>
