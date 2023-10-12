<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
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
        
        <div class="search-bar">
            <input type="text" placeholder="Buscar productos...">
            <button type="button">Buscar</button>
        </div>
        
        <div class="cart">
            <a href="/carrito"><img src="/img/carrito.png" alt="Carrito de compras"></a>
            <span>${not empty carrito ? carrito.size() : 0}</span>
        </div>
    </div>
    
    </section>
    <section class="products">
       
        
        
        <div class="product-grid">
        <c:forEach var="producto" items="${productos}">
            <div class="product-card">
            	<div class="product-image">
                	<img src="img/${producto.imagen}" alt="${producto.nombre}">
                </div>
                <a href="/verproducto/${producto.id}"><h3>${producto.nombre}</h3></a> 
                <p>${producto.descripcion}</p>
                
                <span class="price">Precio: $${producto.precio} CLP</span>
                <a href="#" class="buy-button">Comprar</a>
            </div>
        </c:forEach>
    </div>
    </section>
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
