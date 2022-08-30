<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <title>Lista de autores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">      
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <meta charset="ISO-8859-1">
</head>

<body>

    <div class="container">
        <div class="row">
            <h3>Lista de empresas</h3>
        </div>
        <div class="row">
            <div class="col-md-10">
                <a type="button" class="btn btn-primary btn-md" href="${pageContext.request.contextPath}/empresas.do?op=nuevo">Nueva Empresa</a>
                <br /><br />
                <table class="table table-striped table-bordered table-hover" id="tabla">
                    <thead>
                        <tr>
                        	<th>Codigo de la empresa</th>
                            <th>Nombre de la empresa</th>
                            <th>Ubicacion</th>
                            <th>Nombre de Contacto</th>
                            <th>Telefono</th>
                            <th>Correo</th>
                            <th>Porcentaje de ganancias</th>
                            <!-- <th>Rubro de la empresa</th> -->                            
                            <th>Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${requestScope.listaEmpresas}" var="empresas">
                            <tr>
                                <td>${empresas.getIdEmpresa()}</td>
                                <td>${empresas.getNombreEmpresa()}</td>
                                <td>${empresas.getUbicacion()}</td>
                                <td>${empresas.getContacto()}</td>
                                <td>${empresas.getTelefono()}</td>
                                <td>${empresas.getCorreo()}</td>
                                <td>${empresas.getPorcentajeGanancias()}</td>
                               <!-- <td>${empresas.rubrosBean}</td> -->
                                <td>
                                    <a class="btn btn-primary"
                                        href="${pageContext.request.contextPath}/empresas.do?op=obtener&id=${empresas.getIdEmpresa()}"><span
                                            class="glyphicon glyphicon-edit"></span> Editar</a>
                                    <a class="btn btn-danger" href="javascript:eliminar('${empresas.getIdEmpresa()}')"><span
                                            class="glyphicon glyphicontrash"></span> Eliminar</a>
                                </td>
                            </tr>
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
			<c:if test="${not empty exito}">
			alertify.success('${exito}');
			<c:set var="exito" value="" scope="session" />
			</c:if>
			<c:if test="${not empty fracaso}">
			alertify.error('${fracaso}');	 
			<c:set var="fracaso" value="" scope="session" />
			</c:if>
        function eliminar(id) {
            alertify.confirm("¿Realmente decea eliminar este Genero?", function (e) {
                if (e) {
                    location.href = "generos.do?op=eliminar&id=" + id;
                }
            });
        }
    </script>

</body>

</html>