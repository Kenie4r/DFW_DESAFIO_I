<%@page import="www.sv.cuponera.view.CreateMenu"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
if(session.getAttribute("idUsuario")!=null){
	String[] datos = {
			session.getAttribute("username").toString(), 
			session.getAttribute("email").toString(), 
			request.getContextPath()}; 
	out.print(CreateMenu.Menu(-1,Integer.parseInt(session.getAttribute("idRol").toString())  ,datos));   
	
}else{ 
	out.print("hola adios"); 
	response.sendRedirect( request.getContextPath()+ "/index.jsp"); 
}
 
 


%>
