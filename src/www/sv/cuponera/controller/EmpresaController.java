package www.sv.cuponera.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.sv.cuponera.utils.Validaciones;
import www.sv.cuponera.beans.EmpresaBean;
import www.sv.cuponera.modelo.RubroModel;
import www.sv.cuponera.modelo.RubrosModel;
import www.sv.cuponera.modelo.EmpresaModel;

/**
 * Servlet implementation class EmpresaController
 */
@WebServlet(name="EmpresaController", urlPatterns="/empresas.do")
public class EmpresaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<String> listaErrores = new ArrayList<>();
	EmpresaModel modeloEmpresa = new EmpresaModel();
	RubroModel modeloRubros = new RubroModel();
	RubrosModel modelosRubros = new RubrosModel();
	/**
     * @see HttpServlet#HttpServlet()
     */
    public EmpresaController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
    	try (PrintWriter out = response.getWriter()){    
    		if(request.getParameter("op") == null) {    		  
    			listar(request, response); 
				return;
    		}
    		String op = request.getParameter("op"); 
    		switch(op) {
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
	    		case "eliminar": 
	    			Eliminar(request, response); 
	    			break;  
	    		case "editar": 
	    			Editar(request, response); 
	    			break;
    			default: 
					request.getRequestDispatcher("/error404.jsp").forward(request, response);
					break;
    		}
    	}
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 try {
			 request.setAttribute("listaEmpresas", modeloEmpresa.listarEmpresas());
			 request.setAttribute("listaRubros", modelosRubros.listarRubros());
			 request.getRequestDispatcher("empresas/listaEmpresas.jsp").forward(request, response);
		 }catch(SQLException | ServletException | IOException  ex) {		
			 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex); 			
		 }	
	}

    private void nuevo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			 request.setAttribute("listaRubros", modeloRubros.listaRubros());
			 request.getRequestDispatcher("empresas/nuevoEmpresa.jsp").forward(request, response);			 
		} catch (ServletException | IOException ex) {
			 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
    
	private void insertar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		 try{
			 listaErrores.clear();
			 EmpresaBean Empresa = new EmpresaBean();
			 if(Validaciones.isEmpty(request.getParameter("codigo"))){
				 listaErrores.add("El codigo del libro es obligatorio");
			 }else if(!Validaciones.esCodigoEmpresa(request.getParameter("codigo"))){
				 listaErrores.add("c?digo de la empresa debe tener un formato de tres letras y tres d?gitos ABC000");
			 }
			 if(Validaciones.isEmpty(request.getParameter("nombre"))){
				 listaErrores.add("El nombre de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("ubicacion"))){
				 listaErrores.add("La direccion de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("contacto"))){
				 listaErrores.add("El nombre de contacto de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("telefono"))){
				 listaErrores.add("El nombre del libro es obligatorio");
			 }else if(!Validaciones.esTelefono(request.getParameter("telefono"))){
				 listaErrores.add("El telefono debe tener el formato requerido");
			 }
			 if(Validaciones.isEmpty(request.getParameter("correo"))){
				 listaErrores.add("El correo de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("ganancias"))){
				 listaErrores.add("El porcentaje de ganancias de la empresa es obligatorio");
			 }else if(!Validaciones.esDecimalPositivo(request.getParameter("ganancias"))){
				 listaErrores.add("El porcentaje de ganancias deber ser un numero mayor a 0");
			 }
			 if(Validaciones.isEmpty(request.getParameter("rubro"))){
				 listaErrores.add("El rubro de la empresa es obligatorio");
			 }

				 Empresa.setIdEmpresa(request.getParameter("codigo"));
				 Empresa.setNombreEmpresa(request.getParameter("nombre"));
				 Empresa.setUbicacion(request.getParameter("ubicacion"));
				 Empresa.setContacto(request.getParameter("contacto"));
				 Empresa.setTelefono(request.getParameter("telefono"));
				 Empresa.setCorreo(request.getParameter("correo"));
				 try {
				 Empresa.setPorcentajeGanancias(Float.parseFloat(request.getParameter("ganancias")));
				 Empresa.setRubros_IdRubros(Integer.parseInt(request.getParameter("rubro")));	
				 }catch(NumberFormatException ex){
					 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
					 listaErrores.add("No se selecciono un dato valido en los campos de ganancias o rubros.");
				 }
			 if(listaErrores.size() == 0){

					if(modeloEmpresa.insertarEmpresa(Empresa)>0) {
						request.setAttribute("exito", "Empresa registrada exitosamente");
					}else {
						request.setAttribute("fracaso", "No se ha podido ingresar la empresa de manera correcta");
					}
					request.getRequestDispatcher("/empresas.do?op=listar").forward(request, response);										
			 }else{
				 request.setAttribute("empresa", Empresa);
				 request.setAttribute("listaErrores", listaErrores);
				 request.getRequestDispatcher("empresas.do?op=nuevo").forward(request, response);
			 }
		 } catch (ServletException ex) {
			 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
		 } catch (IOException ex) {
			 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
		 } catch (SQLException ex) {
			 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
		 }
	}

	private void obtener(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			String ID = request.getParameter("id");
			 EmpresaBean Empresa = modeloEmpresa.obtenerEmpresa(ID);
			if(Empresa !=null){
				request.setAttribute("empresa", Empresa);	
				request.setAttribute("listaRubros", modeloRubros.listaRubros());
				request.getRequestDispatcher("empresas/editarEmpresa.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath() + "/error404.jsp");
			}
		}catch(SQLException | ServletException | IOException  ex) {
			Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex); 
		}	
	}
	
	private void Editar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 try{
			 listaErrores.clear();
			 EmpresaBean Empresa = new EmpresaBean();
			 if(Validaciones.isEmpty(request.getParameter("codigo"))){
				 listaErrores.add("El codigo del libro es obligatorio");
			 }else if(!Validaciones.esCodigoEmpresa(request.getParameter("codigo"))){
				 listaErrores.add("c?digo de la empresa debe tener un formato de tres letras y tres d?gitos ABC000");
			 }
			 if(Validaciones.isEmpty(request.getParameter("nombre"))){
				 listaErrores.add("El nombre de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("ubicacion"))){
				 listaErrores.add("La direccion de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("contacto"))){
				 listaErrores.add("El nombre de contacto de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("telefono"))){
				 listaErrores.add("El nombre del libro es obligatorio");
			 }else if(!Validaciones.esTelefono(request.getParameter("telefono"))){
				 listaErrores.add("El telefono debe tener el formato requerido");
			 }
			 if(Validaciones.isEmpty(request.getParameter("correo"))){
				 listaErrores.add("El correo de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("ganancias"))){
				 listaErrores.add("El porcentaje de ganancias de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("rubro"))){
				 listaErrores.add("El rubro de la empresa es obligatorio");
			 }
			 if(Validaciones.isEmpty(request.getParameter("ganancias"))){
				 listaErrores.add("El porcentaje de ganancias de la empresa es obligatorio");
			 }else if(!Validaciones.esDecimalPositivo(request.getParameter("ganancias"))){
				 listaErrores.add("El porcentaje de ganancias deber ser un numero mayor a 0");
			 }
			 Empresa.setIdEmpresa(request.getParameter("codigo"));
			 Empresa.setNombreEmpresa(request.getParameter("nombre"));
			 Empresa.setUbicacion(request.getParameter("ubicacion"));
			 Empresa.setContacto(request.getParameter("contacto"));
			 Empresa.setTelefono(request.getParameter("telefono"));
			 Empresa.setCorreo(request.getParameter("correo"));
			 try {
			 Empresa.setPorcentajeGanancias(Float.parseFloat(request.getParameter("ganancias")));
			 Empresa.setRubros_IdRubros(Integer.parseInt(request.getParameter("rubro")));	
			 }catch(NumberFormatException ex){
				 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
				 listaErrores.add("No se selecciono un dato valido en los campos de ganancias o rubros.");
			 }	
			 if(listaErrores.size() == 0){				
				 if(modeloEmpresa.editarEmpresa(Empresa)>0) {		
					 request.setAttribute("exito", "Se modifico la empresa de manera correcta");
				 }else {
					 request.setAttribute("fracaso", "No se ha podido modificar la empresa de manera correcta");					 
				 }				 
				 request.getRequestDispatcher("/empresas.do?op=listar").forward(request, response);
			 }else{
				 String razones = ""; 
					for(int indexz = 0; indexz<listaErrores.size(); indexz++) {
						razones = (indexz+1) + ". " + listaErrores.get(indexz);  
					}
					request.setAttribute("fracaso", "No se ha podido realizar el registro de manera correcta, por favor revisar: " + razones);
					request.getRequestDispatcher("/empresas.do?op=listar").forward(request, response);
			 }
		 } catch (ServletException ex) {
			 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
		 } catch (IOException ex) {
			 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
		 } catch (SQLException ex) {
			 Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
		 }
	}

	private void Eliminar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			String ID = request.getParameter("id");			
			EmpresaBean Empresa = modeloEmpresa.obtenerEmpresa(ID);
			if(modeloEmpresa.eliminarEmpresa(ID)>0) {
				request.setAttribute("exito", "Registro eliminado de manera exitosa.");
			}else {
				request.setAttribute("fracaso", "No se ha podido eliminar el registrol.");
			}
		}catch (SQLException ex) {
			Logger.getLogger(EmpresaController.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}	 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
