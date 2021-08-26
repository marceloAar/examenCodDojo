<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        
    <title>Muestra TV Show</title>
</head>

<body>
<a href="/" style="text-align: left">Volver al Inicio</a>
<h1 style="text-align: center">Lista de TV Shows</h1><hr>

<table class="table table-striped">
    <thead>
        <tr>            
            <th>Show</th>
            <th>Network</th>
            <th>Avg Rating</th>                       
        </tr>
    </thead>
    
    <tbody>
        <c:forEach items="${shows}" var="show">
        <tr>            
            <td><a href="/mostrarShow/${show.id}"><c:out value="${show.title}"/></td>
            <td><c:out value="${show.network}"/></td>
            <td><c:out value="${show.rank}"/></td>             
        </tr>
        </c:forEach>
    </tbody>
</table><br>
	
<a href="/nuevoShow" class="btn btn-primary">Add a Show</a>

	<div id="abajo">
    	<p id="texto"> © mAR - copyright 2021 - All right reserved</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</body>
</html>