package www.sv.cuponera.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import www.sv.cuponera.beans.PagoBean;
import www.sv.cuponera.modelo.pagosModel;
import www.sv.cuponera.utils.Validaciones;
import www.sv.cuponera.utils.cesarCipher;

/**
 * Servlet implementation class PagoController
 */
@WebServlet(name = "/PagoController", urlPatterns = "/MetodosPago")
public class PagoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagoController() {
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

	private void doProcedure(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{

		String op = (request.getParameter("op") !=null)? request.getParameter("op"): ""; 
		switch(op) {
		
		case "verificar":
			verificar(request, response); 
			break; 
			case "listar": 
				listar(request, response); 
				
				break; 
				
			case "eliminar": 
				
				eliminar(request, response); 
				break; 
			case "obtener":
				obtener(request, response); 
				break;
			case "insertar":
			case "nuevo":
				nuevo(request, response); 
				break;
			default: 	
				listar(request, response); 
				break;
		}
	}

	private void verificar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try(PrintWriter out = response.getWriter()){
			String codigoPago = request.getParameter("codigo").toString();
			String cvpass = request.getParameter("cv").toString(); 
			cvpass = cesarCipher.cipher(cvpass); 
			pagosModel model = new pagosModel(); 
			if(model.confirmPago(codigoPago, cvpass)>0) {
				out.print("Confirmado");
			}else {
				out.print("No confirmado");
			}
		}catch(SQLException ex) {
			Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, ex); 				

		}
	
	}

	private void nuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("op").equals("nuevo")) {
			request.getRequestDispatcher("/pagos/nuevoPago.jsp").forward(request, response);
		}else if(request.getParameter("op").equals("insertar")){
			List<String> list = new ArrayList<>();
			String fechaV = request.getParameter("fin"); 
			pagosModel model = new pagosModel(); 
			PagoBean pago = new PagoBean();
	    	pago.setVencimiento(fechaV );

			pago.setCodigo(request.getParameter("codigo"));
			pago.setCodigoVerificacion(request.getParameter("cv"));
			pago.setMetodo(request.getParameter("nombre"));
			pago.setIdUsuario(Integer.parseInt(request.getParameter("userID")));
			pago.setEstado("ACTIVO");
			if(!Validaciones.isCodigoTarjeta(request.getParameter("codigo"))) {
				list.add("El c??digo de la tarjeta ingresada es incorrecto"); 
			}
			if(!Validaciones.isCodigoV(request.getParameter("cv"))) {
				list.add("El c??digo de verificaci??n es incorrecto"); 
			}
			if(!Validaciones.isFechaVe(request.getParameter("fin"))) {
				list.add("La fecha de vencimiento es invalida");
			}else { 
				String[] arrayFecha = fechaV.split("/"); 
				LocalDate hoy = LocalDate.now();
				int year = Integer.parseInt(arrayFecha[1]); 
				int month = Integer.parseInt(arrayFecha[0]); 
				LocalDate venc = LocalDate.of(year, month, 1); 
				
				Period period = Period.between(hoy, venc);
				if(period.getYears()<0) {
					list.add("La fecha de vencimiento es invalida, la tarjeta debe tener un a??o como m??nimo para vencerse");

				}else {
					pago.setVencimiento(venc.toString());
				}
				
				
			}
			if(list.size()>0) {
		    	pago.setVencimiento(fechaV );

				request.setAttribute("pago", pago);
				request.setAttribute("errores", list); 
				request.getRequestDispatcher("/MetodosPago?op=nuevo").forward(request, response);
			}else {
				int rs = 0;
				try {
					rs = model.insertarPago(pago);
					if(rs>0) {
						request.setAttribute("exito", "Se ha creado el nuevo metodo de pago de manera correcta");
					}else {
						request.setAttribute("fracaso", "No se ha podido crear el nuevo metodo de pago, vuelve a intentarlo m??s tarde");
					}
					request.getRequestDispatcher("/MetodosPago?op=listar").forward(request, response);
				} catch (SQLException  e) {
					// TODO Auto-generated catch bloc
					Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, e); 				
				} 
				
			}
			
		}
	}

	private void obtener(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id").toString(); 
			pagosModel model = new pagosModel(); 

			int rs = model.eliminarPago(Integer.parseInt(id)); 
			if(rs>0) {
				request.setAttribute("exito", "Se ha eliminado el metodo de pago de manera correcta");
			}else {
				request.setAttribute("fracaso", "No se ha podido eliminar el  metodo de pago seleccionado, vuelve a intentarlo m??s tarde");
			}
			request.getRequestDispatcher("/MetodosPago?op=listar").forward(request, response);

		}catch(SQLException ex) {
			Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, ex); 				

		}
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String codigo = request.getSession().getAttribute("idUsuario").toString(); 
			List<PagoBean> pagos = null; 
			pagosModel model = new pagosModel(); 
			if(!codigo.isEmpty()) {
				pagos = model.listarPagosUser(codigo); 
			}
			request.setAttribute("pagos", pagos);
			request.getRequestDispatcher("/pagos/index.jsp").forward(request, response);
		}catch(SQLException ex) {
			Logger.getLogger(PagoController.class.getName()).log(Level.SEVERE, null, ex); 				

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
