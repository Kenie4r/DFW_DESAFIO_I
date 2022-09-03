
 	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<c:set var="initRol" scope="session" value="${pageContext.session.getAttribute('idRol') }" />
<c:if test="${empty initRol}">
		<c:redirect url="${pageContext.request.contextPath}/.."></c:redirect>
</c:if>
	<meta charset="ISO-8859-1">
	<title>Mis compras</title>
	<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
    <script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>
	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<body >
	<jsp:include page="/menu.jsp"></jsp:include>
	
	<section class='flex flex-row gap-4 h-full overflow-hidden'>
		<aside class="w-full p-6 sm:w-60 dark:bg-gray-900 dark:text-gray-100 m-2 border-solid  border-r-4 border-gray-300" >
		
			<nav class="space-y-8 text-sm">
				<div class="space-y-2">
					<h2 class="text-sm font-semibold tracking-widest uppercase dark:text-gray-400">Filtrar Cupones</h2>
					<div class="flex flex-col space-y-1">
						<a rel="noopener noreferrer" href="${pageContext.request.contextPath}/Miscompras">Todas mis compras</a>
						<a rel="noopener noreferrer" href="${pageContext.request.contextPath}/Miscompras?fl=Disponible">Cupones disponibles</a>
						<a rel="noopener noreferrer" href="${pageContext.request.contextPath}/Miscompras?fl=Canjeado">Cupones usados</a>
						<a rel="noopener noreferrer" href="${pageContext.request.contextPath}/Miscompras?fl=Vencido">Cupones vencidos</a>
					
						
					</div>
				</div>
				
			</nav>
		</aside>
	
	
		<div class="flex flex-col gap-4 w-full h-screen overflow-hidden" id='ofertas'>
				<h1 class="font-medium leading-tight text-xl mt-0 mb-2 mx-10  col-span-2">Cupones comprados</h1>	
				<div class=' overflow-y-scroll h-full  col-span-2 	'>
				
					<c:if test="${empty list}">
						<div id="alert-additional-content-2" class="p-4 mb-4 border border-red-300 rounded-lg bg-red-50 dark:bg-red-200" role="alert">
						  <div class="flex items-center">
						    <svg aria-hidden="true" class="w-5 h-5 mr-2 text-red-900 dark:text-red-800" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
						    <span class="sr-only">Información</span>
						    <h3 class="text-lg font-medium text-red-900 dark:text-red-800">¿No has comprado aún?</h3>
						  </div>
						  <div class="mt-2 mb-4 text-sm text-red-900 dark:text-red-800">
								Aún no existen cupones comprados para tí, si deseas comprar alguno ve al apartado de buscar ofertas donde están las mejores opciones para tí
						  </div>
						  <div class="flex">
						    
						  </div>
						</div>
					</c:if>
		<c:if test="${not empty list}">	<a href="${pageContext.request.contextPath}/ReportesController?op=" class="px-6 py-3 text-blue-100 no-underline bg-blue-500 rounded hover:bg-blue-600 hover:underline hover:text-blue-200">Ver mis recibos</a></c:if>	

					<c:forEach  items="${requestScope.list}" var="cupon">
					
						
					
				     	 
				     	  <section class="text-gray-600 body-font ">
			                    <div class="container px-5 my-5 mx-auto">
			                        <div class="p-5 bg-white flex items-center mx-auto border-b  mb-10 border-gray-200 rounded-lg sm:flex-row flex-col">
				                        <div class="sm:w-32 sm:h-32 h-20 w-20 sm:mr-10 inline-flex items-center justify-center flex-shrink-0">
				                            <img
				                              src="https://cdn-icons-png.flaticon.com/512/2851/2851418.png"/>
				                        </div>
			                        	<div class="flex-grow sm:text-left text-center mt-6 sm:mt-0">
			                            	<h1 class="text-black text-2xl title-font font-bold mb-2">${cupon.getOfertaD().getNombreOferta()}</h1>
			                            	<p class="leading-relaxed text-base">${cupon.getOfertaD().getDescripcion()}</p>
			                        
				                            <div class="md:flex font-bold text-gray-800">
				                                <div class="w-full md:w-1/2 flex space-x-3">
				                                    <div class="w-1/2">
				                                        <h2 class="text-gray-500">Fecha de Compra</h2>
				                                        <p >${cupon.getFechaCompra() }</p>
				                                    </div>
				                                    <div class="w-1/2">
				                                        <h2 class="text-gray-500">Fecha Limite de uso</h2>
				                                        <p>${cupon.getOfertaD().getFechaLimite()}</p>
				                                    </div>
				                                </div>
				                                <div class="w-full md:w-1/2 flex space-x-3">
				                                    <div class="w-1/2">
				                                        <h2 class="text-gray-500">Estado</h2>
				                                        <p>${cupon.getEstado() }</p>
				                                    </div>
				                                    <div class="w-1/2">
				                                        <h2 class="text-gray-500">Código de cupon</h2>
				                                        <button data-popover-target="popover-top-${cupon.getCodigoCupon() }" data-popover-placement="top" type="button" class="text-white mb-3 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Obtener codigo</button>
														<div id="popover-top-${cupon.getCodigoCupon() }" role="tooltip" class="inline-block absolute invisible z-10 w-64 text-sm font-light text-gray-500 bg-white rounded-lg border border-gray-200 shadow-sm opacity-0 transition-opacity duration-300 dark:text-gray-400 dark:border-gray-600 dark:bg-gray-800">
														    <div class="py-2 px-3 bg-gray-100 rounded-t-lg border-b border-gray-200 dark:border-gray-600 dark:bg-gray-700">
														        <h3 class="font-semibold text-gray-900 dark:text-white">Código de cupon</h3>
														    </div>
														    <div class="py-2 px-3">
														        <p>${cupon.getCodigoCupon() }</p>
														    </div>
														    <div data-popper-arrow></div>
														</div>
				                                    </div>
				                                </div>
				                            </div>
			                            <a class="mt-3 text-indigo-500 inline-flex items-center" href="${pageContext.request.contextPath}/ReportesController?op=recibo&idCupon=${cupon.getCodigoCupon()}" >Obtener mi PDF
			                            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">
			                                <path d="M5 12h14M12 5l7 7-7 7"></path>
			                            </svg>
			                            </a>
			                        </div>
			                        </div>
			                    </div>
			                </section>
	
		
	
					</c:forEach>
				
				
				
				
				</div>
				
		
	
	</div>
	
	
	</section>