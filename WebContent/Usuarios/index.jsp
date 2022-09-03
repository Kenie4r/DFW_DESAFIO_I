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

<title>Usuarios - La Cuponera</title>
</head>

<body>
<header>
<jsp:include page="/menu.jsp"></jsp:include>
</header>
<br>
<div style="margin-left: 5vw; margin-right: 18vw; ">
<h1 class="text-left" style="font-size: 35px"><b>Lista de Usuarios</b></h1>
<br>
<a class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium 
rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800" href="${pageContext.request.contextPath}/usuarios.do?op=nuevo">Registrar nuevo</a>
<br>
<br>
<br>

<form method="GET">
<c:if test="${initRol == 1}">
<div class="grid md:grid-cols-2 md:gap-6">
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">Rol de usuario:</span>
  <select class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="rol">
  <option>Seleccionar</option>
  <option value="1">Administrador(a)</option>
  <option value="2">Administrador(a) de Empresa</option>
  <option value="3">Cliente</option>
  <option value="4">Dependiente de Empresa</option>
  </select>
</div>
<div class="flex">
 <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">Empresa:</span>
  <select class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="empresa">
  <option>Seleccionar</option>
  <c:forEach var="empresas" items="${requestScope.listaEmpresas}">
  <option value="${empresas.idEmpresa}">${empresas.empresa}</option>
 </c:forEach>
  </select>
</div>
</div>
<br>
</c:if>

<div class="grid md:grid-cols-2 md:gap-6">
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">Usuario:</span>
  <input type="text" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" Placeholder="Escribe aquí..." name="username">
</div>
<div class="flex">
<input type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 
mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" value="Buscar" style="cursor: pointer">
<a class="text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg 
text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-700 dark:border-gray-700" href="${pageContext.request.contextPath}/usuarios.do?op=listar">Restablecer</a>
</div>
</div>

