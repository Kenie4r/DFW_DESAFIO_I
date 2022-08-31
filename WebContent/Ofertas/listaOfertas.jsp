<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
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
	
	
		<div class="flex flex-col gap-4 w-full h-screen overflow-hidden" id='ofertas'>
				<h1 class="font-medium leading-tight text-xl mt-0 mb-2 mx-10 ">Listado de ofertas activas</h1>	
				<div class=' overflow-y-scroll h-full '>
					<c:forEach  items="${requestScope.Listaofertas}" var="oferta">
					<div class="flex w-8/12  my-4 mx-auto overflow-hidden bg-white rounded-lg shadow-lg dark:bg-gray-800" style='height: 200px; '>
    					<div class="w-1/3 bg-cover" style="background-image: url('https://static.vecteezy.com/system/resources/previews/002/620/855/non_2x/big-sale-offer-discount-coupon-market-over-white-background-free-vector.jpg')"></div>

						    <div class="w-2/3 p-4 md:p-4">
						        <h1 class="text-xl font-bold text-gray-800 dark:text-white">${oferta.getNombreOferta() }</h1>
						
						        <p class="mt-2 text-sm text-gray-600 dark:text-gray-400"> ${oferta.getDescripcion()}</p>
						
						        <div class="flex justify-between mt-3 item-center">
						     		<span class="text-sm font-bold text-gray-900 dark:text-white">Precio Regular:$ ${oferta.getPrecioRegular()} <br > Oferta:$ ${oferta.getPrecioOfertado() }</span>
						            <button id='cart_${oferta.getIdOferta()}' class="px-2 py-1 text-xs font-bold text-white uppercase transition-colors duration-300 transform bg-gray-800 rounded dark:bg-gray-700 hover:bg-gray-700 dark:hover:bg-gray-600 focus:outline-none focus:bg-gray-700 dark:focus:bg-gray-600">Add to Cart</button>
						        </div>
   							 </div>
						</div>
	
		
	
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