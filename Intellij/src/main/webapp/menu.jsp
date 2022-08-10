<%@ page import="View.CreateMenu" %><%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 10/8/2022
  Time: 08:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

  Integer rol=(Integer) session.getAttribute("idRol");
  Integer idUsuario=(Integer) session.getAttribute("idUsuario");
  Integer idEmpresa=(Integer) session.getAttribute("idEmpresa");
  if (idUsuario != null ) {
    CreateMenu.Menudash(rol);
  }else{
    response.sendRedirect("login.jsp");
  }

%>
