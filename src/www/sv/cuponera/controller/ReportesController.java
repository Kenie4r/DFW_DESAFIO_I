package www.sv.cuponera.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import www.sv.cuponera.modelo.ConeccionJasperModel;

/**
 * Servlet implementation class ReportesController
 */
@WebServlet("/ReportesController")
public class ReportesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
		/**
		 * 
		 * 

	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	 public void reporteCupon1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("application/pdf");
         response.setHeader("Content-Disposition","inline; attachment;filename=\"ReporteCupon.pdf\";");
         HttpSession session=request.getSession();
         String idUsuario=(String) session.getAttribute("idUsuario");
         Map parametros=new HashMap();
         try {
			Connection conn= ConeccionJasperModel.getConnection();
			 ServletOutputStream out= response.getOutputStream();
        	 parametros.put("idUsuario", idUsuario);
        	 String pdfRuta="";
             pdfRuta=getServletContext().getRealPath("Reportes/testJasperUsuario.jasper");
           //Pasar a ruta Jasper
             JasperReport report= (JasperReport) JRLoader.loadObjectFromFile(pdfRuta);
             //imprimir reporte
             JasperPrint print= JasperFillManager.fillReport(report,parametros,conn);
             JRPdfExporter exporter=new JRPdfExporter();
             exporter.setExporterInput(new SimpleExporterInput(print));
             exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
             exporter.exportReport();
		} catch (SQLException | JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
         //Connection conectado=conn.conectar();
         
         
        	 
        	
        	 
     
        
      
	 }
	 public void reporteCuponRecibo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("application/pdf");
         response.setHeader("Content-Disposition","inline; attachment;filename=\"ReporteCupon.pdf\";");
         String pdfRuta="";
         HttpSession session=request.getSession();
         pdfRuta=getServletContext().getRealPath("Reportes/testJasperUsuarioRecibo.jasper");
         String idCupon=request.getParameter("idCupon");
         String idUsuario=(String) session.getAttribute("idUsuario");
         Map parametros=new HashMap();
         try {
			Connection conn= ConeccionJasperModel.getConnection();
			JasperReport report= (JasperReport) JRLoader.loadObjectFromFile(pdfRuta);
			ServletOutputStream out= response.getOutputStream();
			 parametros.put("idUsuario", idUsuario);
			 parametros.put("CodigoCupon", idCupon);
	             //imprimir reporte
	             JasperPrint print= JasperFillManager.fillReport(report,parametros,conn);
	             JRPdfExporter exporter=new JRPdfExporter();
	             exporter.setExporterInput(new SimpleExporterInput(print));
	             exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
	             exporter.exportReport();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("No encuentra la ruta de Jasper");
		}
         
			
		
         
	 }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reporteCupon1(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		reporteCupon1(request,response);
	}

}
