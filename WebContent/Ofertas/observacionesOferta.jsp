<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <c:set var="idRol" value="1"> </c:set>
<c:choose>
<c:when test="${idRol == 1}">
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<link href="https://unpkg.com/tailwindcss@%5E2/dist/tailwind.min.css" rel="stylesheet">

<script src="https://kit.fontawesome.com/28279bfb40.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
<script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>

<title>Observaciones de la oferta - La Cuponera</title>
</head>

<body>
<header>
<jsp:include page="/menu.jsp"></jsp:include>
</header>
<br>

<c:if test="${not empty listaErrores}">
 <div style="margin-left: 5vw; margin-right: 20vw;" class="p-4 mb-4 text-sm text-red-700 bg-red-100 rounded-lg dark:bg-red-200 dark:text-red-800" role="alert">
 <ul>
 <c:forEach var="errores" items="${requestScope.listaErrores}">
 <li>${errores}</li>
 </c:forEach>
 </ul>
 </div>
</c:if>

<div style="margin-left: 5vw; margin-right: 20vw; ">
<h1 class="text-left" style="font-size: 35px"><b>Devolver oferta con observaciones</b></h1>
<br>
<div class="p-4 mb-4 text-sm text-blue-700 bg-blue-100 rounded-lg dark:bg-blue-200 dark:text-blue-800" role="alert">
  Realice las obsarvaciones pertinentes, los campos (*) son obligatorios.
</div>


<form role="form" action="${pageContext.request.contextPath}/ofertas.do" method="POST">
<c:set var="idOferta" value="${param.id}"> </c:set>
<input type="hidden" name="id" value="${idOferta}">
<input type="hidden" name="op" value="rechazar">
<input type="hidden" name="estado" value="RECHAZADA">

<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Observaciones:</span>
  <textarea  class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="observaciones" rows="5" placeholder="Escribe aquí..."></textarea>
  
  </div>

<br>

<input type="submit" class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 
font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800" value="Devolver oferta" style="cursor: pointer">
 <a class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg 
 text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900" href="${pageContext.request.contextPath}/ofertas.do?op=revisar&id=${idOferta}">Cancelar</a>
</form>
<br>
</div>
</body>
</html>
</c:when>

<c:when test="${idRol != 1}">
  <c:redirect url = "/index.jsp"/>
</c:when>
</c:choose>