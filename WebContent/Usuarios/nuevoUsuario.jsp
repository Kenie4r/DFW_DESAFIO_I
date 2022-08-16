<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<c:choose>
<c:when test="${session.getAttribute(idRol) == null}">
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

<title>Nuevo usuario - La Cuponera</title>
</head>

<body>
<header>
<jsp:include page="/menu.jsp"></jsp:include>
</header>
<br>
<h1 class="text-center" style="font-size: 35px"><b>Añadir nuevo usuario</b></h1>
<br>
<div style="margin-left: 20vw; margin-right: 20vw; ">
<div class="alert alert-primary" role="alert">
  Complete toda la información solicitada, los campos (*) son obligatorios.
</div>

<form>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><span style="color: red">*</span>Nombre de usuario:</span>
  <input type="text" class="form-control" placeholder="Escribe aquí..." aria-label="Username" aria-describedby="basic-addon1">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><span style="color: red">*</span>Nombres:</span>
  <input type="text" class="form-control" placeholder="Escribe aquí..." aria-label="Username" aria-describedby="basic-addon1">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><span style="color: red">*</span>Apellidos:</span>
  <input type="text" class="form-control" placeholder="Escribe aquí..." aria-label="Username" aria-describedby="basic-addon1">
</div>

<div class="row g-3">
 <div class="col-md-6">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><span style="color: red">*</span>Rol de usuario:</span>
  <select class="form-select" aria-describedby="basic-addon1" style="border: 1px #6b7280 solid; border-radius: 0px;">
  <option>Selecciona una opción</option>
  </select>
</div>
</div>
<div class="col-md-6">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><span style="color: red">*</span>Empresa:</span>
  <select class="form-select" aria-describedby="basic-addon1" style="border: 1px #6b7280 solid; border-radius: 0px;">
  <option>Selecciona una opción</option>
  </select>
</div>
</div>
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><span style="color: red">*</span>Correo electrónico:</span>
  <input type="email" class="form-control" placeholder="Escribe aquí..." aria-label="Username" aria-describedby="basic-addon1">
</div>
<input type="submit" class="btn btn-outline-success" value="Registrar información"
name="Guardar">
 <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/index.jsp">Cancelar</a>
</form>

</div>
</body>
</html>
</c:when>

<c:when test="${session.getAttribute(idUsuario) != null}">
  <c:redirect url = "/index.jsp"/>
</c:when>
</c:choose>