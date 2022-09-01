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
	<title>Listado de Ofertas</title>
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
					<h2 class="text-sm font-semibold tracking-widest uppercase dark:text-gray-400">Filtrar ofertas</h2>
					<div class="flex flex-col space-y-1">
						<a rel="noopener noreferrer" href="${pageContext.request.contextPath}/ofertas">Todas las ofertas</a>
						<c:forEach items='${requestScope.rubros }' var="rubro">
							<c:if test="${rubro.getIdRubro() >2 }">
															<a rel="noopener noreferrer" href="${pageContext.request.contextPath}/ofertas?rubro=${rubro.getIdRubro()}">Ofertas de ${rubro.getNombre()}</a>
								
							</c:if>
						
							
						</c:forEach>
						
					</div>
				</div>
				
			</nav>
		</aside>
	
	
		<div class="flex flex-col gap-4 w-full h-screen overflow-hidden " id='ofertas'>
				<h1 class="font-medium leading-tight text-xl mt-0 mb-2 mx-10 ">Listado de ofertas activas</h1>	
				<div class=' overflow-y-scroll h-full  '>
				<c:if test="${empty Listaofertas}">
					<div id="alert-additional-content-2" class="p-4 mb-4 border border-red-300 rounded-lg bg-red-50 dark:bg-red-200" role="alert">
						  <div class="flex items-center">
						    <svg aria-hidden="true" class="w-5 h-5 mr-2 text-red-900 dark:text-red-800" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
						    <span class="sr-only">Información</span>
						    <h3 class="text-lg font-medium text-red-900 dark:text-red-800">No hay ofertas activas</h3>
						  </div>
						  <div class="mt-2 mb-4 text-sm text-red-900 dark:text-red-800">
								No existen ofertas activas para este filtro, vuelve más tarde para poder obtener las mejores ofertas dentro de nuestra aplicación, 
								La Cuponera, tu lugar de cupones :)
						  </div>
						  <div class="flex">
						    
						  </div>
						</div>
				
				</c:if>
					<c:forEach  items="${requestScope.Listaofertas}" var="oferta">
					
					<section class="text-gray-600 body-font ">
			                    <div class="container px-5 my-5 mx-auto">
			                        <div class="p-5 bg-white flex items-center mx-auto border-b  mb-10 border-gray-200 rounded-lg sm:flex-row flex-col">
				                        <div class="sm:w-32 sm:h-32 h-20 w-20 sm:mr-10 inline-flex items-center justify-center flex-shrink-0">
				                            <img
				                              src="https://cdn.iconscout.com/icon/free/png-256/discount-1942889-1644351.png"/>
				                        </div>
			                        	<div class="flex-grow sm:text-left text-center mt-6 sm:mt-0">
			                            	<h1 class="text-black text-2xl title-font font-bold mb-2">${oferta.getNombreOferta() }</h1>
			                            	<p class="leading-relaxed text-base">${oferta.getDescripcion()}</p>
			                        
				                            <div class="md:flex font-bold text-gray-800">
				                                <div class="w-full md:w-1/2 flex space-x-3">
				                                    <div class="w-1/2">
				                                        <h2 class="text-gray-500">Fecha de inicio</h2>
				                                        <p >${oferta.getInicio()}</p>
				                                    </div>
				                                    <div class="w-1/2">
				                                        <h2 class="text-gray-500">Fecha final</h2>
				                                        <p>${oferta.getFechaFin()}</p>
				                                    </div>
				                                </div>
				                                <div class="w-full md:w-1/2 flex space-x-3">
				                                    <div class="w-1/2">
				                                        <h2 class="text-gray-500">Precio regular</h2>
				                                        <p>$ ${oferta.getPrecioRegular()}</p>
				                                    </div>
				                                    <div class="w-1/2">
				                                        <h2 class="text-gray-500">Precio ofertado</h2>
				                                        <p>$ ${oferta.getPrecioOfertado() }</p>
				                                    </div>
				                                </div>
				                            </div>
										<div class="flex justify-between items-center">
											<p class="text-gray-400">
												Oferta por ${oferta.getNombreEmpresa() }
											</p>
										
											<button id='cart_${oferta.getIdOferta()}' class="px-2 py-3 text-xs font-bold text-white uppercase transition-colors duration-300 transform bg-gray-800 rounded dark:bg-gray-700 hover:bg-gray-700 dark:hover:bg-gray-600 focus:outline-none focus:bg-gray-700 dark:focus:bg-gray-600">Añadir al carrito</button>
											
										</div>

			                        </div>
			                        </div>
			                    </div>
			                </section>
					

		
	
						</c:forEach>
				
				
				
				
				</div>
				
		
	
	</div>
	
	
	</section>

	
	
	<!-- 	
						<div class="w-full mx-auto max-w-sm bg-white rounded-lg shadow-md dark:bg-gray-800 dark:border-gray-700">
						    <a href="#">
						        <img class="p-8 rounded-t-lg" src="https://static.vecteezy.com/system/resources/previews/002/620/855/non_2x/big-sale-offer-discount-coupon-market-over-white-background-free-vector.jpg" alt="product image">
						    </a>
						    <div class="px-5 pb-5">
						        <a href="#">
						            <h5 class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white">${oferta.getNombreOferta() }</h5>
						        </a>
						        <div class="flex items-center mt-2.5 mb-5">
						            ${oferta.getDescripcion()}
						        </div>
						        <div class="flex justify-between items-center">
						            <span class="text-sm font-bold text-gray-900 dark:text-white">Precio Regular:$ ${oferta.getPrecioRegular()} <br> Oferta:$ ${oferta.getPrecioOfertado() }</span>
						            <a href="#"  class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Añadir al carrito</a>
						        </div>
						    </div>
					</div>-->




<!-- 



 -->
 
 
 <script src="Resources/scripts/carrito.js"></script>
</body>
</html>