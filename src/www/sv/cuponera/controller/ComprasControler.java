package www.sv.cuponera.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.sv.cuponera.beans.CuponBean;
import www.sv.cuponera.modelo.CuponModel;

/**
 * Servlet implementation class ComprasControler
 */
@WebServlet(name = "/ComprasControler",  urlPatterns = "/Miscompras")
public class ComprasControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComprasControler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcedure(request, response); 
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void doProcedure(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		// TODO Auto-generated method stub
		String option = (request.getParameter("op")!=null)?request.getParameter("op"): ""; 
		switch(option) {
		case "listar":
			listar(request, response); 
			break;
		default: 
			listar(request, response); 

			break; 
		}
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {

		String codeUser = (String) request.getSession().getAttribute("idUsuario");
		if(codeUser ==null) {
			codeUser = "0"; 
		}
		CuponModel cupModel = new CuponModel(); 
		try {
			
			List<CuponBean> lista ; 
			
			if(request.getParameter("fl")!=null) {
				lista = cupModel.listarCuponesForUserF(codeUser, request.getParameter("fl")); 
			}else {
				lista = cupModel.listarCuponesForUser(codeUser);
			}
			
			request.setAttribute("list", lista);
			request.getRequestDispatcher("/Compras/misCompras.jsp").forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