</form>
<br>
<div class="overflow-x-auto relative">
<table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
  <thead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
    <tr style="background-color: #ffd88e">
      <th scope="col" class="py-3 px-6 rounded-l-lg">Usuario</th>
      <th scope="col" class="py-3 px-6">Nombre</th>
      <th scope="col" class="py-3 px-6">Correo</th>
      <c:if test="${initRol == 1}">
      <th scope="col" class="py-3 px-6">Rol</th>
      </c:if>
      <th scope="col" class="py-3 px-6 rounded-r-lg" colspan="3">Acciones</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="cont" value="${0}"></c:set>
  
  <c:if test="${initRol == 1}"><!-- ADMIN LA CUPONERA -->
   <c:forEach var="usuarios" items="${requestScope.listaUsuarios}">
   
    <c:if test="${param.op == 'listar'}">
    <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>@${usuarios.username}</b></td>
      <td class="py-4 px-6">${usuarios.nombre} ${usuarios.apellido}</td>
      <td class="py-4 px-6">${usuarios.eMail}</td>
      <c:if test="${usuarios.idRol == 1}">
      <td class="py-4 px-6">Administrador(a)</td>
      </c:if>
      <c:if test="${usuarios.idRol == 2}">
      <td class="py-4 px-6">Administrador(a) de Empresa</td>
      </c:if>
      <c:if test="${usuarios.idRol == 3}">
      <td class="py-4 px-6">Cliente</td>
      </c:if>
      <c:if test="${usuarios.idRol == 4}">
      <td class="py-4 px-6">Dependiente de Empresa</td>
      </c:if>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuarios.do?op=obtener&id=${usuarios.idUsuario}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i> Editar</a></td>
      <td class="py-4 px-6"><a href="javascript:eliminar('${usuarios.idUsuario}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuario?op=recoverPass&email=${usuarios.eMail}"><i class="fas fa-lock" style="color: black; cursor: pointer;"></i> Cambiar Contraseña</a></td>
    </tr>
    </c:if>
    
    <c:if test="${param.username == usuarios.username}">
       <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>@${usuarios.username}</b></td>
      <td class="py-4 px-6">${usuarios.nombre} ${usuarios.apellido}</td>
      <td class="py-4 px-6">${usuarios.eMail}</td>
      <c:if test="${usuarios.idRol == 1}">
      <td class="py-4 px-6">Administrador(a)</td>
      </c:if>
      <c:if test="${usuarios.idRol == 2}">
      <td class="py-4 px-6">Administrador(a) de Empresa</td>
      </c:if>
      <c:if test="${usuarios.idRol == 3}">
      <td class="py-4 px-6">Cliente</td>
      </c:if>
      <c:if test="${usuarios.idRol == 4}">
      </c:if>
      <td class="py-4 px-6">${usuarios.empresa}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuarios.do?op=obtener&id=${usuarios.idUsuario}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i> Editar</a></td>
      <td class="py-4 px-6"><a href="javascript:eliminar('${usuarios.idUsuario}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuario?op=recoverPass&email=${usuarios.eMail}"><i class="fas fa-lock" style="color: black; cursor: pointer;"></i> Cambiar Contraseña</a></td>
    </tr>
    </c:if>
    
    <c:if test="${param.rol == usuarios.idRol}">
       <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>@${usuarios.username}</b></td>
      <td class="py-4 px-6">${usuarios.nombre} ${usuarios.apellido}</td>
      <td class="py-4 px-6">${usuarios.eMail}</td>
      <c:if test="${usuarios.idRol == 1}">
      <td class="py-4 px-6">Administrador(a)</td>
      </c:if>
      <c:if test="${usuarios.idRol == 2}">
      <td class="py-4 px-6">Administrador(a) de Empresa</td>
      </c:if>
      <c:if test="${usuarios.idRol == 3}">
      <td class="py-4 px-6">Cliente</td>
      </c:if>
      <c:if test="${usuarios.idRol == 4}">
      <td class="py-4 px-6">Dependiente de Empresa</td>
      </c:if>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuarios.do?op=obtener&id=${usuarios.idUsuario}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i> Editar</a></td>
      <td class="py-4 px-6"><a href="javascript:eliminar('${usuarios.idUsuario}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuario?op=recoverPass&email=${usuarios.eMail}"><i class="fas fa-lock" style="color: black; cursor: pointer;"></i> Cambiar Contraseña</a></td>
    </tr>
    </c:if>
    
    <c:if test="${param.empresa == usuarios.idEmpresa}">
       <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>@${usuarios.username}</b></td>
      <td class="py-4 px-6">${usuarios.nombre} ${usuarios.apellido}</td>
      <td class="py-4 px-6">${usuarios.eMail}</td>
      <c:if test="${usuarios.idRol == 1}">
      <td class="py-4 px-6">Administrador(a)</td>
      </c:if>
      <c:if test="${usuarios.idRol == 2}">
      <td class="py-4 px-6">Administrador(a) de Empresa</td>
      </c:if>
      <c:if test="${usuarios.idRol == 3}">
      <td class="py-4 px-6">Cliente</td>
      </c:if>
      <c:if test="${usuarios.idRol == 4}">
      <td class="py-4 px-6">Dependiente de Empresa</td>
      </c:if>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuarios.do?op=obtener&id=${usuarios.idUsuario}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i> Editar</a></td>
      <td class="py-4 px-6"><a href="javascript:eliminar('${usuarios.idUsuario}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuario?op=recoverPass&email=${usuarios.eMail}"><i class="fas fa-lock" style="color: black; cursor: pointer;"></i> Cambiar Contraseña</a></td>
    </tr>
    </c:if>
    
    </c:forEach>
    </c:if>
    
    <c:if test="${initRol == 2}"><!-- ADMIN EMPRESA -->
   <c:forEach var="usuarios" items="${requestScope.listaUsuarios}">
   
    <c:if test="${param.op == 'listar' && usuarios.idEmpresa == initEmpresa && usuarios.idRol == 4}">
    <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>@${usuarios.username}</b></td>
      <td class="py-4 px-6">${usuarios.nombre} ${usuarios.apellido}</td>
      <td class="py-4 px-6">${usuarios.eMail}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuarios.do?op=obtener&id=${usuarios.idUsuario}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i> Editar</a></td>
      <td class="py-4 px-6"><a href="javascript:eliminar('${usuarios.idUsuario}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuario?op=recoverPass&email=${usuarios.eMail}"><i class="fas fa-lock" style="color: black; cursor: pointer;"></i> Cambiar Contraseña</a></td>
    </tr>
    </c:if>
    
    <c:if test="${param.username == usuarios.username && usuarios.idEmpresa == initEmpresa && usuarios.idRol == 4}">
       <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>@${usuarios.username}</b></td>
      <td class="py-4 px-6">${usuarios.nombre} ${usuarios.apellido}</td>
      <td class="py-4 px-6">${usuarios.eMail}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuarios.do?op=obtener&id=${usuarios.idUsuario}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i> Editar</a></td>
      <td class="py-4 px-6"><a href="javascript:eliminar('${usuarios.idUsuario}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/usuario?op=recoverPass&email=${usuarios.eMail}"><i class="fas fa-lock" style="color: black; cursor: pointer;"></i> Cambiar Contraseña</a></td>
    </tr>
    </c:if>
      
    </c:forEach>
    </c:if>
    
    <c:if test="${(initRol == 1 &&param.username == '' && param.rol == 'Seleccionar' && param.empresa == 'Seleccionar') || (initRol == 2 && param.username == '')}">
    <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6" colspan="3">No ha ingresado ningún valor. Intente de nuevo</td>
      </tr>
    </c:if>
    
    <c:if test="${cont == 0}">
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6" colspan="3">No se ha encontrado ningún resultado. Intente de nuevo</td>
      </tr>
    </c:if>
      
  </tbody>
</table>
</div>
</div>
</body>
</html>

<script>
  function eliminar(id){
    if(confirm('¿Desea eliminar el elemento seleccionado?')){
    	 location.href = 'usuarios.do?op=eliminar&id='+id;
    }
  }
</script>