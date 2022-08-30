<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<c:choose>
<c:when test="${session.getAttribute(idRol) == null}">
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<link href="https://unpkg.com/tailwindcss@%5E2/dist/tailwind.min.css" rel="stylesheet">

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
<a class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium 
rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800" href="${pageContext.request.contextPath}/rubros.do?op=nuevo">Registrar nuevo</a>
<br>
<br>
<div class="overflow-x-auto relative">
<table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
  <thead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
    <tr style="background-color: #ffd88e">
      <th scope="col" class="py-3 px-6 rounded-l-lg">ID</th>
      <th scope="col" class="py-3 px-6">Nombre</th>
      <th scope="col" class="py-3 px-6">Descripción</th>
      <th scope="col" class="py-3 px-6 rounded-r-lg" colspan="2">Acciones</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="rubros" items="${requestScope.listaRubros}">
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>${rubros.idRubro}</b></td>
      <td class="py-4 px-6">${rubros.nombre}</td>
      <td class="py-4 px-6">${rubros.descripcion}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/rubros.do?op=obtener&id=${rubros.idRubro}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i> Editar</a></td>
      <td class="py-4 px-6"><a href="javascript:eliminar('${rubros.idRubro}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>
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