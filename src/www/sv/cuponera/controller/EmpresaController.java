package www.sv.cuponera.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.sv.cuponera.beans.EmpresaBean;
import www.sv.cuponera.beans.RolBean;
import www.sv.cuponera.modelo.EmpresaModel;
import www.sv.cuponera.modelo.RubroModel;

/**
 * Servlet implementation class EmpresaController
 */
@WebServlet("/EmpresaController")
public class EmpresaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	        response.setContentType("text/html;charset=UTF-8");
	        String op=request.getParameter("op");
	        if (op == null) {
	            listarEmpresa(request,response);
	        }
	        switch (op){
	           case "insertar":
	                listarRubros(request,response);
	                break;
	           case "guardar":
	        	   insertarEmpresa(request, response);
	        	   break;
	           case "obtener":
	                obtenerEmpresa(request,response);
	                break;
	            case "modificar":
	                modificarEmpresa(request, response);
	                break;
	            case "listar":
	            	listarEmpresa(request,response);
	                break;
	            case "eliminar":
	                eliminarEmpresa(request, response);
	                break;

	        }
	    }
	 
	 EmpresaModel model= new EmpresaModel();
	 public void listarEmpresa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	        
	            request.setAttribute("listaEmpresa",model.listaEmpresa());
	            request.setAttribute("test","testeo del la funcion");
	            request.getRequestDispatcher("/Empresa/index.jsp").forward(request, response);
	        
	    }
	 public void listarRubros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	        RubroModel rubros=new RubroModel();
         request.setAttribute("listaRubro",rubros.listaRubros());
         request.setAttribute("test","testeo del la funcion");
         request.getRequestDispatcher("/Empresa/crearEmpresa.jsp").forward(request, response);
     
 }
	  public void insertarEmpresa(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	        response.setContentType("text/html;charset=UTF-8");
	        EmpresaBean bean= new EmpresaBean();
	        bean.setNombreEmpresa(request.getParameter("name")) ;
	        bean.setIdRubros(request.getParameter("rubro"));
	        bean.setUbicacion(request.getParameter("ubicacion"));
	        bean.setPorcentajeGanancias(request.getParameter("Porcentaje"));
	        if (model.insertarEmpresa(bean)>0){
	            request.setAttribute("exito","Se logro crear el rol");
	            listarEmpresa(request, response);

	        }else {
	            request.setAttribute("fracaso","Se logro crear el rol");
	           request.getRequestDispatcher("/Roles/crearEmpresa.jsp").forward(request,response);


	        }
	    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	  public void eliminarEmpresa(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	        response.setContentType("text/html;charset=UTF-8");
	        EmpresaBean bean=new EmpresaBean();
	       bean.setIdEmpresa(request.getParameter("id"));
	        model.eliminarEmpresa(bean);
	        request.setAttribute("exito","Se logro eliminar la empresa");
	        listarEmpresa(request,response);

	    }
	  public void obtenerEmpresa(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		  response.setContentType("text/html;charset=UTF-8");
		  EmpresaBean bean=new EmpresaBean();
	       bean.setIdEmpresa(request.getParameter("id"));
	       model.obtenerEmpresa(bean);
	       RubroModel rubros=new RubroModel();
	         request.setAttribute("listaRubro",rubros.listaRubros());
	         request.setAttribute("test","testeo del la funcion");
	       request.setAttribute("nombre", bean.getNombreEmpresa());
	       request.setAttribute("id", bean.getIdEmpresa());
	       request.setAttribute("ubicacion", bean.getUbicacion());
	       request.setAttribute("porcentaje", bean.getPorcentajeGanancias());
	       request.getRequestDispatcher("/Empresa/modificarEmpresa.jsp").forward(request,response);
	  }
	  public void modificarEmpresa(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	        response.setContentType("text/html;charset=UTF-8");
	        EmpresaBean bean=new EmpresaBean();
	       bean.setIdEmpresa(request.getParameter("id"));
	       bean.setNombreEmpresa(request.getParameter("name")) ;
	        bean.setIdRubros(request.getParameter("rubro"));
	        bean.setUbicacion(request.getParameter("ubicacion"));
	        bean.setPorcentajeGanancias(request.getParameter("Porcentaje"));
	        model.modificarEmpresa(bean);
	        
	        listarEmpresa(request,response);

	    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
