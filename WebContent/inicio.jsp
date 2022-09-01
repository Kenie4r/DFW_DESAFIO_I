<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<c:set var="initRol" scope="session" value="${pageContext.session.getAttribute('idRol') }" />
<c:if test="${empty initRol}">
		<c:redirect url="${pageContext.request.contextPath}/.."></c:redirect>
</c:if>
<html>
<head>
    <title>Inicio La Cuponera</title>
   <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
    <script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-300">
	<nav>	
			<jsp:include page="/menu.jsp"/>
	</nav>
	<section class=" bg-white" style="height:95vh;">
		<div class="max-w-7xl px-5 py-12 flex flex-col space-y-5 w-full h-full items-center justify-center mx-auto" >
			<div class="flex h-full w-full  rounded-md shadow-md	" >
			
				<div class="w-full  bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700" >
				    <div class="flex flex-col w-full justify-end px-4 pt-4">
				        <button id="dropdownButton" data-dropdown-toggle="dropdown" class="inline-block text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:ring-4 focus:outline-none focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-1.5 max-w-min" type="button">
				            <span class="sr-only">Ajustes</span>
				            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z"></path></svg>
				        </button>
				        <!-- Dropdown menu -->
				        <div id="dropdown" class="z-10 w-44 text-base list-none bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 block" data-popper-reference-hidden="" data-popper-escaped="" data-popper-placement="bottom" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(446px, 83px);">
				            <ul class="py-1" aria-labelledby="dropdownButton">
				       
				            <li>
				                <a href="#" class="block py-2 px-4 text-sm text-red-600 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Cerrar sesión</a>
				            </li>
				            </ul>
				        </div>
				    </div>
				    <div class="flex flex-col items-center pb-10">
				        <img class="mb-3 w-24 h-24 rounded-full shadow-lg" src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="${pageContext.session.getAttribute('nombre')} ${pageContext.session.getAttribute('apellido')}">
				        <h5 class="mb-1 text-xl font-medium text-gray-900 dark:text-white">${pageContext.session.getAttribute("nombre")} ${pageContext.session.getAttribute("apellido") }</h5>
				        <span class="text-sm text-gray-500 dark:text-gray-400">${pageContext.session.getAttribute("username") }</span>
				        <div class="flex mt-4 space-x-3 md:mt-6">
				            <a href="#" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-700 dark:focus:ring-gray-700" id='btn_passch'>Cambiar contraseña</a>
				        </div>
				    </div>
				</div>
				
			</div>
			<c:choose>
			
				<c:when test="${initRol == 3}">
					<div class="flex space-x-5 w-full h-full">
						<div class="flex h-full w-full  rounded-md 	">
					
						<div class="p-6  bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700">
						    <svg class="mb-2 w-10 h-10 text-gray-500 dark:text-gray-400" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 5a3 3 0 015-2.236A3 3 0 0114.83 6H16a2 2 0 110 4h-5V9a1 1 0 10-2 0v1H4a2 2 0 110-4h1.17C5.06 5.687 5 5.35 5 5zm4 1V5a1 1 0 10-1 1h1zm3 0a1 1 0 10-1-1v1h1z" clip-rule="evenodd"></path><path d="M9 11H3v5a2 2 0 002 2h4v-7zM11 18h4a2 2 0 002-2v-5h-6v7z"></path></svg>
						    <a href="${pageContext.request.contextPath }/Miscompras">
						        <h5 class="mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">Busca todos tus cupones</h5>
						    </a>
						    <p class="mb-3 font-normal text-gray-500 dark:text-gray-400">¡No te olvides de reclamar tus cupones antes de que se finalice la promoción!</p>
						    <a href="${pageContext.request.contextPath }/Miscompras" class="inline-flex items-center text-blue-600 hover:underline">
						        Ir a mis compras
						        <svg class="ml-2 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z"></path><path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z"></path></svg>
						    </a>
						</div>
					
					</div>
					<div class="flex h-full w-full  rounded-md 	">
							<div class="p-6  bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700">
							    <svg class="mb-2 w-10 h-10 text-gray-500 dark:text-gray-400" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 5a3 3 0 015-2.236A3 3 0 0114.83 6H16a2 2 0 110 4h-5V9a1 1 0 10-2 0v1H4a2 2 0 110-4h1.17C5.06 5.687 5 5.35 5 5zm4 1V5a1 1 0 10-1 1h1zm3 0a1 1 0 10-1-1v1h1z" clip-rule="evenodd"></path><path d="M9 11H3v5a2 2 0 002 2h4v-7zM11 18h4a2 2 0 002-2v-5h-6v7z"></path></svg>
							    <a href="#">
							        <h5 class="mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">Ver mis metodos de pago</h5>
							    </a>
							    <p class="mb-3 font-normal text-gray-500 dark:text-gray-400">Administra tus metodos de pago para obtener las mejores ofertas del sitio</p>
							    <a href="#" class="inline-flex items-center text-blue-600 hover:underline">
							        Administrar metodos de pago
							        <svg class="ml-2 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z"></path><path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z"></path></svg>
							    </a>
							</div>
					
						</div>
					</div>
				
				</c:when>
				<c:otherwise>
					<div class="flex space-x-5 w-full h-full">
						<div class="flex h-full w-full  rounded-md 	">
					
						<div class="p-6  bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700">
						    <svg class="mb-2 w-10 h-10 text-gray-500 dark:text-gray-400" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 5a3 3 0 015-2.236A3 3 0 0114.83 6H16a2 2 0 110 4h-5V9a1 1 0 10-2 0v1H4a2 2 0 110-4h1.17C5.06 5.687 5 5.35 5 5zm4 1V5a1 1 0 10-1 1h1zm3 0a1 1 0 10-1-1v1h1z" clip-rule="evenodd"></path><path d="M9 11H3v5a2 2 0 002 2h4v-7zM11 18h4a2 2 0 002-2v-5h-6v7z"></path></svg>
						    <a href="#">
						        <h5 class="mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">Usuarios de la aplicación</h5>
						    </a>
						    <p class="mb-3 font-normal text-gray-500 dark:text-gray-400">Verifica todos los usuarios de la aplicación</p>
						    <a href="${pageContext.request.contextPath }/usuarios.do"class="inline-flex items-center text-blue-600 hover:underline">
						        Ir a usuarios
						        <svg class="ml-2 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z"></path><path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z"></path></svg>
						    </a>
						</div>
					
					</div>
					<div class="flex h-full w-full  rounded-md 	">
							<div class="p-6  bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700">
							    <svg class="mb-2 w-10 h-10 text-gray-500 dark:text-gray-400" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 5a3 3 0 015-2.236A3 3 0 0114.83 6H16a2 2 0 110 4h-5V9a1 1 0 10-2 0v1H4a2 2 0 110-4h1.17C5.06 5.687 5 5.35 5 5zm4 1V5a1 1 0 10-1 1h1zm3 0a1 1 0 10-1-1v1h1z" clip-rule="evenodd"></path><path d="M9 11H3v5a2 2 0 002 2h4v-7zM11 18h4a2 2 0 002-2v-5h-6v7z"></path></svg>
							    <a href="#">
							        <h5 class="mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">Ver Ofertas</h5>
							    </a>
							    <p class="mb-3 font-normal text-gray-500 dark:text-gray-400">Administra las ofertas de la aplicación</p>
							    <a href="#" class="inline-flex items-center text-blue-600 hover:underline">
							        Administrar ofertas
							        <svg class="ml-2 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M11 3a1 1 0 100 2h2.586l-6.293 6.293a1 1 0 101.414 1.414L15 6.414V9a1 1 0 102 0V4a1 1 0 00-1-1h-5z"></path><path d="M5 5a2 2 0 00-2 2v8a2 2 0 002 2h8a2 2 0 002-2v-3a1 1 0 10-2 0v3H5V7h3a1 1 0 000-2H5z"></path></svg>
							    </a>
							</div>
					
						</div>
					</div>
				
				
				
				</c:otherwise>
			
			
			
			</c:choose>
			
		</div>
	</section> 
	
	
	<script type="text/javascript" src="Resources/scripts/user_control.js"></script>
</body>
</html>