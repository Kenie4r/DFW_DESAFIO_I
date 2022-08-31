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

<title>Ofertas - La Cuponera</title>
</head>

<body>
<header>
<jsp:include page="/menu.jsp"></jsp:include>
</header>
<br>
<div style="margin-left: 5vw; margin-right: 20vw; ">
<h1 class="text-left" style="font-size: 35px"><b>Lista de ofertas</b></h1>
<br>

<c:if test="${idRol == 2}">
<a class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium 
rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800" href="${pageContext.request.contextPath}/ofertas.do?op=nuevo">Registrar nueva</a>
<br>
<br>
<br>
</c:if>

<form method="GET">
<div class="grid md:grid-cols-2 md:gap-6">
 <div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">Nombre:</span>
  <input type="text" class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" Placeholder="Escribe aquí..." name="nombre">
</div>
<div class="flex">
  <span class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">Estado:</span>
  <select class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" name="estado">
  <option>Seleccionar</option>
  <option>PENDIENTE</option>
  <option>APROBADA</option>
  <option>RECHAZADA</option>
  <option>DESCARTADA</option>
  <option>ACABADA</option>
  <option>VENCIDA</option>
  </select>
</div>
</div>

<br>
<input type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 
mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" value="Buscar" style="cursor: pointer">
<a class="text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg 
text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-700 dark:border-gray-700" href="${pageContext.request.contextPath}/ofertas.do?op=listar">Restablecer</a>
</form>
<br>

