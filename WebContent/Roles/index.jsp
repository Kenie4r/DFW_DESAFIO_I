<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 10/8/2022
  Time: 09:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Roles</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">

</head>
<body>

<div class="overflow-x-auto relative">
    <a class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded" href="Roles/crearRol.jsp">Añadir</a>

    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="py-3 px-6">
                Id Rol
            </th>
            <th scope="col" class="py-3 px-6">
                Nombre del Rol
            </th>
        </tr>
        </thead>
        <tbody>

            <c:forEach items="${requestScope.listaRol}" var="rol">
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                    <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            ${rol.idRol}
                    </th>
                    <td class="py-4 px-6">
                            ${rol.name}
                    </td>
                    <td class="py-4 px-6">
                        <a class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded" href="${pageContext.request.contextPath}/RolController?op=obtener&id=${rol.idRol}">Editar</a>
                    </td>
                    <td class="py-4 px-6">
                        <a class="bg-transparent hover:bg-red-500 text-red-700 font-semibold hover:text-white py-2 px-4 border border-red-500 hover:border-transparent rounded" href="${pageContext.request.contextPath}/RolController?op=eliminar&id=${rol.idRol}">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>


        </tbody>
    </table>

</div>

</body>
</html>
