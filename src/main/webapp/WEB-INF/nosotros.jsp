<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nosotros</title>
    <link rel="stylesheet" href="/CSS/nos.css">
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
    <h1>¿Que es Macroderma?</h1>
    <div>
    <div class="columns">        
		<div class="txtd">
			<p>
		    	En Macroderma Clinic, nos enorgullece ofrecer a nuestros pacientes una experiencia estética excepcional respaldada por una dedicación inquebrantable a la innovación y la excelencia. Nuestra clínica cuenta con un equipo de profesionales altamente especializados en una amplia gama de tratamientos estéticos, respaldados por las tecnologías más avanzadas. Nuestras instalaciones se destacan por su entorno acogedor y estéticamente atractivo, diseñado para brindar la máxima comodidad a nuestros pacientes. Además, nuestros profesionales se mantienen en constante capacitación en los mejores recintos y universidades, bajo la tutela de los más destacados especialistas.
		    </p>
		    <h3>¿Cómo Contactarnos?</h3>
		    <p>Contactanos al +56 9 3387 6798 <i>Solo Whatsapp</i> o a través de nuestro <a href="https://www.instagram.com/macroderma/" target="_blank">Instagram.</a></p>
		</div>
		<div class="fototext">
			<div>
		    	<img class="foto" src="img/duena.jpg" alt="Directora o dueÃ±a de pyme">
		        <br>
		        <b>Katherine Ponce.</b>
		        <br>
	               Fundadora.
	            </div>
	            <div>
			        <img class="foto" src="img/Belen.jpg" alt="Enfermera">
		            <br>
		            <b>Belén Paredes.</b>
		            <br>
		            TENS.
			</div>
		</div>
	</div>
		<h3 class="fototext">Nuestras Instalaciones.</h3>	
		<div class="image-container">
    		
	        <div class="feature-image fototext">
	            <img src="/img/c3.png" alt="Imagen clÃ­nica" width="90%">
	        </div>
	       	
	        
	        <div class="feature-image fototext">
	            <img src="/img/c2.png" alt="Imagen clÃ­nica" width="90%">
	        </div>
	        
	        
    	</div>
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