<div class="overflow-x-auto relative">
<table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
  <thead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
    <tr style="background-color: #ffd88e">
      <th scope="col" class="py-3 px-6 rounded-l-lg">ID</th>
      <th scope="col" class="py-3 px-6">Nombre</th>
      <th scope="col" class="py-3 px-6">Descripción</th>
      <th scope="col" class="py-3 px-6">Cupones disponibles</th>
      <c:if test="${initRol == 1}">
      <th scope="col" class="py-3 px-6">Empresa</th>
      </c:if>
       <th scope="col" class="py-3 px-6">Observaciones</th>
      <th scope="col" class="py-3 px-6">Estado</th>
      <th scope="col" class="py-3 px-6 rounded-r-lg" colspan="2">Acciones</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="cont" value="${0}"></c:set>
  
  <c:if test="${initRol == 1}"><!-- ADMIN LA CUPONERA -->
   <c:forEach var="ofertas" items="${requestScope.listaOfertas}">
   
     <c:if test="${param.op == 'listar'}">
     <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>${ofertas.idOferta}</b></td>
      <td class="py-4 px-6">${ofertas.nombre}</td>
      <td class="py-4 px-6">${ofertas.descripcion}</td>
      <td class="py-4 px-6">${ofertas.cupones}</td>
      <c:if  test="${initRol == 1}">
      <td class="py-4 px-6">${ofertas.empresa}</td>
      </c:if>
      <td class="py-4 px-6">${ofertas.observaciones}</td>
      <td class="py-4 px-6">${ofertas.estado}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/ofertas.do?op=revisar&id=${ofertas.idOferta}"><i class="fas fa-eye"  style="color: blue; cursor: pointer;"></i> Ver</a></td>
      <c:if test="${initRol == 2 && ofertas.estado == 'RECHAZADA'}">
      <td class="py-4 px-6"><a href="javascript:descartar('${ofertas.idOferta}','${ofertas.observaciones}')"><i class="fas fa-ban"  style="color: red; cursor: pointer;"></i> Descartar</a></td>
      </c:if>
     <!--  --> <c:if test="${initRol == 2 && ofertas.estado == 'DESCARTADA'}">
      <td class="py-4 px-6"><a href="javascript:eliminar('${ofertas.idOferta}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      </c:if>    
    </tr>
      </c:if>
      
      <c:if test="${param.nombre == ofertas.nombre}">
      <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>${ofertas.idOferta}</b></td>
      <td class="py-4 px-6">${ofertas.nombre}</td>
      <td class="py-4 px-6">${ofertas.descripcion}</td>
      <td class="py-4 px-6">${ofertas.cupones}</td>
      <c:if  test="${initRol == 1}">
      <td class="py-4 px-6">${ofertas.empresa}</td>
      </c:if>
      <td class="py-4 px-6">${ofertas.observaciones}</td>
      <td class="py-4 px-6">${ofertas.estado}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/ofertas.do?op=revisar&id=${ofertas.idOferta}"><i class="fas fa-eye"  style="color: blue; cursor: pointer;"></i> Ver</a></td>
      <c:if test="${initRol == 2 && ofertas.estado == 'RECHAZADA'}">
      <td class="py-4 px-6"><a href="javascript:descartar('${ofertas.idOferta}','${ofertas.observaciones}')"><i class="fas fa-ban"  style="color: red; cursor: pointer;"></i> Descartar</a></td>
      </c:if>
      <c:if test="${initRol == 2 && ofertas.estado == 'DESCARTADA'}">
      <td class="py-4 px-6"><a href="javascript:eliminar('${ofertas.idOferta}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      </c:if>    
    </tr>
    </c:if>
    
    <c:if test="${ofertas.estado == param.estado}">
    <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>${ofertas.idOferta}</b></td>
      <td class="py-4 px-6">${ofertas.nombre}</td>
      <td class="py-4 px-6">${ofertas.descripcion}</td>
      <td class="py-4 px-6">${ofertas.cupones}</td>
      <c:if  test="${initRol == 1}">
      <td class="py-4 px-6">${ofertas.empresa}</td>
      </c:if>
      <td class="py-4 px-6">${ofertas.observaciones}</td>
      <td class="py-4 px-6">${ofertas.estado}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/ofertas.do?op=revisar&id=${ofertas.idOferta}"><i class="fas fa-eye"  style="color: blue; cursor: pointer;"></i> Ver</a></td>    
    <c:if test="${initRol == 2 && ofertas.estado == 'RECHAZADA'}">
      <td class="py-4 px-6"><a href="javascript:descartar('${ofertas.idOferta}','${ofertas.observaciones}')"><i class="fas fa-ban"  style="color: red; cursor: pointer;"></i> Descartar</a></td>
      </c:if>
      <c:if test="${initRol == 2 && ofertas.estado == 'DESCARTADA'}">
      <td class="py-4 px-6"><a href="javascript:eliminar('${ofertas.idOferta}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      </c:if>    
    </tr>
    </c:if>
    
    </c:forEach>
 </c:if>
 
 <c:if test="${initRol == 2}"><!-- ADMIN EMPRESA -->
   <c:forEach var="ofertas" items="${requestScope.listaOfertas}">
   
     <c:if test="${param.op == 'listar'}">
      <c:if test="${ofertas.empresaID == initEmpresa}">
     <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>${ofertas.idOferta}</b></td>
      <td class="py-4 px-6">${ofertas.nombre}</td>
      <td class="py-4 px-6">${ofertas.descripcion}</td>
      <td class="py-4 px-6">${ofertas.cupones}</td>
      <c:if  test="${initRol == 1}">
      <td class="py-4 px-6">${ofertas.empresa}</td>
      </c:if>
      <td class="py-4 px-6">${ofertas.observaciones}</td>
      <td class="py-4 px-6">${ofertas.estado}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/ofertas.do?op=revisar&id=${ofertas.idOferta}"><i class="fas fa-eye"  style="color: blue; cursor: pointer;"></i> Ver</a></td>
      <c:if test="${initRol == 2 && ofertas.estado == 'RECHAZADA'}">
      <td class="py-4 px-6"><a href="javascript:descartar('${ofertas.idOferta}','${ofertas.observaciones}')"><i class="fas fa-ban"  style="color: red; cursor: pointer;"></i> Descartar</a></td>
      </c:if>
     <!--  --> <c:if test="${initRol == 2 && ofertas.estado == 'DESCARTADA'}">
      <td class="py-4 px-6"><a href="javascript:eliminar('${ofertas.idOferta}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      </c:if>    
    </tr>
      </c:if>
      </c:if>
      
      <c:if test="${param.nombre == ofertas.nombre}">
      <c:if test="${ofertas.empresaID == initEmpresa}">
      <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>${ofertas.idOferta}</b></td>
      <td class="py-4 px-6">${ofertas.nombre}</td>
      <td class="py-4 px-6">${ofertas.descripcion}</td>
      <td class="py-4 px-6">${ofertas.cupones}</td>
      <c:if  test="${initRol == 1}">
      <td class="py-4 px-6">${ofertas.empresa}</td>
      </c:if>
      <td class="py-4 px-6">${ofertas.observaciones}</td>
      <td class="py-4 px-6">${ofertas.estado}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/ofertas.do?op=revisar&id=${ofertas.idOferta}"><i class="fas fa-eye"  style="color: blue; cursor: pointer;"></i> Ver</a></td>
      <c:if test="${initRol == 2 && ofertas.estado == 'RECHAZADA'}">
      <td class="py-4 px-6"><a href="javascript:descartar('${ofertas.idOferta}','${ofertas.observaciones}')"><i class="fas fa-ban"  style="color: red; cursor: pointer;"></i> Descartar</a></td>
      </c:if>
      <c:if test="${initRol == 2 && ofertas.estado == 'DESCARTADA'}">
      <td class="py-4 px-6"><a href="javascript:eliminar('${ofertas.idOferta}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      </c:if>    
    </tr>
    </c:if>
    </c:if>
    
    <c:if test="${ofertas.estado == param.estado}">
    <c:if test="${ofertas.empresaID == initEmpresa}">
    <c:set var="cont" value="${cont + 1}"></c:set>
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6"><b>${ofertas.idOferta}</b></td>
      <td class="py-4 px-6">${ofertas.nombre}</td>
      <td class="py-4 px-6">${ofertas.descripcion}</td>
      <td class="py-4 px-6">${ofertas.cupones}</td>
      <c:if  test="${initRol == 1}">
      <td class="py-4 px-6">${ofertas.empresa}</td>
      </c:if>
      <td class="py-4 px-6">${ofertas.observaciones}</td>
      <td class="py-4 px-6">${ofertas.estado}</td>
      <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/ofertas.do?op=revisar&id=${ofertas.idOferta}"><i class="fas fa-eye"  style="color: blue; cursor: pointer;"></i> Ver</a></td>    
    <c:if test="${initRol == 2 && ofertas.estado == 'RECHAZADA'}">
      <td class="py-4 px-6"><a href="javascript:descartar('${ofertas.idOferta}','${ofertas.observaciones}')"><i class="fas fa-ban"  style="color: red; cursor: pointer;"></i> Descartar</a></td>
      </c:if>
      <c:if test="${initRol == 2 && ofertas.estado == 'DESCARTADA'}">
      <td class="py-4 px-6"><a href="javascript:eliminar('${ofertas.idOferta}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i> Eliminar</a></td>
      </c:if>    
    </tr>
    </c:if>
    </c:if>
    
    </c:forEach>
 </c:if>
 
 
  <c:if test="${param.nombre == '' && param.estado == 'Seleccionar'}">
      <c:set var="cont" value="${cont + 1}"></c:set>
        <tr>
        <td class="py-4 px-6" colspan="4">No ha ingresado ningún valor. Intente de nuevo</td>
        </tr>
   </c:if>
   
   <c:if test="${cont == 0}">
    <tr class="bg-white dark:bg-gray-800">
      <td class="py-4 px-6" colspan="4">No se ha encontrado ningún resultado. Intente de nuevo</td>
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
    	 location.href = 'ofertas.do?op=eliminar&id='+id;
    }
  }
  function descartar(id, observaciones){
	    if(confirm('¿Desea descartar el elemento seleccionado?')){
	    	 location.href = 'ofertas.do?op=descartar&id='+id+'&obs='+observaciones;
	    }
	  }
</script>