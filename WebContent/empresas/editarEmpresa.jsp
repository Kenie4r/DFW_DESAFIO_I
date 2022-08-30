<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Editar Empresa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">      
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>    
</head>
<body>
	    <div class="container">
        <div class="row">
            <h2>Editar Empresa</h2>
        </div>
        <div class="row">
            <div class="col-md-10">
				<c:if test="${not empty listaErrores}">
                    <div class="alert alert-danger">
                        <ul>
                            <c:forEach var="errores" items="${requestScope.listaErrores}">
                                <li>${errores}</li>
                            </c:forEach>
                        </ul>
                        
                    </div>
                </c:if>   
                <form role="form" action="${pageContext.request.contextPath}/empresas.do" method="POST">
                    				<input type="hidden" name="op" value="editar">
                    				<div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Campos requeridos</strong></div>
                   					<div class="form-group">
				                        <label for="codigo">Codigo de empresa</label>
				                        <div class="input-group">
                           					<input type="text" class="form-control" name="codigo" id="codigo" value="${empresas.IdEmpresa}" placeholder="Ingresa el codigo de la Empresa">
                           					<span class="input-group-addon"><span class="glyphiconglyphicon-asterisk"></span></span>
                       					</div>
                   					</div>
                   					<div class="form-group">
                       					<label for="nombre">Nombre de empresa</label>
                       					<div class="input-group">
                           					<input type="text" class="form-control" name="nombre" id="nombre" value="${empresas.NombreEmpresa}" placeholder="Ingresa el nombre de la Empresa">
                           					<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                       					</div>
                  					</div>
                   					<div class="form-group">
                       					<label for="contacto">Ubicacion de empresa:</label>
                       					<div class="input-group">
                          					 <input type="text" class="form-control" name="ubicacion" id="ubicacion" value="${empresas.Ubicacion}"  placeholder="Ingresa la ubicacion de la Empresa">
                          					 <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                      					</div>
                   					</div>
                   					<div class="form-group">
                       					<label for="nombre">Nombre de contacto</label>
                       					<div class="input-group">
                           					<input type="text" class="form-control" name="contacto" id="contacto" value="${empresas.Contacto}" placeholder="Ingresa el nombre de contacto de la Empresa">
                           					<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                       					</div>
                  					</div>                   					
									<div class="form-group">
	                       				<label for="telefono">Telefono de la empresa:</label>
	                       				<div class="input-group">
	                          				 <input type="text" class="form-control" name="telefono" id="telefono" value="${empresas.Telefono}" placeholder="Ingresa el telefono de la Empresa">
	                          				 <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
	                      				</div>	                   				
	                   				</div>
                   					<div class="form-group">
                       					<label for="nombre">Correo de empresa</label>
                       					<div class="input-group">
                           					<input type="text" class="form-control" name="correo" id="correo" value="${empresas.Correo}" placeholder="Ingresa el correo de la Empresa">
                           					<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                       					</div>
                  					</div>	     
				                    <div class="form-group">
				                        <label for="precio">Porcentaje de ganancias:</label>
				                        <div class="input-group">
				                            <input type="number" step="0.1" min="0" class="form-control" name="ganancias" id="ganancias" value="${empresas.PorcentajeGanancias}" placeholder="Ingresa el porcentaje de Ganancias de la Empresa">
				                            <span class="input-group-addon"><span class="glyphicon glyphiconasterisk"></span></span>
				                        </div>
				                    </div>                  					              				
                   					<input type="submit" class="btn btn-info" value="Guardar" name="Guardar">
                   					<a class="btn btn-danger" href="${pageContext.request.contextPath}/empresas.do?op=listar">Cancelar</a>
                </form>                                        
            </div>
        </div>
    </div>
</body>
</html>