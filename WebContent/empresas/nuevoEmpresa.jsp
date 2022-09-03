<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<c:set var="initRol" scope="session" value="${pageContext.session.getAttribute('idRol') }" />
<c:if test="${empty initRol}">
        <c:redirect url="${pageContext.request.contextPath}/.."></c:redirect>
</c:if>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Nueva empresa - La Cuponera</title>
	<link href="https://unpkg.com/tailwindcss@%5E2/dist/tailwind.min.css" rel="stylesheet">
	
	<script src="https://kit.fontawesome.com/28279bfb40.js" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
	<script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>
        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">      
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.all.min.js"></script>      
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
		 <li>${ok}<a class="alert-link" href="${pageContext.request.contextPath}/empresas.do?op=listar"><b> Ver lista de ofertas</b></a></li>
		 </c:forEach>
		 </ul>
		 </div>
	</c:if>	     
	<div style="margin-left: 5vw; margin-right: 20vw; ">
		<h1 class="text-left" style="font-size: 35px"><b>Añadir nueva empresa</b></h1>
		<br>
		<div class="p-4 mb-4 text-sm text-blue-700 bg-blue-100 rounded-lg dark:bg-blue-200 dark:text-blue-800" role="alert">
			Complete toda la información solicitada, los campos (*) son obligatorios.
		</div>
        <div class="row">
            <div class="col-md-10">
      
                <form role="form" action="${pageContext.request.contextPath}/empresas.do" method="POST">
                    <input type="hidden" name="op" value="insertar">                    			
 					<div class="flex">
                        <span 
                            class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                            <span style="color: red">*</span>Codigo de empresa:</span>
                        <input 
                            class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            type="text" name="codigo" id="codigo" value="${empresas.IdEmpresa}" placeholder="Ingresa el codigo de la Empresa">
                    </div>
                    <br>
                    <div class="flex">
                        <span 
                            class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                            <span style="color: red">*</span>Nombre de empresa:</span>                        
                        <input
                            class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                            type="text" class="form-control" name="nombre" id="nombre" value="${empresas.NombreEmpresa}" placeholder="Ingresa el nombre de la Empresa">                    
                    </div>
                    <br>
                    <div class="flex">
                        <span 
                            class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                            <span style="color: red">*</span>Ubicacion de la empresa:</span> 
                        <input 
                            class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                            type="text" class="form-control" name="ubicacion" id="ubicacion" value="${empresas.Ubicacion}" placeholder="Ingresa la ubicacion de la Empresa">                            
                    </div>
                    <br>
                    <div class="flex">
                        <span 
                            class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                            <span style="color: red">*</span>Nombre de contacto:</span>                                                
                        <input
                            class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                            type="text" class="form-control" name="contacto" id="contacto" value="${empresas.Contacto}" placeholder="Ingresa el nombre de contacto de la Empresa">
                    </div>
                    <br>
                    <div class="flex">
                        <span 
                            class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                            <span style="color: red">*</span>Telefono de empresa:</span>                        
                        <input 
                            class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                            type="text" class="form-control" name="telefono" id="telefono" value="${empresas.Telefono}" placeholder="Ingresa el telefono de la Empresa">                                            
                    </div>
                    <br>
                    <div class="flex">
                        <span 
                            class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
                            <span style="color: red">*</span>Correo de empresa:</span>                                                  
                        <input 
                            class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                            type="text" class="form-control" name="correo" id="correo" value="${empresas.Correo}" placeholder="Ingresa el correo de la Empresa">
                    </div>
                    <br>
                    <div class="flex">
                        <span 
                            class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">                            
                            <span style="color: red">*</span>Porcentaje de ganancias:</span>                                                 
                        <input 
                            class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            type="number" step="0.1" min="0" class="form-control" name="ganancias" id="ganancias" value="${empresas.PorcentajeGanancias}" placeholder="Ingresa el porcentaje de Ganancias de la Empresa">                                                    
                   	</div> 
          	 		<br>
					<div class="flex">
					    <span
					        class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">
					        <span style="color: red">*</span>Rubro:</span>
					    <div class="cursor-pointer w-full border-gray-100 rounded-t border-b hover:bg-teal-100">
					        <select name="rubro" id="rubro" class="w-full items-center flex">
					            <c:forEach var="rubrosBean" items="${requestScope.listaRubros}">
					                <option value="${rubrosBean.idRubro}">${rubrosBean.nombre}</option>
					            </c:forEach>
					        </select>
					
					    </div>
					</div>
					<br>
					<input
					    class="border border-green-500 bg-green-500 text-white rounded-md px-4 py-2 m-2 transition duration-500 ease select-none hover:bg-green-600 focus:outline-none focus:shadow-outline"
					    type="submit" value="Guardar" name="Guardar">
					<a class="border border-red-500 bg-red-500 text-white rounded-md px-4 py-2 m-2 transition duration-500 ease select-none hover:bg-red-600 focus:outline-none focus:shadow-outline"
					    href="${pageContext.request.contextPath}/empresas.do?op=listar">Cancelar</a>
                </form>                                        
            </div>
        </div>
    </div>
</body>
</html>