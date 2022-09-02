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
import www.sv.cuponera.utils.*;

@WebServlet(name = "UsuariosController", urlPatterns = {"/usuarios.do"})

public class UsuariosController extends HttpServlet {
	
 ArrayList<String> listaErrores = new ArrayList<>();
 ArrayList<String> listaOK = new ArrayList<>();
 UsuariosModel modelo = new UsuariosModel();
 ClienteRegistroModel modelo1 = new  ClienteRegistroModel();

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
 
 /*case "obtener":
 obtener(request, response);
 break;
 
 case "modificar":
 modificar(request, response);
 break;
 
 case "eliminar":
 eliminar(request, response);
 break;*/
 
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
 request.setAttribute("listaEmpresas", modelo.listarEmpreas());
 request.getRequestDispatcher("/Usuarios/crearUsuario.jsp").forward(request, response);
 } catch (SQLException | ServletException | IOException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void listar(HttpServletRequest request, HttpServletResponse response) {
 try {
request.setAttribute("listaUsuarios", modelo.listarUsuarios());
request.setAttribute("listaEmpresas", modelo.listarEmpreas());
request.getRequestDispatcher("/Usuarios/index.jsp").forward(request, response);
 } catch (SQLException | ServletException | IOException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void insertar(HttpServletRequest request, HttpServletResponse response) {
 try {
 listaErrores.clear();
 UsuarioBeans usuario = new UsuarioBeans();
 usuario.setApellido(request.getParameter("apellido"));
 usuario.setNombre(request.getParameter("name"));
 usuario.seteMail(request.getParameter("email"));
 usuario.setIdEmpresa(request.getParameter("empresa"));
 usuario.setIdRol(request.getParameter("rol"));
 usuario.setUsername(request.getParameter("username"));
 usuario.setDUI(request.getParameter("dui"));

 System.out.print(usuario.getPassInit());

 if (usuario.getUsername().isEmpty()) {
	 listaErrores.add("El usuario es oligatorio");
 }
 
 if (usuario.getNombre().isEmpty()) {
 listaErrores.add("El nombres es obligatorio");
 }
 if (usuario.getApellido().isEmpty()) {
	 listaErrores.add("El apellido es obligatorio");
 }
 if (usuario.geteMail().isEmpty()) {
	 listaErrores.add("El correo es obligatorio");
 }
 if (usuario.getIdEmpresa().equals("0")) {
	 listaErrores.add("La empresa donde pertenecerá el usuario es obligatoria");
 }
 if (usuario.getIdRol().equals("0")) {
	 listaErrores.add("El rol de usuario es obligatorio");
 }
 
 if(modelo1.duiIsUsed(usuario.getDUI())) {
	 listaErrores.add("El DUI ya es utilizado por otra persona");
 }
 
 if(modelo1.emailIsUsed(usuario.geteMail())) {
	 listaErrores.add("El correo ya ha sido utilizado por otra persona");
 }
 if(modelo1.usernameIsUsed(usuario.getUsername())) {
	 listaErrores.add("El nombre de usuario ya ha sido seleccionado por otra persona"); 
 }
 
 if (listaErrores.size() > 0) {
 request.setAttribute("listaErrores", listaErrores);
 request.getRequestDispatcher("usuarios.do?op=nuevo").forward(request, response);
 } else {
usuario.setPassword(randomCode.getRandomString(5));
usuario.setPassInit(randomCode.getRandomString(5));
 if (modelo1.insertarCliente(usuario) > 0) {
 listaOK.clear();
 listaOK.add("El usuario ha sido ingresado con éxito, favor notificar al usuario para que revise su correo.");
 request.setAttribute("listaOK", listaOK);
 
 Email.tokenUsuario(usuario.geteMail(), usuario.getPassInit()); 
 if(usuario.getIdRol().equals("1")){
 Email.adminPass(usuario.geteMail(), usuario.getUsername(), usuario.getPassword());
 
 }else if(usuario.getIdRol().equals("2")){
 Email.adminEmpPass(usuario.geteMail(), usuario.getUsername(), usuario.getPassword(), usuario.getIdEmpresa());
 
 }else if(usuario.getIdRol().equals("3")){
 Email.clientePass(usuario.geteMail(), usuario.getUsername(), usuario.getPassword());
 	 
 }else if(usuario.getIdRol().equals("4")) {
 Email.dependientePass(usuario.geteMail(), usuario.getUsername(), usuario.getPassword(), usuario.getIdEmpresa());

 }
 request.getRequestDispatcher("usuarios.do?op=nuevo").forward(request, response);
 } else {
 listaErrores.clear();
 listaErrores.add("Ocurrio un error. Intente de nuevo");
 request.setAttribute("listaErrores", listaErrores);
 request.getRequestDispatcher("usuarios.do?op=nuevo").forward(request, response);
 }
 }
 } catch (IOException | SQLException | ServletException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }

 /*private void obtener(HttpServletRequest request, HttpServletResponse response) {
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
		 request.getRequestDispatcher("rubros.do?op=obtener&id="+rubro.getIdRubro()).forward(request, response);
	 }
	 }
 } catch (IOException | SQLException | ServletException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void eliminar(HttpServletRequest request, HttpServletResponse response) {
 try {
 int id = Integer.parseInt(request.getParameter("id"));
 if (modelo.eliminarUsuario(id) > 0) {
 //request.setAttribute("exito", "Libro eliminado exitosamente");

 } else {
 //request.setAttribute("fracaso", "No se puede eliminar este libro");
 }
 request.getRequestDispatcher("/usuarios.do?op=listar").forward(request, response);
 } catch (SQLException | ServletException | IOException ex) {
 Logger.getLogger(RubrosController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }*/
}

