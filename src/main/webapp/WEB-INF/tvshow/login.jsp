<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    
    <title>Login</title>
</head>

<body>
	<a href="/" style="text-align: left">Volver al Inicio</a>
    <h1 style="text-align: center">Login</h1><hr><br>
    
    <h3 style="color:red ; text-align: center"><c:out value="${error}" /></h3>
    
    <form method="post" action="/login" style="text-align: center">
        <p>
            <label for="email">E-Mail</label>
            <input type="text" id="email" name="email"/>
        </p>
        <p>
            <label for="password">Password</label>
            <input type="password" id="password" name="password"/>
        </p>
        <input class="btn btn-primary" type="submit" value="Ingresar">
        
    </form> 
    
    <div id="abajo">
    	<p id="texto"> © mAR - copyright 2021 - All right reserved</p>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
       
</body>
</html>