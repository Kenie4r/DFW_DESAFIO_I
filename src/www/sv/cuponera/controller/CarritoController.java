package www.sv.cuponera.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import www.sv.cuponera.beans.CuponBean;
import www.sv.cuponera.beans.OfertaBean;
import www.sv.cuponera.modelo.Conection;
import www.sv.cuponera.modelo.OfertaModel;

/**
 * Servlet implementation class CarritoController
 */
@WebServlet(name = "/CarritoController", urlPatterns = "/carrito")
public class CarritoController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
    	String op=(request.getParameter("op")!=null)?request.getParameter("op"):"carrito";
        switch (op){
            case "carrito":
            		listar(request, response); 
            	break;
            case "transation":
                transaction(request,response);
                //System.out.println("transaction");
                break;
            case "obtener":
                obtener(request,response);
                break;
            default: 
        		listar(request, response); 

             break; 
        }
}

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request,response);
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request,response);

}

protected void transaction(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    response.setContentType("text/html;charset=UTF-8");
    String name=request.getParameter("cardName");
    String numeroCard=request.getParameter("cardNum");
    String expDate=request.getParameter("expDate");
    String Cvv=request.getParameter("Cvv");
    Conection conection=new Conection();


}
protected void obtener(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{

	


}
protected void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	String codes = request.getParameter("ofertas"); 	
	OfertaModel ofertas = new OfertaModel(); 
	try {
		List<OfertaBean> lista = new ArrayList<>();

		String[] codesSplit = codes.split(","); 
		for(String codigo : codesSplit) {
	
			lista.add(ofertas.OfertaCarrito(codigo)); 
		}
		
		System.out.print(lista.size());
		request.setAttribute("componentes", lista);
		request.getRequestDispatcher("Carrito/index.jsp").forward(request, response);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		Logger.getLogger(CarritoController.class.getName()).log(Level.SEVERE, null, e);
	} 
	//response.sendRedirect("Carrito/index.jsp");

}
}
