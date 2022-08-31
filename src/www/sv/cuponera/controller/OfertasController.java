package www.sv.cuponera.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.util.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import www.sv.cuponera.beans.*;
import www.sv.cuponera.modelo.*;

@WebServlet(name = "OfertasController", urlPatterns = {"/ofertas.do"})

public class OfertasController extends HttpServlet {
	
 ArrayList<String> listaErrores = new ArrayList<>();
 ArrayList<String> listaOK = new ArrayList<>();
 OfertasModel modelo = new OfertasModel();
 SimpleDateFormat date = new SimpleDateFormat ("yyyy-MM-dd");
 LocalDate today = LocalDate.now();
 
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
	try {
		insertar(request, response);
	} catch (ParseException e) {
		e.printStackTrace();
	}
 break;
 
 case "obtener":
 obtener(request, response, "obtener");
 break;
 
 case "revisar":
	 obtener(request, response, "revisar");
	 break;
 
 case "modificar":
	try {
		modificar(request, response);
	} catch (ParseException e) {
		e.printStackTrace();
	}
 break;
 
 case "aprobar":
	 aprobacion_rechazo(request, response, "aprobar");
	 break;
	 
 case "rechazar":
	 aprobacion_rechazo(request, response, "rechazar");
	 break;

 case "descartar":
	 aprobacion_rechazo(request, response, "descartar");
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
 request.getRequestDispatcher("/Ofertas/crearOferta.jsp").forward(request, response);
 } catch (ServletException | IOException ex) {
 Logger.getLogger(OfertasController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void listar(HttpServletRequest request, HttpServletResponse response) {
 try {
request.setAttribute("listaOfertas", modelo.listarOfertas());
request.getRequestDispatcher("/Ofertas/index.jsp").forward(request, response);
 } catch (SQLException | ServletException | IOException ex) {
 Logger.getLogger(OfertasController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void insertar(HttpServletRequest request, HttpServletResponse response) throws ParseException {
 try {
 listaErrores.clear();
 OfertasBean oferta = new OfertasBean();
 oferta.setNombre(request.getParameter("nombre"));
 oferta.setDescripcion(request.getParameter("descripcion"));
 oferta.setPrecioRe(Float.parseFloat(request.getParameter("precioRe")));
 oferta.setPrecioOf(Float.parseFloat(request.getParameter("precioOf")));
 oferta.setFechaInicio(request.getParameter("inicio"));
 oferta.setFechFin(request.getParameter("fin"));
 oferta.setFechaLimite(request.getParameter("fechaLim"));
 oferta.setCupones(Integer.parseInt(request.getParameter("cupones")));
 oferta.setEstado(request.getParameter("estado"));
 oferta.setEmpresaID(request.getParameter("empresa"));
 
 if (oferta.getNombre().isEmpty()) {
 listaErrores.add("El nombre es obligatorio");
 }
 if (oferta.getDescripcion().isEmpty()) {
 listaErrores.add("La descripcion es obligatoria");
 }
 if (oferta.getPrecioRe() <= 0 || oferta.getPrecioRe() == 0.00 ) {
 listaErrores.add("Ingresa un precio regular válido");
 }
 if (oferta.getPrecioOf() <= 0 || oferta.getPrecioOf() == 0.00 ) {
 listaErrores.add("Ingresa un precio de oferta válido");
 }
 if (oferta.getPrecioOf() >= oferta.getPrecioRe() ) {
 listaErrores.add("El precio de oferta debe ser menor al precio regular");
 }
 if (oferta.getFechaInicio().isEmpty()) {
 listaErrores.add("La fecha de inicio de oferta es obligatoria");
 }
 if (oferta.getFechFin().isEmpty()) {
 listaErrores.add("La fecha de fin de oferta es obligatoria");
 }
 if (oferta.getFechaLimite().isEmpty()) {
 listaErrores.add("La fecha limite para uso de cupones es obligatoria");
 }
 if (oferta.getCupones() <= 0) {
 listaErrores.add("Ingresa una cantidad de cupones válida");
 }
 
 if (listaErrores.size() > 0) {
 request.setAttribute("listaErrores", listaErrores);
 request.getRequestDispatcher("ofertas.do?op=nuevo").forward(request, response);
 } else {
	 Date dateIn = date.parse(oferta.getFechaInicio());
	 Date dateFn = date.parse(oferta.getFechFin());
	 Date dateLm = date.parse(oferta.getFechaLimite());
	 Date dateTd = date.parse(String.valueOf(today));
	 listaErrores.clear();
	 if(dateIn.before(dateTd)) {
		 listaErrores.add("La fecha de inicio de la oferta debe ser después o igual a la fecha actual");
	 }else if(dateFn.before(dateIn) || dateFn.equals(dateIn)) {
		 listaErrores.add("La fecha de fin de la oferta debe ser después de la fecha de inicio");
	 }else if(dateLm.before(dateFn)) {
		 listaErrores.add("La fecha limite para canjear cupones debe ser después o igual a la fecha de fin de la oferta");
	 }
	 if(listaErrores.size() > 0) {
		 request.setAttribute("listaErrores", listaErrores);
		 request.getRequestDispatcher("ofertas.do?op=nuevo").forward(request, response);
	 }else {
		 if (modelo.insertarOferta(oferta) > 0) {
			 listaOK.clear();
			 listaOK.add("El elemento ha sido ingresado y enviado para revisión.");
			 request.setAttribute("listaOK", listaOK);
			 request.getRequestDispatcher("ofertas.do?op=nuevo").forward(request, response);
			 } else {
			 listaErrores.clear();
			 listaErrores.add("Ocurrió un error. Intente de nuevo");
			 request.setAttribute("listaErrores", listaErrores);
			 request.getRequestDispatcher("ofertas.do?op=nuevo").forward(request, response);
			 }
	 }
 }
 } catch (IOException | SQLException | ServletException ex) {
 Logger.getLogger(OfertasController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }

 private void obtener(HttpServletRequest request, HttpServletResponse response, String opcion) {
 try {
 int id = Integer.parseInt(request.getParameter("id"));
 OfertasBean oferta = modelo.obtenerOferta(id);
 if (oferta != null) {
 request.setAttribute("oferta", oferta);
 if(opcion.equals("revisar")) {
	 request.getRequestDispatcher("/Ofertas/revisarOferta.jsp").forward(request, response);

 }else {
	 request.getRequestDispatcher("/Ofertas/modificarOferta.jsp").forward(request, response);
 }

 } else {
 response.sendRedirect(request.getContextPath() + "/error404.jsp");
 }
 } catch (SQLException | IOException | ServletException ex) {
 Logger.getLogger(OfertasController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
 
 private void modificar(HttpServletRequest request, HttpServletResponse response)  throws ParseException {
	 try {
		 listaErrores.clear();
		 OfertasBean oferta = new OfertasBean();
		 oferta.setIdOferta(Integer.parseInt(request.getParameter("idOferta")));
		 oferta.setNombre(request.getParameter("nombre"));
		 oferta.setDescripcion(request.getParameter("descripcion"));
		 oferta.setPrecioRe(Float.parseFloat(request.getParameter("precioRe")));
		 oferta.setPrecioOf(Float.parseFloat(request.getParameter("precioOf")));
		 oferta.setFechaInicio(request.getParameter("inicio"));
		 oferta.setFechFin(request.getParameter("fin"));
		 oferta.setFechaLimite(request.getParameter("fechaLim"));
		 oferta.setCupones(Integer.parseInt(request.getParameter("cupones")));
		 oferta.setEstado(request.getParameter("estado"));
		 oferta.setEmpresaID(request.getParameter("empresa"));
		 
		 if (oferta.getNombre().isEmpty()) {
		 listaErrores.add("El nombre es obligatorio");
		 }
		 if (oferta.getDescripcion().isEmpty()) {
		 listaErrores.add("La descripcion es obligatoria");
		 }
		 if (oferta.getPrecioRe() <= 0 || oferta.getPrecioRe() == 0.00 ) {
		 listaErrores.add("Ingresa un precio regular válido");
		 }
		 if (oferta.getPrecioOf() <= 0 || oferta.getPrecioOf() == 0.00 ) {
		 listaErrores.add("Ingresa un precio de oferta válido");
		 }
		 if (oferta.getPrecioOf() >= oferta.getPrecioRe() ) {
		 listaErrores.add("El precio de oferta debe ser menor al precio regular");
		 }
		 if (oferta.getFechaInicio().isEmpty()) {
		 listaErrores.add("La fecha de inicio de oferta es obligatoria");
		 }
		 if (oferta.getFechFin().isEmpty()) {
		 listaErrores.add("La fecha de fin de oferta es obligatoria");
		 }
		 if (oferta.getFechaLimite().isEmpty()) {
		 listaErrores.add("La fecha limite para uso de cupones es obligatoria");
		 }
		 if (oferta.getCupones() <= 0) {
		 listaErrores.add("Ingresa una cantidad de cupones válida");
		 }
		 
		 if (listaErrores.size() > 0) {
		 request.setAttribute("listaErrores", listaErrores);
		 request.getRequestDispatcher("ofertas.do?op=obtener&id="+oferta.getIdOferta()).forward(request, response);
		 } else {
			 Date dateIn = date.parse(oferta.getFechaInicio());
			 Date dateFn = date.parse(oferta.getFechFin());
			 Date dateLm = date.parse(oferta.getFechaLimite());
			 Date dateTd = date.parse(String.valueOf(today));
			 listaErrores.clear();
			 if(dateIn.before(dateTd)) {
				 listaErrores.add("La fecha de inicio de la oferta debe ser después o igual a la fecha actual");
			 }else if(dateFn.before(dateIn) || dateFn.equals(dateIn)) {
				 listaErrores.add("La fecha de fin de la oferta debe ser después de la fecha de inicio");
			 }else if(dateLm.before(dateFn)) {
				 listaErrores.add("La fecha limite para canjear cupones debe ser después o igual a la fecha de fin de la oferta");
			 }
			 if(listaErrores.size() > 0) {
				 request.setAttribute("listaErrores", listaErrores);
				 request.getRequestDispatcher("ofertas.do?op=obtener&id="+oferta.getIdOferta()).forward(request, response);
			 }else {
				 if (modelo.modificarOferta(oferta) > 0) {
					 listaOK.clear();
					 listaOK.add("El elemento ha sido modificado y enviado para aprobación.");
					 request.setAttribute("listaOK", listaOK);
					 request.getRequestDispatcher("ofertas.do?op=revisar&id="+oferta.getIdOferta()).forward(request, response);
					 } else {
					 listaErrores.clear();
					 listaErrores.add("Ocurrió un error. Intente de nuevo");
					 request.setAttribute("listaErrores", listaErrores);
					 request.getRequestDispatcher("ofertas.do?op=obtener&id="+oferta.getIdOferta()).forward(request, response);
					 }
			 }
		 }
		 } catch (IOException | SQLException | ServletException ex) {
		 Logger.getLogger(OfertasController.class.getName()).log(Level.SEVERE, null, ex);
		 }
 }
 
 private void aprobacion_rechazo(HttpServletRequest request, HttpServletResponse response, String accion){
	 try {
		 listaErrores.clear();
		 OfertasBean oferta = new OfertasBean();
		 oferta.setIdOferta(Integer.parseInt(request.getParameter("id")));

		 if(accion.contentEquals("rechazar")) {
			 oferta.setObservaciones(request.getParameter("observaciones"));
			 oferta.setEstado(request.getParameter("estado"));
			 
			 if (oferta.getObservaciones().isEmpty()) {
			 listaErrores.add("Las observaciones son obligatorias");
			 }
		 }
		 
		 if (listaErrores.size() > 0) {
		 request.setAttribute("listaErrores", listaErrores);
		 request.getRequestDispatcher("ofertas.do?op=revisar&id="+oferta.getIdOferta()).forward(request, response);
		 } else {
			 if(accion.contentEquals("aprobar")) {
				 oferta.setObservaciones("Sin registros");
				 oferta.setEstado("APROBADA");
			 }else if(accion.contentEquals("descartar")) {
				 oferta.setObservaciones(request.getParameter("obs"));
				 oferta.setEstado("DESCARTADA");

			 }
			 
			 if (modelo.aprobacion_rechazo(oferta) > 0) {
				 listaOK.clear();
				 if(accion.contentEquals("rechazar")) {
					 listaOK.add("El elemento ha sido devuelto con las siguientes observaciones: " + oferta.getObservaciones() + ".");
					 request.setAttribute("listaOK", listaOK);
					 request.getRequestDispatcher("ofertas.do?op=revisar&id="+oferta.getIdOferta()).forward(request, response);
					 
				 }else if(accion.contentEquals("aprobar")){
					 listaOK.add("El elemento ha sido aprobado y publicado con éxito.");
					 request.setAttribute("listaOK", listaOK);
					 request.getRequestDispatcher("ofertas.do?op=revisar&id="+oferta.getIdOferta()).forward(request, response);
				 }else{
					 listaOK.add("El elemento ha sido descartado, solo estará disponible la opción de eliminar.");
					 request.setAttribute("listaOK", listaOK);
					 request.getRequestDispatcher("ofertas.do?op=revisar&id="+oferta.getIdOferta()).forward(request, response);
				 }
				 
				 } else {
				 listaErrores.clear();
				 listaErrores.add("Ocurrió un error. Intente de nuevo");
				 request.setAttribute("listaErrores", listaErrores);
				 request.getRequestDispatcher("ofertas.do?op=revisar&id="+oferta.getIdOferta()).forward(request, response);
				 }
		 }
		 } catch (IOException | SQLException | ServletException ex) {
		 Logger.getLogger(OfertasController.class.getName()).log(Level.SEVERE, null, ex);
		 }
 }
 
 private void eliminar(HttpServletRequest request, HttpServletResponse response) {
 try {
 int id = Integer.parseInt(request.getParameter("id"));
 if (modelo.eliminarOferta(id) > 0) {
 //request.setAttribute("exito", "Libro eliminado exitosamente");

 } else {
 //request.setAttribute("fracaso", "No se puede eliminar este libro");
 }
 request.getRequestDispatcher("/ofertas.do?op=listar").forward(request, response);
 } catch (SQLException | ServletException | IOException ex) {
 Logger.getLogger(OfertasController.class.getName()).log(Level.SEVERE, null, ex);
 }
 }
}

