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
        
    <title>Show Info</title>
</head>

<body>
<a href="/show" style="text-align: left">Volver</a>
<h1 style="text-align: center">TV Show:  <c:out value="${show.title}"/></h1><hr><br>
	
	<h2 style="text-align: center">Network: <c:out value="${show.network}"/></h2>
	<h2 style="text-align: center">Avg Ranking: <c:out value="${show.rank}"/></h2><br>	
	
	<a href="/edit/${show.id}" class="btn btn-primary">Editar Show</a>

	<div id="abajo">
    	<p id="texto"> © mAR - copyright 2021 - All right reserved</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</body>
</html>