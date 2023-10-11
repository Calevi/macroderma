<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nosotros</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
    <link rel="stylesheet" href="CSS/nosostros.css">
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
    <h1>¿Que es Macroderma?</h1>
    <div class="info columns">
    		<div>
    			
    			<p>
	   				En esta seccion presentamos que es macroderma y como surge en conjuntro a la presentacion de la fundadora directotra
	   				o dueña de la pyme a la cual estamos apoyando con la creacion de la pagina web.
	   				tambien se puede rellenar del cual es principal y el porque surgio
	   			</p>
	   		</div> 
	    	<div>
	    		<img scr="#img/img.jpg" alt="direc o dueña de pyme">
	    		<br>
	    		<b> Nombre de Directora o dueña
	    		<br>
	    			Cargo de directora o dueaña
	    		</b>    			
    		</div>   	
   	</div>
   	<div class="info columns">
   		<div>
	    	<img scr="#img/img.jpg" alt="medico 1">
	    	<br>
	   		<b> Nombre 
	   		<br>
	   			Cargo 
	   		</b>    			
    	</div> 
    	<div>
	    	<img scr="#img/img.jpg" alt="medico 2">
	    	<br>
	   		<b> Nombre 
	   		<br>
	   			Cargo 
	   		</b>    			
    	</div> 
    	<div>
	    	<img scr="#img/img.jpg" alt="grupo de trabajo">
	    	<br>
	   		<b> Grupo de trabajo </b>    			
    	</div> 
   	
   	</div>
    
    <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="img/logoblanco.png" alt="Tu Logo" class="logo"></a>
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
                    <li><a href="#terminos-condiciones">Condiciones de uso</a></li>
                    <li><a href="#aviso-legal">Aviso Legal</a></li>
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