<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<c:set var="initRol" scope="session" value="${contextPage.session.getAttribute('idRol') }" />
<c:if test="${initRol != null}">
	<<c:redirect url="${pageContext.request.contextPath}/../inicio.jsp"></c:redirect>
</c:if>
<html>
<head>
<meta charset="ISO-8859-1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/28279bfb40.js" crossorigin="anonymous"></script>
	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />

	<title>Página principal - La Cuponera</title>
</head>
<body>
	<header class='relative'>
 		
<nav class="bg-white px-2 sm:px-4 py-2.5 dark:bg-gray-900 fixed w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600">
  <div class="container flex flex-wrap justify-between items-center mx-auto">
  <a href="https://flowbite.com/" class="flex items-center">
      <img src="https://cdn-icons-png.flaticon.com/512/3706/3706131.png" class="mr-3 h-6 sm:h-9" alt="Flowbite Logo">
      <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">La cuponera</span>
  </a>
  <div class="flex md:order-2">
      <button type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-3 md:mr-0 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" class="link-info" data-bs-toggle="modal" data-bs-target="#login">Iniciar Sesión</button>
      <button data-collapse-toggle="navbar-sticky" type="button" class="inline-flex items-center p-2 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-sticky" aria-expanded="false">
        <span class="sr-only">Menú</span>
        <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
    </button>
  </div>
    </div>
</nav>
	</header>
	<br>
	<h1 class="text-center" style="font-size: 35px; margin-top: 70px ;" ><b>¡Bienvenido(a) a <span style="color: #fed88d">La Cuponera!</span></b></h1>
	<br>
	<img src="Resources/dashboard.svg" style="height:230px" class="rounded mx-auto d-block" alt="...">
	<br>
	<div class="card" style="margin-left: 20vw; margin-right: 20vw; ">
	
	<c:if test="${not empty errores}">
		<div role="alert">
  			<div class="bg-red-500 text-white font-bold rounded-t px-4 py-2">
   			 Errores
  			</div>
 			 <div class="border border-t-0 border-red-400 rounded-b bg-red-100 px-4 py-3 text-red-700">
   				<ul>
			<c:forEach items="${requestScope.errores}" var="error">
				<li> ${error}</li>
			</c:forEach>
			</ul>
  		</div>
		</div>
		
	</c:if>
	



		<c:if test="${not empty exito}">
		<div class="bg-blue-100 border-t border-b border-blue-500 text-blue-700 px-4 py-3" role="alert">
  			<p class="font-bold">Informacion</p>
			<p class="text-sm">${requestScope.exito}</p>
		</div>
		
		</c:if>

  		<div class="card-header">
  
<c:choose>
<c:when test="${session.getAttribute(idUsuario) != null}">
    ¡Hola de nuevo, <span style="color:#75d3f1">@${session.getAttribute(username)}!</span>
</c:when>
<c:when test="${session.getAttribute(idUsuario) == null}">
    Para comenzar debes <button type="button" style="border: none; background-color: #f7f7f7; text-decoration: underline #75d3f1" class="link-info" data-bs-toggle="modal" data-bs-target="#login">Iniciar sesión</button> <i class="fas fa-sign-in-alt" style="color: #75d3f1"></i>
    ¿Eres un(a) cliente y no tienes cuenta? <button type="button" style="border: none; background-color: #f7f7f7; text-decoration: underline #75d3f1" class="link-info" data-bs-toggle="modal" data-bs-target="#signup">Registrarse</button> <i class="fas fa-user-plus" style="color: #75d3f1"></i>
     
</c:when>
</c:choose>
  </div>
  <div class="card-body">
    <h5 class="card-title" style="font-size: 20px" ><b>¿La Cuponera?</b></h5>
    <p class="card-text">A tráves de este sitio puedes ver y gestionar de una forma optima todos las ofertas de distintos negocios.
    Ingresa a todas las opciones desde el menú principal.</p>

  </div>

</div>
<br>
<!-- Modal desplegalable de Inicio de sesiÃ³n -->
<div class="modal fade" id="login" tabindex="-1" aria-hidden="false">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-size: 20px"><b>Iniciar sesión</b></h5>
      </div>
      <div class="modal-body">
        <form action='${pageContext.request.contextPath}/ClienteRegistroController' method='post'>
       		<input type='hidden' value='login' name='op'>
          <div class="mb-3">
            <i class="fas fa-user" style="color: #fed88d"></i> <label for="recipient-name" class="col-form-label">Usuario o correo electronico:</label>
            <input type="text" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='email'>
          </div>
          <div class="mb-3">
            <i class="fas fa-lock" style="color: #fed88d"></i> <label for="message-text" class="col-form-label">Contraseña:</label>
            <input type="password" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='password'>
          </div>
          <div class="modal-footer">
      <button type="submit" class="btn btn-outline-success">Ingresar</button>
        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancelar</button>
      </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal desplegalable para registro de cliente -->
<div class="modal fade" id="signup" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-size: 20px"><b>Registro de cliente</b></h5>
      </div>
      <div class="modal-body">
        <form action='${pageContext.request.contextPath}/ClienteRegistroController' method='post'>
               		<input type='hidden' value='register' name='op'>
        
          <div class="mb-3">
            <i class="fas fa-at" style="color: #fed88d"></i> <label for="recipient-name" class="col-form-label">Usuario:</label>
            <input type="text" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='username'>
          </div>
          <div class="mb-3">
            <i class="fas fa-user" style="color: #fed88d"></i> <label for="recipient-name" class="col-form-label">Nombres:</label>
            <input type="text" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='name'>
          </div>
          <div class="mb-3">
            <i class="fas fa-user" style="color: #fed88d"></i> <label for="recipient-name" class="col-form-label">Apellidos:</label>
            <input type="text" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='apellido'>
          </div>
          <div class="mb-3">
            <i class="fas fa-envelope" style="color: #fed88d"></i> <label for="message-text" class="col-form-label">Correo electrónico:</label>
            <input type="email" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='email'>
          </div>
                <div class="mb-3">
            <i class="fas fa-envelope" style="color: #fed88d"></i> <label for="message-text" class="col-form-label">DUI:</label>
            <input type="number" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='dui'>
          </div>
          <div class="mb-3">
            <i class="fas fa-lock" style="color: #fed88d"></i> <label for="message-text" class="col-form-label">Contraseña:</label>
            <input type="password" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='password'>
          </div>
          <div class="mb-3">
            <i class="fas fa-lock" style="color: #fed88d"></i> <label for="message-text" class="col-form-label">Repetir contraseña:</label>
            <input type="password" placeholder="Escribe aquí..." class="form-control" id="recipient-name" name='password2'>
          </div>
          <div class="modal-footer">
      <button type="submit" class="btn btn-outline-success" >Aceptar</button>
        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal" >Cancelar</button>
      </div>
        </form>
      </div>
    </div>
  </div>
</div>
    <script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>
    
</body>
</html>
