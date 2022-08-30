package www.sv.cuponera.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import www.sv.cuponera.modelo.ClienteRegistroModel;

/**
 * Servlet implementation class UsuarioController
 */
@WebServlet(name = "/UsuarioController" , urlPatterns = "/usuario")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioController() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcedure(request, response);
	}
	
	
	protected void doProcedure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String option = (request.getParameter("op")!=null)?request.getParameter("op"):""; 
		switch(option) {
			case "passV": 
				passVerification(request, response); 
			break; 
		}
	}
	public void passVerification(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try (PrintWriter out = response.getWriter()) {
			ClienteRegistroModel model = new ClienteRegistroModel(); 
			String codigo = request.getParameter("codigo"); 
			int result;
			result = model.setPassInitToVerify(codigo);
			if(result>0) {
				HttpSession ss = request.getSession(); 
				ss.setAttribute("passinit", null);
				out.print("Se ha confirmado el código");
			}else {
				out.print("No se ha podido confirmar la cuenta, vuelve a intentarlo"); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
}
