<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
</head>
<body>
    <header>
        <nav>
            <div class="header">
                <c:choose>
                    <c:when test="${usuarioEnSesion != null}">
                        <p>
                            <c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">[ADMIN] </c:if>
                            Bienvenid@, ${usuarioEnSesion.nombre}
                        </p>
                        <a href="/logout" class="logout-button">Cerrar Sesión</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/registrarse" class="inicioregistro">Registrarse</a>
                        <p>|</p>
                        <a href="/login" class="inicioregistro">Iniciar Sesión</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </header>
    <div class="columns">
        <nav class="main-nav">
            <ul>
                <li><a href="/"><img src="img/cropped-IMG_2592.png" alt="Tu Logo" class="logonegro"></a></li>
                <li><a href="tratamientos">Tratamientos</a></li>
                <li><a href="productos">Productos</a></li>
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
            <span id="cart-counter">0</span>
        </div>
        
        
    </div>
    
    </section>
    <section class="products">
       
        
        
        <div class="product">
        
            <img src="img/bloqueador.jpeg" alt="Bloqueador Solar SPF 50+">
	        <h3>Anthelios Stick La Roche Posay SPF 50+</h3>
	        <p>Protege tu piel de los daños del sol con el bloqueador solar SPF 50+ de alta calidad.</p>
	        <span class="price">$15.990</span>
	        <a href="#" class="buy-button">Comprar</a>	    
                               
        </div>
        
        <div class="product">
	        <img src="img/serum.jpg" alt="Serum Hidratante Antiarrugas">
	        <h3>SERUM LA ROCHE-POSAY HYALU B5 30ML</h3>
	        <p>Sérum dermatológico anti-arrugas que repara la barrera de la piel, rellena inmediatamente, reduce las arrugas de manera significativa, incrementa el volumen y elasticidad de la piel, incluso después de procedimientos estéticos superficiales.</p>
	        <span class="price">$39.990</span>
	        <a href="#" class="buy-button">Comprar</a>
    	</div>
        
           
            
            
        
    </section>
    <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <img src="img/logoblanco.png" alt="Logo de la Empresa" class="logo">
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
                    <li><a href="/condiciones">Condiciones de Uso</a></li>
                    <li><a href="#aviso-legal">Aviso Legal</a></li>
                </ul>
            </div>
        </div>
        <div class="social-section">
            <h4>Síguenos en Redes Sociales</h4>
            <div class="social-buttons">
                <a href="#" class="social-button facebook">Facebook</a>
                <a href="#" class="social-button twitter">Twitter</a>
                <a href="#" class="social-button instagram">Instagram</a>
            </div>
        </div>
    </footer>
</body>
</html>
