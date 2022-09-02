<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    
<c:set var="initRol" scope="session" value="${pageContext.session.getAttribute('idRol') }" />
<c:set var="initEmpresa" scope="session" value="${pageContext.session.getAttribute('idEmpresa') }" />
<c:if test="${empty initRol || (initRol != 1 && initRol != 2)}">
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

<title>Nueva usuario - La Cuponera</title>
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
 <li>${ok}<a class="alert-link" href="${pageContext.request.contextPath}/usuarios.do?op=listar"><b> Ver lista de usuarios</b></a></li>
 </c:forEach>
 </ul>
 </div>
</c:if>

<div style="margin-left: 5vw; margin-right: 20vw; ">
<h1 class="text-left" style="font-size: 35px"><b>Añadir nuevo usuario</b></h1>
<br>
<div class="p-4 mb-4 text-sm text-blue-700 bg-blue-100 rounded-lg dark:bg-blue-200 dark:text-blue-800" role="alert">
  Complete toda la información solicitada, los campos (*) son obligatorios.
</div>

<form role="form" action="${pageContext.request.contextPath}/usuarios.do" method="POST">
<input type="hidden" name="op" value="insertar">

<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-
  gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Usuario:</span>
  <input type="text" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="username" placeholder="Escribe aquí...">
</div>

<br>

<div class="grid md:grid-cols-2 md:gap-6">
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-
  gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Nombres:</span>
  <input type="text" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="name" placeholder="Escribe aquí...">
</div>
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-
  gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Apelidos:</span>
  <input type="text" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="apellido" placeholder="Escribe aquí...">
</div>
</div>

<br>

<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-
  gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>DUI:</span>
  <input type="number" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="dui" placeholder="Escribe aquí...">
</div>

<c:if test="${initRol == 1}">
<br>
<div class="grid md:grid-cols-2 md:gap-6">
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Rol de usuario:</span>
  <select class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="rol" id="rol" onchange="javascript:setOption()">
  <option value="0" selected="selected">Seleccionar</option>
  <option value="1">Administrador(a)</option>
  <option value="2">Administrador(a) de Empresa</option>
  <option value="3">Cliente</option>
  <option value="4">Dependiente de Empresa</option>
  </select>
</div>
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Empresa:</span>
  <select class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="empresa" id="empresa">
  <option value="0" selected="selected">Seleccionar</option>
  <c:forEach var="empresas" items="${requestScope.listaEmpresas}">
  <c:if test="${empresas.idEmpresa != 'CUP001' && empresas.idEmpresa != 'NUL100'}">
  <option value="${empresas.idEmpresa}">${empresas.empresa}</option>
  </c:if>
  </c:forEach>
  </select>
</div>
</div>
<div id="here"></div>
</c:if>

<c:if test="${initRol == 2}">
<input type="hidden" value="4" name="rol">
<input type="hidden" value="${initEmpresa}" name="empresa">
</c:if>
<br>
<br>

<div class="flex p-4 mb-4 text-sm text-yellow-700 bg-yellow-100 rounded-lg dark:bg-yellow-200 dark:text-yellow-800" role="alert">
Los adatos de acceso para iniciar sesión por primer vez serán enviados al correo que se ha ingresado en este formulario 
junto al código para verificar la cuenta.
</div>

<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-
  gray-600 dark:text-gray-400 dark:border-gray-600"><span style="color: red">*</span>Correo:</span>
  <input type="email" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="email" placeholder="Escribe aquí...">
</div>

<br>

<input type="submit" class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 
font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800" value="Registrar información" style="cursor: pointer">
 <a class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg 
 text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900" href="${pageContext.request.contextPath}/usuarios.do?op=listar">Cancelar</a>
</form>
</div>
<br>
</body>
</html>

<script>
function setOption(){
	
	var userol = document.getElementById("rol").value;
	if(userol == 1){
		document.getElementById("empresa").disabled = true;
        document.getElementById("empresa").innerHTML += '<option selected="selected" >Seleccionar</option>';
        document.getElementById("here").innerHTML = '<input type="hidden" value="CUP001" name="empresa">';
        var rm = document.getElementById("empresa");
        if (rm.length > 0) {
            rm.remove(rm.length-1);
        }
	}else if(userol == 3){
		document.getElementById("empresa").disabled = true;
		document.getElementById("empresa").innerHTML += '<option selected="selected" >Seleccionar</option>';
	    document.getElementById("here").innerHTML = '<input type="hidden" value="NUL100" name="empresa">';
	        var rm = document.getElementById("empresa");
	        if (rm.length > 0) {
	            rm.remove(rm.length-1);
	        }
	}else{
		document.getElementById("empresa").disabled = false;
        document.getElementById("here").innerHTML = '<input type="hidden">';

	}
}
</script>
