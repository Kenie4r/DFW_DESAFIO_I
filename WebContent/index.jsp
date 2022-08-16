<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/28279bfb40.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
<script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>

<title>Página principal - La Cuponera</title>
</head>
<body>
<header>
 <jsp:include page="/menu.jsp"></jsp:include>
</header>
<br>
<h1 class="text-center" style="font-size: 35px" ><b>¡Bienvenido(a) a <span style="color: #fed88d">La Cuponera!</span></b></h1>
<br>
<img src="Resources/dashboard.svg" style="height:230px" class="rounded mx-auto d-block" alt="...">
<br>
<div class="card" style="margin-left: 20vw; margin-right: 20vw; ">
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
<!-- Modal desplegalable de Inicio de sesión -->
<div class="modal fade" id="login" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-size: 20px"><b>Iniciar sesión</b></h5>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <i class="fas fa-user" style="color: #fed88d"></i> <label for="recipient-name" class="col-form-label">Usuario o correo electrónico:</label>
            <input type="text" placeholder="Escribe aquí..." class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <i class="fas fa-lock" style="color: #fed88d"></i> <label for="message-text" class="col-form-label">Contraseña:</label>
            <input type="password" placeholder="Escribe aquí..." class="form-control" id="recipient-name">
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

<!-- Modal desplegalable de Inicio de sesión -->
<div class="modal fade" id="signup" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-size: 20px"><b>Registro de cliente</b></h5>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <i class="fas fa-at" style="color: #fed88d"></i> <label for="recipient-name" class="col-form-label">Usuario:</label>
            <input type="text" placeholder="Escribe aquí..." class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <i class="fas fa-user" style="color: #fed88d"></i> <label for="recipient-name" class="col-form-label">Nombres:</label>
            <input type="text" placeholder="Escribe aquí..." class="form-control" id="recipient-name">
          </div>
          <div class="mb-3">
            <i class="fas fa-user" style="color: #fed88d"></i> <label for="recipient-name" class="col-form-label">Apellidos:</label>
            <input type="text" placeholder="Escribe aquí..." class="form-control" id="recipient-name">
          </div>
          <label for="basic-url" class="form-label"><b>ATENCIÓN:</b> Tu usuario y una contraseña temproral será enviado tu correo para iniciar sesión por primera vez.</label>
          <div class="mb-3">
            <i class="fas fa-envelope" style="color: #fed88d"></i> <label for="message-text" class="col-form-label">Correo electrónico:</label>
            <input type="email" placeholder="Escribe aquí..." class="form-control" id="recipient-name">
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

</body>
</html>
