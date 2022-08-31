<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    
<c:set var="initRol" scope="session" value="${pageContext.session.getAttribute('idRol') }" />
<c:set var="initEmpresa" scope="session" value="${pageContext.session.getAttribute('idEmpresa') }" />
<c:if test="${empty initRol || initRol != 2 }">
		<c:redirect url="${pageContext.request.contextPath}/.."></c:redirect>
</c:if>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<link href="https://unpkg.com/tailwindcss@%5E2/dist/tailwind.min.css" rel="stylesheet">

<script src="https://kit.fontawesome.com/28279bfb40.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
<script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>

<title>Nueva oferta - La Cuponera</title>
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

<c:if test="${not empty listaOK}">
 <div style="margin-left: 5vw; margin-right: 20vw;" class="p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg dark:bg-green-200 dark:text-green-800" role="alert">
 <ul>
 <c:forEach var="ok" items="${requestScope.listaOK}">
 <li>${ok}<a class="alert-link" href="${pageContext.request.contextPath}/ofertas.do?op=listar"><b> Ver lista de ofertas</b></a></li>
 </c:forEach>
 </ul>
 </div>
</c:if>

<div style="margin-left: 5vw; margin-right: 20vw; ">
<h1 class="text-left" style="font-size: 35px"><b>Añadir nueva oferta</b></h1>
<br>
<div class="p-4 mb-4 text-sm text-blue-700 bg-blue-100 rounded-lg dark:bg-blue-200 dark:text-blue-800" role="alert">
  Complete toda la información solicitada, los campos (*) son obligatorios.
</div>

<form role="form" action="${pageContext.request.contextPath}/ofertas.do" method="POST">
<input type="hidden" name="op" value="insertar">
<input type="hidden" name="estado" value="PENDIENTE">
<input type="hidden" name="empresa" value="${initEmpresa}">

<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-
  gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Nombre de la oferta:</span>
  <input type="text" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="nombre" placeholder="Escribe aquí...">
</div>

<br>

<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Descripción:</span>
  <textarea  class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="descripcion" placeholder="Escribe aquí..." rows="5"></textarea>
</div>

<br>

<div class="grid md:grid-cols-2 md:gap-6">
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Precio regular ($):</span>
  <input type="number" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="precioRe" step="0.01" min="0.01" value="0.00" placeholder="Escribe aquí..." >
</div>
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Precio de oferta ($):</span>
  <input type="number" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"name="precioOf" step="0.01" min="0.01" value="0.00" placeholder="Escribe aquí...">
</div>
</div>

<br>

<div class="grid md:grid-cols-2 md:gap-6">
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Inicio de oferta:</span>
  <input type="date" name="inicio" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
</div>
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Fin de oferta:</span>
  <input type="date" name="fin" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
</div>
</div>

<br>

<div class="grid md:grid-cols-2 md:gap-6">
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>fecha limíte para uso de cupones:</span>
  <input type="date" name="fechaLim" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
</div>
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Cantidad de cupones a ofertar:</span>
  <input type="number" name="cupones" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" step="1" min="1" value="0" >
</div>
</div>

<br>

<input type="submit" class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 
font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800" value="Registrar información" style="cursor: pointer">
 <a class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg 
 text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900" href="${pageContext.request.contextPath}/ofertas.do?op=listar">Cancelar</a>
</form>
</div>
<br>
</body>
</html>
