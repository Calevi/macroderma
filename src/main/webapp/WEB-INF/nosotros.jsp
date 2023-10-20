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
    <h1>�Que es Macroderma?</h1>
    <div class="columns">
    		<div class="txtd">
    			<div>
		   			<p>
		   				En Macroderma Clinic, nos enorgullece ofrecer a nuestros pacientes una experiencia est�tica excepcional respaldada 
		   				por una dedicaci�n inquebrantable a la innovaci�n y la excelencia. Nuestra cl�nica cuenta con un equipo de 
		   				profesionales altamente especializados en una amplia gama de tratamientos est�ticos, respaldados por las tecnolog�as 
		   				m�s avanzadas. Nuestras instalaciones se destacan por su entorno acogedor y est�ticamente atractivo, dise�ado para 
		   				brindar la m�xima comodidad a nuestros pacientes. Adem�s, nuestros profesionales se mantienen en constante 
		   				capacitaci�n en los mejores recintos y universidades, bajo la tutela de los m�s destacados especialistas. 
		   				<br>
		   				En Macroderma Clinic, nuestra principal prioridad es la satisfacci�n de nuestros clientes, y estamos comprometidos 
		   				en ayudarles a sentirse y verse lo�mejor�posible.
		   			</p>
		   		</div>
		   		<div>
		   			<br>
		   			<h3>�Como Contactarnos?</h3>
		   			<p>
		   				contactanos al +56 9 3387 6798 <i>Solo Whatsapp</i>
		   				<p> o a traves de nuestro <a href= "https://www.instagram.com/macroderma/" target="_blank" >instagram</a> <%-- Solo es un ejemplo de numero, lo mismo con la direccion --%>
		   				<br>
		   				
		   			</p>
		   		</div>
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
	   					Bel�n Paredes. 
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
                <ul>
                    <li>Macroderma estetica � All rights reserved.</li>
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