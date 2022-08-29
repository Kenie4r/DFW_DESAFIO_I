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

<title>Modificar rubro - La Cuponera</title>
</head>

<body>
<header>
<jsp:include page="/menu.jsp"></jsp:include>
</header>
<br>

<c:if test="${not empty listaErrores}">
 <div style="margin-left: 5vw; margin-right: 20vw;" class="alert alert-danger alert-dismissible fade show" role="alert">
 <ul>
 <c:forEach var="errores" items="${requestScope.listaErrores}">
 <li>${errores}</li>
 </c:forEach>
 </ul>
 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"><i class="fas fa-times"></i></button>
 </div>
</c:if>

<c:if test="${not empty listaOK}">
 <div style="margin-left: 5vw; margin-right: 20vw;" class="alert alert-success alert-dismissible fade show" role="alert">
 <ul>
 <c:forEach var="ok" items="${requestScope.listaOK}">
 <li>${ok}<a class="alert-link" href="${pageContext.request.contextPath}/rubros.do?op=listar"> Ver lista de rubros</a></li>
 </c:forEach>
 </ul>
 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"><i class="fas fa-times"></i></button>
 </div>
</c:if>

<div style="margin-left: 5vw; margin-right: 20vw; ">
<h1 class="text-left" style="font-size: 35px"><b>Modificar información del rubro</b></h1>
<br>
<div class="alert alert-primary" role="alert">
  Complete toda la información solicitada, los campos (*) son obligatorios.
</div>

<form role="form" action="${pageContext.request.contextPath}/rubros.do" method="POST">
 <input type="hidden" name="op" value="modificar">
 <input type="hidden" name="id" value="${rubro.idRubro}">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1"><span style="color: red">*</span>Nombre:</span>
  <input type="text" class="form-control" name="nombre" placeholder="Escribe aquí..." aria-describedby="basic-addon1" value="${rubro.nombre}">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">Descripción:</span>
  <textarea class="form-control" name="descripcion" placeholder="Escribe aquí..." aria-describedby="basic-addon1" rows="5" style="border: 1px #6b7280 solid; border-radius: 0px;" >${rubro.descripcion}</textarea>
</div>

<input type="submit" class="btn btn-outline-success" value="Modificar información"
name="Guardar">
 <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/rubros.do?op=listar">Cancelar</a>
</form>

</div>
</body>
</html>
</c:when>

<c:when test="${session.getAttribute(idUsuario) != null}">
  <c:redirect url = "/index.jsp"/>
</c:when>
</c:choose>