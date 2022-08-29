package www.sv.cuponera.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import www.sv.cuponera.beans.*;
import www.sv.cuponera.modelo.*;

@WebServlet(name = "RubrosController", urlPatterns = {"/rubros.do"})

public class RubrosController extends HttpServlet {
	
 ArrayList<String> listaErrores = new ArrayList<>();
 ArrayList<String> listaOK = new ArrayList<>();
 RubrosModel modelo = new RubrosModel();

 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 response.setContentType("text/html;charset=UTF-8");
 try (PrintWriter out = response.getWriter()) {
 if(request.getParameter("op")==null){
 listar(request, response);
 return;
 }
 String operacion = request.getParameter("op");

 switch (operacion) {
 case "listar":
 listar(request, response);
 break;
 
 case "nuevo":
 nuevo(request, response);
 break;
 
 case "insertar":
 insertar(request, response);
 break;
 
 case "obtener":
 obtener(request, response);
 break;
 
 case "modificar":
 modificar(request, response);
 break;
 
 case "eliminar":
 eliminar(request, response);
 break;
 
 }
 }
 }

 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 processRequest(request, response);
 }
 
 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 processRequest(request, response);
 }
 
 @Override
 public String getServletInfo() {
 return "Short description";
 }
 
 private void nuevo(HttpServletRequest request, HttpServletResponse response) {
 try {
 request.getRequestDispatcher("/Rubros/crearRubro.jsp").forward(request, response);
 } catch (ServletException | IOException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void listar(HttpServletRequest request, HttpServletResponse response) {
 try {
request.setAttribute("listaRubros", modelo.listarRubros());
request.getRequestDispatcher("/Rubros/index.jsp").forward(request, response);
 } catch (SQLException | ServletException | IOException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void insertar(HttpServletRequest request, HttpServletResponse response) {
 try {
 listaErrores.clear();
 RubrosBean rubro = new RubrosBean();
 rubro.setNombre(request.getParameter("nombre"));
 rubro.setDescripcion(request.getParameter("descripcion"));
 
 if (rubro.getNombre().isEmpty()) {
 listaErrores.add("El nombre es obligatorio");
 }
 if (rubro.getDescripcion().isEmpty()) {
 rubro.setDescripcion("Sin registros");
 }
 
 if (listaErrores.size() > 0) {
 request.setAttribute("listaErrores", listaErrores);
 request.getRequestDispatcher("rubros.do?op=nuevo").forward(request, response);
 } else {
 if (modelo.insertarRubro(rubro) > 0) {
 listaOK.clear();
 listaOK.add("El elemento ha sido ingresado con éxito.");
 request.setAttribute("listaOK", listaOK);
 request.getRequestDispatcher("rubros.do?op=nuevo").forward(request, response);
 } else {
 listaErrores.clear();
 listaErrores.add("Ocurrio un error. Intente de nuevo");
 request.setAttribute("listaErrores", listaErrores);
 request.getRequestDispatcher("rubros.do?op=nuevo").forward(request, response);
 }
 }
 } catch (IOException | SQLException | ServletException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }

 private void obtener(HttpServletRequest request, HttpServletResponse response) {
 try {
 int id = Integer.parseInt(request.getParameter("id"));
 RubrosBean rubro = modelo.obtenerRubro(id);
 if (rubro != null) {
 request.setAttribute("rubro", rubro);
 request.getRequestDispatcher("/Rubros/modificarRubro.jsp").forward(request, response);
 } else {
 response.sendRedirect(request.getContextPath() + "/error404.jsp");
 }
 } catch (SQLException | IOException | ServletException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void modificar(HttpServletRequest request, HttpServletResponse response) {
 try {
 listaErrores.clear();
 RubrosBean rubro = new RubrosBean();
 rubro.setIdRubro(Integer.parseInt(request.getParameter("id")));
 rubro.setNombre(request.getParameter("nombre"));
 rubro.setDescripcion(request.getParameter("descripcion"));

 if (rubro.getNombre().isEmpty()) {
 listaErrores.add("El nombre es obligatorio");
 }
 if (rubro.getDescripcion().isEmpty()) {
 rubro.setDescripcion("Sin registros");
 }
 
 if (listaErrores.size() > 0) {
	 request.setAttribute("listaErrores", listaErrores);
	 request.getRequestDispatcher("rubros.do?op=obtener&id="+rubro.getIdRubro()).forward(request, response);
	 } else {
	 if (modelo.modificarRubro(rubro) > 0) {
		 listaOK.clear();
		 listaOK.add("El elemento ha sido modificado con éxito.");
		 request.setAttribute("listaOK", listaOK);
		 request.getRequestDispatcher("rubros.do?op=obtener&id="+rubro.getIdRubro()).forward(request, response);
	 } else {
		 listaErrores.clear();
		 listaErrores.add("Ocurrio un error. Intente de nuevo");
		 request.setAttribute("listaErrores", listaErrores);
		 request.getRequestDispatcher("rubros.do?op=modificar&id="+rubro.getIdRubro()).forward(request, response);
	 }
	 }
 } catch (IOException | SQLException | ServletException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void eliminar(HttpServletRequest request, HttpServletResponse response) {
 try {
 int id = Integer.parseInt(request.getParameter("id"));
 if (modelo.eliminarRubro(id) > 0) {
 request.setAttribute("exito", "Libro eliminado exitosamente");

 } else {
 request.setAttribute("fracaso", "No se puede eliminar este libro");
 }
 request.getRequestDispatcher("/rubros.do?op=listar").forward(request, response);
 } catch (SQLException | ServletException | IOException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
}

