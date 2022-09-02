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
import www.sv.cuponera.beans.PagoBean;
import www.sv.cuponera.beans.UsuarioBeans;
import www.sv.cuponera.modelo.ClienteRegistroModel;
import www.sv.cuponera.modelo.Conection;
import www.sv.cuponera.modelo.CuponModel;
import www.sv.cuponera.modelo.OfertaModel;
import www.sv.cuponera.modelo.pagosModel;
import www.sv.cuponera.modelo.randomCode;
import www.sv.cuponera.utils.Email;

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
   try(PrintWriter out =  response.getWriter()){
	    ClienteRegistroModel cmodel=new ClienteRegistroModel();

	   UsuarioBeans usuario =  cmodel.getUsuarioCode(request.getParameter("user")); 
	   String[] ofertasArray = request.getParameter("ofertas").split(",");
	   String[] cantidadesArray = request.getParameter("cantidades").split(","); 
	   if(ofertasArray.length>0) {
		   OfertaModel ofertas = new OfertaModel(); 
		   int hechas = 0; 
		   int necesario = 0; 
		   List<OfertaBean> listaOf = new ArrayList<>(); 
		   for(String oferta : ofertasArray) {
			   int compradas =0; 
			   OfertaBean of = ofertas.obtenerOfertayEmpresa(Integer.parseInt(oferta)); //obtener datos para poder insertar cupones
			   OfertaBean ofr = new OfertaBean(); 
			   
			   ofr.setNombreOferta(of.getNombreOferta());
			   int idx = java.util.Arrays.asList(ofertasArray).indexOf(oferta); 

			   if( Integer.parseInt(cantidadesArray[idx])<=of.getLimite()) {
				   for(int index = 0; index < Integer.parseInt(cantidadesArray[idx]) ; index++ ) {
					   
					   CuponBean cupon = new CuponBean(); 
					   String codigo = of.getNombreEmpresa() + randomCode.getRandomNumbers(7);  
					   
					   cupon.setUsuarioID(Integer.parseInt(request.getParameter("user")));
					   cupon.setOfertaID(Integer.parseInt(oferta));
					   cupon.setEstado("ACTIVO");
					   cupon.setFechaUso("NULL");
					   cupon.setCodigoCupon(codigo);
					   
					   
					  
					   CuponModel model = new CuponModel(); 
					   int rs = model.newCuponeForUser(cupon); 
					   necesario++; 
					   if(rs>0) {
						   compradas++; 
						   hechas++; 
					   }
					   
				   }
			   }
			   
			   ofr.setLimite(compradas);
			   if(ofr.getLimite()>0) {
				   listaOf.add(ofr); 

			   }
			   
			   
			   
			  
		   }
		   if(necesario>0) {
			   Email.resumenCompra(usuario.geteMail(), listaOf, usuario.getUsername()); 
		   }
			   if(necesario==hechas) {
				   out.print("exito"); 
			   }else if(necesario>hechas && hechas!=0) {
				   out.print("exito2"); 

			     
		   }
		  else {
			   out.print("fracaso"); 

		   }
		   
		   
	   }
	   
	   
   } catch (NumberFormatException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
protected void obtener(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{

	


}
protected void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	String codes = (request.getParameter("ofertas")!=null)?request.getParameter("ofertas"):""; 	
	OfertaModel ofertas = new OfertaModel(); 
	try {
		List<OfertaBean> lista = new ArrayList<>();
		String codigo2 = request.getSession().getAttribute("idUsuario").toString(); 
		List<PagoBean> pagos = null; 
		pagosModel model = new pagosModel(); 
		if(!codigo2.isEmpty()) {
			pagos = model.listarPagosUserA(codigo2); 
		}
		if(codes.length()!=0) {
			String[] codesSplit = codes.split(","); 
			for(String codigo : codesSplit) {
		
				lista.add(ofertas.OfertaCarrito(codigo)); 
			}
		}
		System.out.print(lista.size());
		request.setAttribute("tarjetas", pagos);
		request.setAttribute("componentes", lista);
		request.getRequestDispatcher("Carrito/index.jsp").forward(request, response);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		Logger.getLogger(CarritoController.class.getName()).log(Level.SEVERE, null, e);
	} 
	//response.sendRedirect("Carrito/index.jsp");

}
}
