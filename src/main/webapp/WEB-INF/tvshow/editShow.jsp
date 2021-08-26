<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
  
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/style.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        
    <title>Editar Show TV</title>
</head>

<body>
	<a href="/show" style="text-align: left">Volver</a>
    <h1 style="text-align: center">Editar Show TV</h1><hr><br>
          
<form:form action="/edit/${show.id}" method="post" modelAttribute="show">
    <input type="hidden" name="_method" value="put">
    <p>
        <form:label path="title">Title: </form:label>       
        <form:input path="title"/>
    </p>
    <p>
        <form:label path="network">Network: </form:label>        
        <form:input path="network"/>
    </p>
    <p>Avg Rating :    
        <select name="rank">
			<option selected>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>			
		</select>          
    </p><hr>   
      
    <input class="btn btn-primary" type="submit" value="Actualizar Show">
    
</form:form><br>

	<a href="/delete/${show.id}" class="btn btn-primary">Eliminar Show</a>
    
    <div id="abajo">
    	<p id="texto"> © mAR - copyright 2021 - All right reserved</p>
    </div>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    
</body>
</html>