<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrarse</title>
<link rel="stylesheet" href="/CSS/css1.css">
</head>
<body>
	<div class="container">
        
        <div class="formulario">
            <img src="img/cropped-IMG_2592.png" alt="Logo" class="logo">
            <h1>Registrarse</h1>
            <form:form action="/registro" method="post" modelAttribute="nuevoUsuario">
                <form:label path="nombre">Nombre:</form:label>
                <form:input path="nombre"></form:input>
                <form:errors path="nombre"></form:errors>

                <form:label path="apellido">Apellido:</form:label>
                <form:input path="apellido"></form:input>
                <form:errors path="apellido"></form:errors>

                <form:label path="email">Correo:</form:label>
                <form:input path="email"></form:input>
                <form:errors path="email"></form:errors>
                
                <form:label path="direccion.region">Región:</form:label>
                <form:input path="direccion.region"></form:input>
                <form:errors path="direccion.region"></form:errors>
                
                
                <form:label path="direccion.ciudad">Ciudad:</form:label>
                <form:input path="direccion.ciudad"></form:input>
                <form:errors path="direccion.ciudad"></form:errors>
                
                
                
                <form:label path="direccion.calle">Calle:</form:label>
                <form:input path="direccion.calle"></form:input>
                <form:errors path="direccion.calle"></form:errors>

                

                <form:label path="direccion.numero">Número:</form:label>
                <form:input path="direccion.numero"></form:input>
                <form:errors path="direccion.numero"></form:errors>

                

                <form:label path="password">Contraseña:</form:label>
                <form:password path="password"></form:password>
                <form:errors path="password"></form:errors>

                <form:label path="confirmacion">Confirmar Contraseña:</form:label>
                <form:password path="confirmacion"></form:password>
                <form:errors path="confirmacion"></form:errors>
                
                
                
				
                <input type="submit" class="enviar" value="Registrarse">
            </form:form>
        </div>
        <a href="/login">Ya tiene cuenta?</a>
   </div>
</body>
</html>