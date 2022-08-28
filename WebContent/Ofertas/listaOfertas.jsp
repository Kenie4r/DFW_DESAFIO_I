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
<body>
<!-- >
 <c:set var = "rol" scope = "session" value = "${session.getAttribute('idRol')}"/>

	<c:if  test="rol is null">
		<c:redirect url="http://localhost:8080/LaCuponera/"></c:redirect>
	</c:if>-->
	<jsp:include page="/menu.jsp"></jsp:include>
	<div class="grid-cols-3 grid gap-4" id='ofertas'>
			<c:forEach  items="${requestScope.Listaofertas}" var="oferta">
	


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
					            <a href="#" id='cart_${oferta.getIdOferta()}' class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Añadir al carrito</a>
					        </div>
					    </div>
				</div>
	

		</c:forEach>
	
	
	</div>




<!-- 



 -->
 
 
 <script src="Resources/scripts/carrito.js"></script>
</body>
</html>