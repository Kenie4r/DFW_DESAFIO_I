
 	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<c:set var="initRol" scope="session" value="${pageContext.session.getAttribute('idRol') }" />
<c:if test="${empty initRol}">
		<c:redirect url="${pageContext.request.contextPath}/.."></c:redirect>
</c:if>
	<meta charset="ISO-8859-1">
	<title>Mis metodos de pago</title>
	<link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.2/dist/flowbite.min.css" />
    <script src="https://unpkg.com/flowbite@1.5.2/dist/flowbite.js"></script>
	<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
</head>
<body >
	<jsp:include page="/menu.jsp"></jsp:include>
	
	<section class='flex flex-row gap-4 h-full overflow-hidden'>
		<div class="flex flex-col gap-4 w-full h-screen overflow-hidden" id='ofertas'>
		 <header class="px-5 py-4 border-b border-gray-100 flex flex-row justify-between items-center">
             <h2 class="font-semibold text-gray-800">Metodos de pagos ingresados</h2>
             
             <a href="${pageContext.request.contextPath }/MetodosPago?op=nuevo"type="button" class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">
            	 Añadir nuevo metodo de pago
             </a>
             
             
         </header>
				<!-- component -->
	<section class="antialiased bg-gray-100 text-gray-600 h-screen p-4">
    	<div class="flex flex-col justify-center">
        	<!-- Table -->
        	<div class="w-full max-w-6xl mx-auto bg-white shadow-lg rounded-sm border border-gray-200">
           
            	<div class="p-3">
                	<div class="overflow-x-auto">
                    	<table class="table-auto w-full">
                        	<thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                            	<tr>
                                	<th class="p-2 whitespace-nowrap">
                                    	<div class="font-semibold text-left">Nombre del método</div>
                                	</th>
                                	<th class="p-2 whitespace-nowrap">
                                    	<div class="font-semibold text-left">Fecha de vencimiento</div>
                                	</th>
                               		<th class="p-2 whitespace-nowrap">
                                    	<div class="font-semibold text-left">Codigo de tarjeta</div>
                                	</th>
                               		<th class="p-2 whitespace-nowrap">
                                    	<div class="font-semibold text-left">Estado</div>
                                	</th>
                                	<th class="p-2 whitespace-nowrap">
                                    	<div class="font-semibold text-center">Actividades</div>
                                	</th>
                            	</tr>
                        </thead>
                        <tbody class="text-sm divide-y divide-gray-100">
                        	<c:if test="${empty pagos}">
								<div id="alert-additional-content-2" class="p-4 mb-4 border border-red-300 rounded-lg bg-red-50 dark:bg-red-200" role="alert">
								  <div class="flex items-center">
								    <svg aria-hidden="true" class="w-5 h-5 mr-2 text-red-900 dark:text-red-800" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
								    <span class="sr-only">Información</span>
								    <h3 class="text-lg font-medium text-red-900 dark:text-red-800">No existen metodos de pagos</h3>
								  </div>
								  <div class="mt-2 mb-4 text-sm text-red-900 dark:text-red-800">
										Aún no se han ingresado metodos de pagos. Recuerda aprovechar todos los cupones y ofertas que se encuentran en La Cuponera
								  </div>
								  <div class="flex">
								    
								  </div>
								</div>
							</c:if>
                        	<c:forEach items="${requestScope.pagos }" var="pago">
                        	<tr>
                                <td class="p-2 whitespace-nowrap">
                                    <div class="flex items-center">
                                        <div class="font-medium text-gray-800 text-center">${pago.getMetodo()}</div>
                                    </div>
                                </td>
                                <td class="p-2 whitespace-nowrap">
                                    <div class="text-left">${pago.getVencimiento()}</div>
                                </td>
                              	<td class="p-2 whitespace-nowrap">
                                    <div class="text-left">${pago.getCodigo()}</div>
                                </td>
                              	<td>
                              	      <div class="text-left">${pago.getEstado()}</div>
                              	</td>
                                <td class="p-2 whitespace-nowrap">
                                    <div class="text-lg text-center">
                                    
                                    <button onclick="javascript:eliminar(${pago.getIdPagos()})" type="button" class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900">Eliminar</button>
                                    
                                    
                                    </div>
                                </td>
                            </tr>
                        	</c:forEach>
                            
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
</section>


    <script>
        $(document).ready(function () {
            $('#tabla').DataTable();
        });
		const Toast = Swal.mixin({
			  toast: true,
			  position: 'top-end',
			  showConfirmButton: false,
			  timer: 3000,
			  timerProgressBar: true,
			  didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			  }
			})
			<c:if test="${not empty exito}">

			Toast.fire({
			  icon: 'success',
			  title: '${exito}'
			})
			<c:set var="exito" value="" scope="session" />
			</c:if>
			<c:if test="${not empty fracaso}">

			Toast.fire({
			  icon: 'error',
			  title: '${fracaso}'
			})
			<c:set var="fracaso" value="" scope="session" />
			</c:if>
        function eliminar(id) {
        	Swal.fire({
      		  title: 'Eliminar metodo de pago',
      		  text: "¿Quieres eliminar el metodo de pago?",
      		  icon: 'warning',
      		  showCancelButton: true,
      		  confirmButtonColor: '#3085d6',
      		  cancelButtonColor: '#d33',
      		  confirmButtonText: 'Eliminar',
      		  cancelButtonText: 'Cancelar'
      		}).then((result) => {
      		  if (result.isConfirmed) {
        		    location.href = "MetodosPago?op=eliminar&id=" + id;
      		    Swal.fire(
      		      'Deleted!',
      		      'Your file has been deleted.',
      		      'success'

      		    )
      		  }
      		})
        	sweetalert.confirm("¿Realmente decea eliminar este Genero?", function (e) {
                if (e) {
                    location.href = "empresas.do?op=eliminar&id=" + id;
                }
            });
        }
    </script>
</body>
</html>