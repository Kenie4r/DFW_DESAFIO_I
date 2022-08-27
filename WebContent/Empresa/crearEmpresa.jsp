<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ingresar empresa</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
</head>
<body>
<div class="bg-white p-10 rounded-lg shadow md:w-3/4 mx-auto lg:w-1/2">
    <form action="${pageContext.request.contextPath}/EmpresaController">
        <div class="mb-5">
            <label for="name" class="block mb-2 font-bold text-gray-600">Nombre del Empresa</label>
            <input required type="text" id="name" name="name" placeholder="Nombre del rol." class="border border-gray-300 shadow p-3 w-full rounded mb-">
        </div>
          <div class="mb-5">
            <label for="name" class="block mb-2 font-bold text-gray-600">Ubicacion del Empresa</label>
            <input required type="text" id="ubicacion" name="ubicacion" placeholder="Ubicacion del Empresa" class="border border-gray-300 shadow p-3 w-full rounded mb-">
        </div>
            <div class="mb-5">
            <label for="name" class="block mb-2 font-bold text-gray-600">Porcentaje de ganancia</label>
            <input required type="number" id="Porcentaje" name="Porcentaje" placeholder="Porcentaje" class="border border-gray-300 shadow p-3 w-full rounded mb-">
        </div>
         </div>
            <div class="mb-5">
            <label for="name" class="block mb-2 font-bold text-gray-600">Rubro</label>
           		<select name="rubro">
           		<c:forEach items="${requestScope.listaRubro}" var="rubro">
           			<option value="${rubro.id}">${rubro.nombre}</option>
           		</c:forEach>
           		</select>
        </div>

        <button name="op" value="guardar" class="block w-full bg-blue-500 text-white font-bold p-4 rounded-lg">Crear</button>
        <p>${requestScope.fracaso}</p>
    </form>
</div>

</body>
</html>