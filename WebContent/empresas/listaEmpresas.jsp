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
    <title>Lista de empresas</title>
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
    <div style="margin-left: 5vw; margin-right: 18vw; ">
        <div class="row">
            <h1 class="text-left" style="font-size: 35px"><b>Lista de empresas</b></h1>
            <br>
             <a type="button" class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800"
             	href="${pageContext.request.contextPath}/empresas.do?op=nuevo">Nueva Empresa</a>   
		    <br>
            <br>       
        </div>

        <form method="GET">
            <div class="grid md:grid-cols-2 md:gap-6">
                <div class="flex">
                    <span
                        class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">Nombre:</span>
                    <input type="text"
                        class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
        		  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        Placeholder="Escribe aquí..." name="nombre">
                </div>
                <div class="flex">
                    <span
                        class="inline-flex items-center px-3 text-sm text-gray-900 bg-gray-200 rounded-l-md border border-r-0 border-gray-300 dark:bg-gray-600 dark:text-gray-400 dark:border-gray-600">Rubros:</span>
                    <select
                        class="rounded-none rounded-r-lg bg-gray-50 border border-gray-300 text-gray-900 focus:ring-blue-500 focus:border-
        		  blue-500 block flex-1 min-w-0 w-full text-sm border-gray-300 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        name="rubro">
                        <option>Seleccionar</option>
                        <c:forEach var="rubrosBean" items="${requestScope.listaRubros}">
                            <option>${rubrosBean.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <br>

            <div class="flex">
                <input type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 
        		mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" value="Buscar"
                    style="cursor: pointer">
                <a class="text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg 
        		text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-700 dark:border-gray-700"
                    href="${pageContext.request.contextPath}/empresas.do?op=listar">Restablecer</a>
            </div>
        </form>
        <br>

        <div >
            <div class="overflow-x-auto relative">            
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
                        <tr style="background-color: #ffd88e">
                            <th scope="col" class="py-3 px-6 rounded-l-lg">Codigo</th>
                            <th scope="col" class="py-3 px-6">Nombre de la empresa</th>
                            <th scope="col" class="py-3 px-6">Ubicacion</th>
                            <th scope="col" class="py-3 px-6">Nombre de Contacto</th>
                            <th scope="col" class="py-3 px-6">Telefono</th>
                            <th scope="col" class="py-3 px-6">Correo</th>
                            <th scope="col" class="py-3 px-6">Porcentaje de ganancias</th>
                            <th scope="col" class="py-3 px-6">Rubro de la empresa</th>
                            <th scope="col" class="py-3 px-6 rounded-r-lg" colspan="2">Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${requestScope.listaEmpresas}" var="empresas">
                        <c:if test="${empresas.getNombreEmpresa()==param.nombre}">
                            <tr class="bg-white dark:bg-gray-800">
                                <td class="py-4 px-6">${empresas.getIdEmpresa()}</td>
                                <td class="py-4 px-6">${empresas.getNombreEmpresa()}</td>
                                <td class="py-4 px-6">${empresas.getUbicacion()}</td>
                                <td class="py-4 px-6">${empresas.getContacto()}</td>
                                <td class="py-4 px-6">${empresas.getTelefono()}</td>
                                <td class="py-4 px-6">${empresas.getCorreo()}</td>
                                <td class="py-4 px-6">${empresas.getPorcentajeGanancias()}</td>
                                <td class="py-4 px-6">${empresas.rubrosBean.nombre}</td>
                                <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/empresas.do?op=obtener&id=${empresas.getIdEmpresa()}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i>Editar</a></td>
                                <td class="py-4 px-6"><a href="javascript:eliminar('${empresas.getIdEmpresa()}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i>Eliminar</a></td>
                            </tr>
                                                    </c:if>
                        </c:forEach>
                        
                        <c:forEach items="${requestScope.listaEmpresas}" var="empresas">
                        <c:if test="${param.op=='listar'}">                        
                            <tr class="bg-white dark:bg-gray-800">
                                <td class="py-4 px-6">${empresas.getIdEmpresa()}</td>
                                <td class="py-4 px-6">${empresas.getNombreEmpresa()}</td>
                                <td class="py-4 px-6">${empresas.getUbicacion()}</td>
                                <td class="py-4 px-6">${empresas.getContacto()}</td>
                                <td class="py-4 px-6">${empresas.getTelefono()}</td>
                                <td class="py-4 px-6">${empresas.getCorreo()}</td>
                                <td class="py-4 px-6">${empresas.getPorcentajeGanancias()}</td>
                                <td class="py-4 px-6">${empresas.rubrosBean.nombre}</td>
                                <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/empresas.do?op=obtener&id=${empresas.getIdEmpresa()}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i>Editar</a></td>
                                <td class="py-4 px-6"><a href="javascript:eliminar('${empresas.getIdEmpresa()}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i>Eliminar</a></td>
                            </tr>
						</c:if>                            
                        </c:forEach>      
                        
                        <c:forEach items="${requestScope.listaEmpresas}" var="empresas">
                        <c:if test="${empresas.rubrosBean.nombre==param.rubro}">                        
                            <tr class="bg-white dark:bg-gray-800">
                                <td class="py-4 px-6">${empresas.getIdEmpresa()}</td>
                                <td class="py-4 px-6">${empresas.getNombreEmpresa()}</td>
                                <td class="py-4 px-6">${empresas.getUbicacion()}</td>
                                <td class="py-4 px-6">${empresas.getContacto()}</td>
                                <td class="py-4 px-6">${empresas.getTelefono()}</td>
                                <td class="py-4 px-6">${empresas.getCorreo()}</td>
                                <td class="py-4 px-6">${empresas.getPorcentajeGanancias()}</td>
                                <td class="py-4 px-6">${empresas.rubrosBean.nombre}</td>
                                <td class="py-4 px-6"><a href="${pageContext.request.contextPath}/empresas.do?op=obtener&id=${empresas.getIdEmpresa()}"><i class="fas fa-edit"  style="color: blue; cursor: pointer;"></i>Editar</a></td>
                                <td class="py-4 px-6"><a href="javascript:eliminar('${empresas.getIdEmpresa()}')"><i class="fas fa-trash-alt" style="color: red; cursor: pointer;"></i>Eliminar</a></td>
                            </tr>
						</c:if>                            
                        </c:forEach>                                           
                    </tbody>
                </table>
            </div>

        </div>
    </div>
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
      		  title: 'Are you sure?',
      		  text: "You won't be able to revert this!",
      		  icon: 'warning',
      		  showCancelButton: true,
      		  confirmButtonColor: '#3085d6',
      		  cancelButtonColor: '#d33',
      		  confirmButtonText: 'Yes, delete it!'
      		}).then((result) => {
      		  if (result.isConfirmed) {
        		    location.href = "empresas.do?op=eliminar&id=" + id;
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