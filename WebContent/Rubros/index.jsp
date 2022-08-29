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

<title>Rubros - La Cuponera</title>
</head>

<body>
<header>
<jsp:include page="/menu.jsp"></jsp:include>
</header>
<br>
<div style="margin-left: 5vw; margin-right: 20vw; ">
<h1 class="text-left" style="font-size: 35px"><b>Lista de rubros</b></h1>
<br>
<a class="btn btn-outline-info" href="${pageContext.request.contextPath}/rubros.do?op=nuevo">Registrar nuevo</a>
<br>

<table class="table">
  <thead>
    <tr style="color: #ffd88e">
      <th scope="col">ID</th>
      <th scope="col">Nombre</th>
      <th scope="col">Descripción</th>
      <th scope="col" colspan="2">Acciones</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="rubros" items="${requestScope.listaRubros}">
    <tr>
      <td><b>${rubros.idRubro}</b></td>
      <td>${rubros.nombre}</td>
      <td>${rubros.descripcion}</td>
      <td><a href="${pageContext.request.contextPath}/rubros.do?op=obtener&id=${rubros.idRubro}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i></a></td>
      <td><a href="javascript:eliminar('${rubros.idRubro}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i></a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>
</body>
</html>
</c:when>

<c:when test="${session.getAttribute(idUsuario) != null}">
  <c:redirect url = "/index.jsp"/>
</c:when>
</c:choose>

<script>
  function eliminar(id){
    if(confirm('¿Desea eliminar el elemento seleccionado?')){
    	 location.href = 'rubros.do?op=eliminar&id='+id;
    }
  }
</script>