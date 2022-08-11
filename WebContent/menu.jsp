  Created by IntelliJ IDEA.
  User: Fernando
  Date: 10/8/2022
  Time: 08:52
  To change this template use File | Settings | File Templates.
--%>
<%@page import="www.sv.cuponera.view.CreateMenu"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	
  int rol=(Integer) session.getAttribute("idRol");
  int idUsuario=(Integer) session.getAttribute("idUsuario");
  int idEmpresa=(Integer) session.getAttribute("idEmpresa");
  if (idUsuario != 0  ) {
    CreateMenu.Menudash(rol);
  }else{
    response.sendRedirect("login.jsp");
  }

%>
