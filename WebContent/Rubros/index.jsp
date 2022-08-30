<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<c:choose>
<c:when test="${session.getAttribute(idRol) == null}">
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">


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
<div style="margin-left: 5vw; margin-right: 5vw; ">
<h1 class="text-left" style="font-size: 35px"><b>Lista de rubros</b></h1>
<br>
<a  type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" href="${pageContext.request.contextPath}/rubros.do?op=nuevo">Registrar nuevo</a>
<br>

<table class="table w-11/12 mx-auto">
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
    <tr class='border-solid border-t-2 border-yellow-400 p-4'>
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