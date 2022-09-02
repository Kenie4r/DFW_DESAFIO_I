<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 9/8/2022
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:set var="initRol" scope="session" value="${pageContext.session.getAttribute('username') }" />
<c:if test="${empty initRol}">
		<c:redirect url="${pageContext.request.contextPath}/.."></c:redirect>
</c:if>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mi carrito de compras</title>
   <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
    <script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
  <style>
    #summary {
      background-color: #f6f6f6;
    }
  </style>
</head>

<body class="bg-gray-100">
	<jsp:include page="/menu.jsp"/>

  <div class="container mx-auto mt-10">
    <div class="flex shadow-md my-10">
      <div class="w-3/4 bg-white px-10 py-10">
        <div class="flex justify-between border-b pb-8">
          <h1 class="font-semibold text-2xl">Ofertas seleccionadas</h1>
          <h2 class="font-semibold text-2xl"><span id='cantidad_total'></span> Ofertas</h2>
        </div>
        <div class="flex mt-10 mb-5">
          <h3 class="font-semibold text-gray-600 text-xs uppercase w-2/5">Nombre de Oferta</h3>
          <h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Cantidad</h3>
          <h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Precio</h3>
          <h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Total</h3>
        </div>
        <div id='cart-div'>
        <c:choose>
	        <c:when test="${not empty componentes}">
	        		<c:forEach items="${componentes}" var='oferta'>
	        					<div class="flex items-center hover:bg-gray-100 -mx-8 px-6 py-5" id='product_${oferta.getIdOferta()}'> 
						          <div class="flex w-2/5"> <!-- product -->
						            <div class="flex flex-col justify-between ml-4 flex-grow"> 
						              <span class="font-bold text-sm">${oferta.getNombreOferta()}</span> 
						              <span class="text-red-500 text-xs">${oferta.getDescripcion()}</span> 
						              <!-- <a href="#" id='eliminar_${oferta.getIdOferta()}'class="font-semibold hover:text-red-500 text-gray-500 text-xs">Eliminar</a>--> 
						            </div> 
						          </div> 
						          <div class="flex justify-center w-1/5"> 
						            <img src='https://www.svgrepo.com/show/25409/minus-sign-of-a-line-in-horizontal-position.svg ' id='minus_${oferta.getIdOferta()}' class=" object-contain	 cursor-pointer	 fill-current text-gray-600 w-4 mx-3"/> 
									<input type='hidden' id='id_${oferta.getIdOferta()}' value='${oferta.getIdOferta()}' class='ofertasId'/> 
									<input type='hidden'  id='precio_${oferta.getIdOferta()}' value='${oferta.getPrecioOfertado()}'/> 
									<input type='hidden' id='total_${oferta.getIdOferta()}' value='${oferta.getPrecioOfertado()}' class='totales'>
						            <input id='cantidad_${oferta.getIdOferta()}'class="mx-2 border text-center w-10 cantidades" type="text" value="1" readonly>  
						            <img src='https://www.freeiconspng.com/thumbs/plus-icon/plus-icon-black-2.png'  id='plus_${oferta.getIdOferta()}'  class=" object-contain	cursor-pointer	fill-current text-gray-600 w-4 mx-3"/>  
						          </div> 
						          <span class="text-center w-1/5 font-semibold text-sm">${oferta.getPrecioOfertado()}</span> 
						          <span class="text-center w-1/5 font-semibold text-sm" id='totalSpan_${oferta.getIdOferta()}'>${oferta.getPrecioOfertado()}</span> 
						       </div> 
	        	
	        	</c:forEach>
	        
	        
	        </c:when>
	        <c:otherwise>
	        	<h1>No se ha encontrado ninguna oferta seleccionada actualmente</h1>
	        </c:otherwise>
        </c:choose>
        
        
        </div>

        

        <a href="${pageContext.request.contextPath}/ofertas" class="flex font-semibold text-indigo-600 text-sm mt-10">
      
          <svg class="fill-current mr-2 text-indigo-600 w-4" viewBox="0 0 448 512"><path d="M134.059 296H436c6.627 0 12-5.373 12-12v-56c0-6.627-5.373-12-12-12H134.059v-46.059c0-21.382-25.851-32.09-40.971-16.971L7.029 239.029c-9.373 9.373-9.373 24.569 0 33.941l86.059 86.059c15.119 15.119 40.971 4.411 40.971-16.971V296z"/></svg>
          Continuar comprando
        </a>
      </div>

      <div id="summary" class="w-1/4 px-8 py-10">
        <h1 class="font-semibold text-2xl border-b pb-8">Resumen de compra</h1>
        <div class="flex justify-between mt-10 mb-5">
          <span class="font-semibold text-sm uppercase"><span id='of-c'>0</span> Ofertas</span>
          <span class="font-semibold text-sm" id='stotal-2'>$0.0</span>
        </div>
        <div>
          <label class="font-medium inline-block mb-3 text-sm uppercase">Metodo de Pago</label>
          <select class="block p-2 text-gray-600 w-full text-sm">
          	<c:choose>
          		<c:when test="${empty tarjetas }">
          		            <option value="null">No existen Tarjetas seleccionadas</option>
          		</c:when>
          		<c:otherwise>
          			<option value="null"> Seleccionar metodo de pago</option>
          			<c:forEach items="${requestScope.tarjetas}" var="tarjeta">
          				<option value="${tarjeta.getIdPagos() }">
          					${tarjeta.getMetodo()}
          					
          				</option>
          			</c:forEach>
          		</c:otherwise>
          	</c:choose>
          </select>
           <a href="${pageContext.request.contextPath}/MetodosPago" class="flex font-semibold text-indigo-600 text-sm mt-10">
      
          <svg class="fill-current mr-2 text-indigo-600 w-4" viewBox="0 0 448 512"><path d="M134.059 296H436c6.627 0 12-5.373 12-12v-56c0-6.627-5.373-12-12-12H134.059v-46.059c0-21.382-25.851-32.09-40.971-16.971L7.029 239.029c-9.373 9.373-9.373 24.569 0 33.941l86.059 86.059c15.119 15.119 40.971 4.411 40.971-16.971V296z"/></svg>
          Nuevo metodo de pago
        </a>
        </div>
    
        <div class="border-t mt-8">
          <div class="flex font-semibold justify-between py-6 text-sm uppercase">
            <span>Precio total</span>
            <span id='stotal'>$0</span>
          </div>
          <button class="bg-indigo-500 font-semibold hover:bg-indigo-600 py-3 text-sm text-white uppercase w-full" id='pay'>Finalizar compra</button>
        </div>
      </div>

    </div>
  </div>
   <script src="Resources/scripts/cargar_ofertas.js"></script>
  
</body>
