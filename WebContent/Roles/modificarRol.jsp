<%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 10/8/2022
  Time: 09:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">

    <title>Modificar Rol</title>
</head>
<body>
<div class="bg-white p-10 rounded-lg shadow md:w-3/4 mx-auto lg:w-1/2">
    <form action="${pageContext.request.contextPath}/RolController">
        <div class="mb-5">
            <label for="name" class="block mb-2 font-bold text-gray-600">Nombre del rol</label>
            <input required type="text" id="name" name="name" value="${requestScope.name}" placeholder="Nombre del rol." class="border border-gray-300 shadow p-3 w-full rounded mb-">
            <input required type="text" id="id" name="id" value="${requestScope.id}"  hidden placeholder="Nombre del rol." class="border border-gray-300 shadow p-3 w-full rounded mb-">
        </div>

        <button name="op" value="modificar" class="block w-full bg-blue-500 text-white font-bold p-4 rounded-lg">Modificar</button>
        <p>${requestScope.fracaso}</p>
    </form>
</div>
</body>
</html>
