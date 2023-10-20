<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
	                    <p><c:if test="${usuarioEnSesion.rol == 'ADMINISTRADOR'}">[ADMIN] </c:if>Bienvenid@, ${usuarioEnSesion.nombre}</p>
	                    <a href="/logout" class="logout-button">Cerrar Sesion</a>
	                </c:when>
	                <c:otherwise>
	                    <a href="/registrarse"  class="inicioregistro">Registrarse</a><p>|</p><a href="/login"  class="inicioregistro" >Iniciar Sesion</a>
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
            <h1>Bienvenido a Macroderma:
            Donde la belleza se encuentra con la excelencia</h1>
            <p>Descubre nuestra amplia gama de tratamientos sobre cuidado de la piel para lucir radiante y saludable todos los dias.</p>
            <a href="#productos" class="cta-button">Explora nuestros tratamientos</a>
        </div>
    </section>
    <section class="products">
        <!-- Contenido de la secciï¿½n de productos -->
        <div class="product">
            <img src="/img/ACIDOHIALURONICO.jpeg" alt="Producto 1">
            <h3>Acido Hialuronico</h3>
            <p> Ofrecemos tratamientos que utilizan ácido hialurónico para restaurar la hidratación, firmeza, luminosidad y volumen en el cuerpo. Para recuperar lo perdido, ofrecemos tratamientos de:

				Aumento de labios
				Rinomodelación
				Pómulos
				Marcación mandibular
				Relleno de temporales
				Mentón
				Relleno de surcos
				Código de barras
				Relleno de ojeras
				
			</p>
            <a href="#" class="buy-button">Contratar</a>
        </div>

        <div class="product">
            <img src="/img/TOXINABOTULINICA.jpeg">
            <h3>Toxina Botulinica</h3>
            <p> Ofrecemos la inoculación de toxina botulínica (Botox) para relajar los músculos causantes de las líneas de expresión. Es un procedimiento ambulatorio, rápido y sin dolor que mejora gradualmente la calidad de la piel al restaurar el colágeno. Se administra mediante pequeñas inyecciones en el consultorio médico, bloqueando temporalmente los impulsos nerviosos en los músculos tratados, lo que reduce visiblemente las arrugas y líneas de expresión.</p>
            <a href="#" class="buy-button">Contratar</a>
        </div>

        <div class="product">
            <img src="/img/DEPILACIONLASERDIODO.jpeg">
            <h3>Depilacion Laser Diodo</h3>
            <p>Ofrecemos un tratamiento revolucionario de depilación láser de diodo de alta potencia con un láser europeo único equipado con un sistema VCSEL. Este sistema reduce los efectos secundarios hasta en un 90% y duplica la efectividad del tratamiento. La depilación láser de diodo de alta potencia elimina permanentemente el vello no deseado desde la raíz, sin dañar la piel circundante. Es una solución versátil y segura que se puede utilizar durante todo el año y temporada.</p>
            <a href="#" class="buy-button">Contratar</a>
        </div>
        <div class="product">
            <img src="/img/BIOESTIMULADORESFACIALES.jpeg">
            <h3>Bioestimuladores Faciales</h3>
            <p>Consiste en inyectar productos que actúan a nivel celular estimulando la producción de colágeno, elastina y ácido hialurónico. Esto genera un rejuvenecimiento facial con efectos duraderos, ya que nuestro cuerpo produce sus propios factores de crecimiento. Los bioestimuladores faciales proporcionan un efecto de relleno, luminosidad, reducción de líneas de expresión, disminución de surcos y corrección de ojeras, ayudando a recuperar la juventud del rostro. La duración aproximada de los resultados es de 24 meses. Además, ofrecen un efecto de lifting facial sin necesidad de cirugía.</p>
            <a href="#" class="buy-button">Contratar</a>
        </div>
        <div class="product">
            <img src="/img/HILOSTENSORES.jpeg">
            <h3>Hilos Tensores</h3>
            <p>Estos hilos se colocan debajo de la piel para generar un efecto tensor que estimula la producción de colágeno, brindando firmeza y mejorando la apariencia del rostro. Es un procedimiento de lifting facial sin cirugía.</p>
            <a href="#" class="buy-button">Contratar</a>
        </div>
    </section>
 <footer class="footer-section">
        <div class="footer-content">
            <div class="footer-column">
                <a href="/"><img src="img/logoblanco.png" alt="Tu Logo" class="logo"></a>
            </div>
            <div class="footer-column">
                <ul>
                    <li>MacroDerma estetica ï¿½ All rights reserved.</li>
                    <li><img src ="https://auroraestetica.cl/wp-content/uploads/2023/01/pagos.png"></li>
                    <li><img src ="https://auroraestetica.cl/wp-content/uploads/2023/01/SEREMISALUDMET.png"></li>
                </ul>
            </div>
            <div class="footer-column">
                <h4>Pï¿½ginas Legales</h4>
                <ul>
                    <li><a href="/PyP">Polï¿½tica de Privacidad</a></li>
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
        		<a href="https://wa.me/+56933876798" target="_blank"><img src=""/img/wtsp.png" alt="WhatsApp"></a>
    		</div>
		</div>
    </footer>
</body>
</html>