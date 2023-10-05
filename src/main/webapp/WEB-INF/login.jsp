<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inicio de sesion</title>
<link rel="stylesheet" href="CSS/css1.css">
</head>
<body>
	   <div class="container">
        
        <div class="formulario">
            <img src="Images/cropped-IMG_2592.png" alt="Logo" class="logo">
            <h1>Iniciar Sesion</h1>
            <p>${error_login}</p>
            <form action="/loguear" class="" method="post">
                <label for="email">Correo:</label>
                <input type="email" name="email" id="" required>

                <label>Contraseña:</label>
                <input type="password" name="password">

                <input type="submit" class="enviar" value="Iniciar Sesion">
            </form>
        </div>
        <a href="/registrarse">Aun no tiene Cuenta?</a>
   </div>
</body>
</html>