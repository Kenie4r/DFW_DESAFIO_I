package www.sv.cuponera.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.sv.cuponera.beans.OfertaBean;
import www.sv.cuponera.beans.RubrosBean;
import www.sv.cuponera.modelo.OfertaModel;
import www.sv.cuponera.modelo.RubrosModel;

/**
 * Servlet implementation class OfertaController
 */
@WebServlet(name = "/OfertaController", urlPatterns = {"/ofertas"})
public class OfertaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OfertaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcedure(request, response); 
	}

	private void doProcedure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String option = (request.getParameter("op") !=null)?request.getParameter("op"): "Listar"; 
		switch(option){
			case "Listar": 
				listar(request, response); 
				break; 
			case "obtenerCarro": 
				getOfertaForCart(request, response); 
				break; 
			default: 
				listar(request, response); 
			break; 
		}
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			OfertaModel ofertaModel = new OfertaModel();
			RubrosModel rubrosModel = new RubrosModel(); 
			List<OfertaBean> lista; 
			if(request.getParameter("rubro")!=null) {
				lista = ofertaModel.listarOfertasClientesByRubro(Integer.parseInt(request.getParameter("rubro"))); 
			}else {
				lista = ofertaModel.listarOfertasClientes() ;
			}
			List<RubrosBean> rubros =  rubrosModel.listarRubros(); 
		
				
			request.setAttribute("Listaofertas", lista);
			request.setAttribute("rubros", rubros);
			request.getRequestDispatcher("Ofertas/listaOfertas.jsp").forward(request, response);

		}catch(IOException | ServletException | SQLException ex) {
			Logger.getLogger(OfertaController.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void getOfertaForCart(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try (PrintWriter out = response.getWriter()){
			OfertaModel ofertaModel = new OfertaModel(); 
			int codigo = Integer.parseInt(request.getParameter("codigo"));
			OfertaBean oferta = ofertaModel.obtenerOferta(codigo); 
			
			
			
			String html = "<div class=\"flex items-center hover:bg-gray-100 -mx-8 px-6 py-5\" id='product_"+oferta.getIdOferta()+"'>\r\n" + 
					"          <div class=\"flex w-2/5\"> <!-- product -->\r\n" + 
					"            <div class=\"flex flex-col justify-between ml-4 flex-grow\">\r\n" + 
					"              <span class=\"font-bold text-sm\">"+oferta.getNombreOferta()+"</span>\r\n" + 
					"              <span class=\"text-red-500 text-xs\">"+oferta.getDescripcion()+"</span>\r\n" + 
					"              <a href=\"#\" id='eliminar_"+oferta.getIdOferta()+"'class=\"font-semibold hover:text-red-500 text-gray-500 text-xs\">Eliminar</a>\r\n" + 
					"            </div>\r\n" + 
					"          </div>\r\n" + 
					"          <div class=\"flex justify-center w-1/5\">\r\n" + 
					"            <img src='https://www.svgrepo.com/show/25409/minus-sign-of-a-line-in-horizontal-position.svg ' id='minus_"+oferta.getIdOferta()+"' class=\" object-contain	 cursor-pointer	 fill-current text-gray-600 w-4 mx-3\" viewBox=\"0 0 448 512\"/>\r\n" + 
					"			<input type='hidden' id='id_"+oferta.getIdOferta()+"' value='"+oferta.getIdOferta()+"'/>\r\n" + 
					"			<input type='hidden'  id='precio_"+oferta.getIdOferta()+"' value='"+oferta.getPrecioOfertado()+"'/> \r\n" + 
					"<input type='hidden' id='total_"+oferta.getIdOferta()+"' value='"+oferta.getPrecioOfertado()+"' class='totales'>"+
					"            <input id='cantidad_"+oferta.getIdOferta()+"'class=\"mx-2 border text-center w-10\" type=\"text\" value=\"1\" readonly>\r\n" + 
					"\r\n" + 
					"            <img src='https://www.freeiconspng.com/thumbs/plus-icon/plus-icon-black-2.png'  id='plus_"+oferta.getIdOferta()+"'  class=\" object-contain	cursor-pointer	fill-current text-gray-600 w-4 mx-3\" viewBox=\"0 0 448 512\"/>\r\n" +  
					"          </div>\r\n" + 
					"          <span class=\"text-center w-1/5 font-semibold text-sm\">$"+oferta.getPrecioOfertado()+"</span>\r\n" + 
					"          <span class=\"text-center w-1/5 font-semibold text-sm\" id='totalSpan_"+oferta.getIdOferta()+"'>$"+oferta.getPrecioOfertado()+"</span>\r\n" + 
					"        </div>"; 
			
			
			out.print(html); 
		}catch(IOException | SQLException ex) {
			Logger.getLogger(OfertaController.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	
	
	

}
