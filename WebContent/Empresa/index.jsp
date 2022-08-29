<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Empresa</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
</head>
<body>
<body>

<div class="overflow-x-auto relative">
    <a class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded" href="${pageContext.request.contextPath}/EmpresaController?op=insertar">Añadir</a>

    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="py-3 px-6">
                Id Empresa
            </th>
            <th scope="col" class="py-3 px-6">
                Nombre de la empresa
            </th>
            <th scope="col" class="py-3 px-6">
               	Ubicación de la empresa
            </th>
             <th scope="col" class="py-3 px-6">
               	Porcentaje de ganancias
            </th>
             <th scope="col" class="py-3 px-6">
               	Rubro de empresa
            </th>
        </tr>
        </thead>
        <tbody>

            <c:forEach items="${requestScope.listaEmpresa}" var="empresa">
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                    <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            ${empresa.idEmpresa}
                    </th>
                    <td class="py-4 px-6">
                            ${empresa.nombreEmpresa}
                    </td>
                        <td class="py-4 px-6">
                            ${empresa.ubicacion}
                    </td>
                           <td class="py-4 px-6">
                            ${empresa.porcentajeGanancias}%
                    </td>
                       <td class="py-4 px-6">
                            ${empresa.idRubros}
                    </td>
                    <td class="py-4 px-6">
                        <a class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded" href="${pageContext.request.contextPath}/EmpresaController?op=obtener&id=${empresa.idEmpresa}">Editar</a>
                       
                    </td>
                    <td class="py-4 px-6">
                        <a class="bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-4 border border-red-500 hover:border-transparent rounded" href="${pageContext.request.contextPath}/EmpresaController?op=eliminar&id=${empresa.idEmpresa}">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>


        </tbody>
    </table>
		

   
</div>

</body>
</html>