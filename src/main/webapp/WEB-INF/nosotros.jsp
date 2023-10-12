<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nosotros</title>
    <link rel="stylesheet" href="CSS/nos.css">
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
    <h1>�Que es Macroderma?</h1>
    <div class="columns">
    		<div>
    			
    			<p>
	   				En esta seccion presentamos que es macroderma y como surge en conjuntro a la presentacion de la fundadora directotra
	   				o due�a de la pyme a la cual estamos apoyando con la creacion de la pagina web.
	   				tambien se puede rellenar del cual es principal y el porque surgio
	   				hbjcfdulhfvbafdikvnbferikvb �rehnvgbirongbvuo9erhnqbvo�rejmbertnbp
	   				eoftrunbe�troibjnrp0nboernjmb0rpoeijmnberoq
	   				jer9obvneqr0+�binrebp0nero�qbinetrogvjnmrgvn
	   				rjni0ogvnrew+ogvnjmr0pgvbnr+
	   				rjeq0pg+ijmrp0gvrjmnq
	   				frjm+0erpoigjerg+vj
	   			</p>
	   			<br>
	   			<h3>�Como Contactarnos?</h3>
	   			<p>
	   				<b>Direccion:</b>Las rosas #300, Chillan.
	   				<br>
	   				contactanos al fono whatsapp +569 133 131 132 <%-- Solo es un ejemplo de numero, lo mismo con la direccion --%>
	   				<br>
	   				<i>(Solo whatsApp)</i>
	   				
	   			</p>
	   		</div> 
	    	<div class="fototext">
		    	<div>	
		    		<img class="foto" src="img/duena.jpg" alt="direc o due�a de pyme">
		    		<br>
		    		<b> Katherine Ponce.
		    			<br>
		    			Fundadora.	
		    		</b>
		    	</div>
		    	<div>
	    			<img class="foto" src="img/Bel�n.jpg" alt="enfermera">
	    			<br>
	   				<b> 
	   					Bel�n Apellido. 
	   					<br>
	   					TENS.
	   				</b>    			
    			</div>       			
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
                    <li>MacroDerma estetica � All rights reserved.</li>
                    <li><img src ="https://auroraestetica.cl/wp-content/uploads/2023/01/pagos.png"></li>
                    <li><img src ="https://auroraestetica.cl/wp-content/uploads/2023/01/SEREMISALUDMET.png"></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>P�ginas Legales</h4>
                <ul>
                    <li><a href="/PyP">Pol�tica de Privacidad</a></li>
                    <li><a href="#terminos-condiciones">Condiciones de uso</a></li>
                    <li><a href="#aviso-legal">Aviso Legal</a></li>
                </ul>
            </div>
        </div>
        <div class="social-section">
            <h4>S�guenos en Instagram</h4>
            <div class="social-buttons">
                <a href="https://www.instagram.com/macroderma/" class="social-button instagram">Instagram</a>  
                <a href="#" class="social-button whatsapp">Whatsapp</a>            
            </div>
        </div>
    </footer>

</body>
</html>