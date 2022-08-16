package www.sv.cuponera.controller;

import java.io.IOException;
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
import www.sv.cuponera.modelo.OfertaModel;

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
		
		try(Writer out = response.getWriter()){
			listar(request, response); 

		}
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			OfertaModel ofertaModel = new OfertaModel(); 
			List<OfertaBean> lista = ofertaModel.listarOfertas(); 
			if(lista.isEmpty()) {
				request.setAttribute("error", "No se ha encontrado ofertas");
			}else {
				request.setAttribute("Listaofertas", lista);
			}
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
	
	

}
