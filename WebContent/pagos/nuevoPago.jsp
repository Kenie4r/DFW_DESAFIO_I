<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    
<!DOCTYPE html>
<html>
<head>
<c:set var="initRol" scope="session" value="${pageContext.session.getAttribute('idRol') }" />
<c:if test="${empty initRol}">
		<c:redirect url="${pageContext.request.contextPath}/.."></c:redirect>
</c:if>
	<meta charset="ISO-8859-1">
	<title>Nuevo metodo de pago</title>
	<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
    <script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>
	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
  	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  	<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/menu.jsp"></jsp:include>
	<div style="margin-left: 5vw; margin-right: 20vw; ">
		<h1 class="text-left" style="font-size: 35px"><b>Añadir nueva metodo de pago</b></h1>
		<br>
		<c:if test="${not empty errores}">
			<div id="alert-additional-content-2" class="p-4 mb-4 border border-red-300 rounded-lg bg-red-50 dark:bg-red-200" role="alert">
			  <div class="flex items-center">
			    <svg aria-hidden="true" class="w-5 h-5 mr-2 text-red-900 dark:text-red-800" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
			    <span class="sr-only">Información</span>
			    <h3 class="text-lg font-medium text-red-900 dark:text-red-800">Existen errores en el nuevo metodo de pago</h3>
			  </div>
			  <div class="mt-2 mb-4 text-sm text-red-900 dark:text-red-800">
			  	<ul>
					<c:forEach items="${requestScope.errores}" var="error">
						<li>${error}</li>
					</c:forEach>
				</ul>
			  </div>
			  <div class="flex">
			    
			  </div>
			</div>
		</c:if>
		<div class="p-4 mb-4 text-sm text-blue-700 bg-blue-100 rounded-lg dark:bg-blue-200 dark:text-blue-800" role="alert">
  			Complete toda la información solicitada, los campos (*) son obligatorios.
		</div>
		<form role="form" action="${pageContext.request.contextPath}/MetodosPago" method="POST">			
			<input type="hidden" name="op" value="insertar">
			<input type="hidden" name="estado" value="ACTIVO">
			<input type="hidden" name="userID" value="${pageContext.session.getAttribute('idUsuario')}">
			<div class="flex">
				  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-
				  gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Nombre del Metodo de pago:</span>
				  <input type="text" value="${pago.getMetodo()}" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
				  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="nombre" placeholder="Escribe aquí..." maxlength="45">
			</div>
			
			<br>
			<div class="flex">
				  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-
				  gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Número de tarjeta: (tarjetas visa o mastercard) </span>
				  <input type="text"  value="${pago.getCodigo()}" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
				  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="codigo" placeholder="Escribe aquí..." patten="^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$">
			</div>
			
			<br>
			<div class="grid md:grid-cols-2 md:gap-6">
				<div class="flex">
  					<span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>CV:</span>
  					<input value="${pago.getCodigoVerificacion()}" type="text" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  						blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="cv"  placeholder="Escribe aquí..." pattern="^[0-9]{3,4}$" maxlength="4">
				</div>
				<div class="flex">
  					  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Fecha de Vencimiento:</span>
  						<input value="${pago.getVencimiento()}"type="text" name="fin" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  						blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" pattern="^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})$" maxlength="7">
				</div>
			</div>

			<br>
			<input type="submit" class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 
				font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800" value="Registrar información" style="cursor: pointer">
 			<a class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg 
 				text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900" href="${pageContext.request.contextPath}/MetodosPago">Cancelar</a>
		</form>
	</div>
</body>
</html>