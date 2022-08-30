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
import www.sv.cuponera.utils.cesarCipher;

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
			case "passCH":
				passChange(request, response); 
				break; 
			case "passVer":
				obtenerPass(request,response); 
				break; 
		}
	}
	private void obtenerPass(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try (PrintWriter out = response.getWriter()) {
			ClienteRegistroModel model = new ClienteRegistroModel(); 
			String pass = request.getParameter("pass"); 
			String codigo = request.getParameter("codigo"); 
			String result;
			result = model.getPassword(codigo); 
			if(result.equals( cesarCipher.cipher(pass))) {
				out.print("pass correcta");
			}else {
				out.print("pass incorrecta"); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	private void passChange(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		try (PrintWriter out = response.getWriter()) {
			ClienteRegistroModel model = new ClienteRegistroModel(); 
			String pass = request.getParameter("pass"); 
			String codigo = request.getParameter("codigo"); 
			pass = cesarCipher.cipher(pass); 
			int result;
			result = model.setPasstoNew(codigo, pass); 
			if(result>0) {
				out.print("actualizado");
			}else {
				out.print("pass incorrecta"); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				out.print("Se ha confirmado el codigo");
			}else {
				out.print("No se ha podido confirmar la cuenta, vuelve a intentarlo"); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
}
