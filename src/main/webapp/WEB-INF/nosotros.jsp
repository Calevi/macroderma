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
    <h1>¿Que es Macroderma?</h1>
    <div class="columns">
    		<div class="txtd">
    			<div>
	    			<p>
		   				En esta seccion presentamos que es macroderma y como surge en conjuntro a la presentacion de la fundadora directotra
		   				o dueña de la pyme a la cual estamos apoyando con la creacion de la pagina web.
		   				tambien se puede rellenar del cual es principal y el porque surgio
		   				hbjcfdulhfvbafdikvnbferikvb írehnvgbirongbvuo9erhnqbvo´rejmbertnbp
		   				eoftrunbe´troibjnrp0nboernjmb0rpoeijmnberoq
		   				jer9obvneqr0+´binrebp0nero´qbinetrogvjnmrgvn
		   				rjni0ogvnrew+ogvnjmr0pgvbnr+
		   				rjeq0pg+ijmrp0gvrjmnq
		   				frjm+0erpoigjerg+vj
		   			</p>
		   		</div>
		   		<div>
		   			<br>
		   			<h3>Origen</h3>
		   			<br>
		   			<p>
		   				Descripcion del Origen
		   			</p>
		   		</div>
		   		<div>
		   			<br>
		   			<h3>¿Porque Nosostros?</h3>
		   			<br>
		   			<p>
		   				Descripcion del Origen
		   			</p>
		   		</div>
		   		<div>
		   			<br>
		   			<h3>¿Como Contactarnos?</h3>
		   			<p>
		   				contactanos al fono whatsapp +569 133 131 132 <%-- Solo es un ejemplo de numero, lo mismo con la direccion --%>
		   				<br>
		   				<i>(Solo whatsApp)</i>
		   				
		   			</p>
		   		</div>
	   		</div> 
	    	<div class="fototext">
		    	<div>	
		    		<img class="foto" src="img/duena.jpg" alt="direc o dueña de pyme">
		    		<br>
		    		<b> Katherine Ponce.
		    			<br>
		    			Fundadora.	
		    		</b>
		    	</div>
		    	<div>
	    			<img class="foto" src="img/Belén.jpg" alt="enfermera">
	    			<br>
	   				<b> 
	   					Belén Mendoza. 
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