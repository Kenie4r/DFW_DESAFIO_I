package www.sv.cuponera.controller;

import www.sv.cuponera.beans.CuponBean;
import www.sv.cuponera.modelo.Conection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "shop.do", value = "/CarritoController")
public class CarritoController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
            String op=request.getParameter("op");
            switch (op){
                case "":
                    request.getRequestDispatcher("/Carrito/index.jsp").forward(request,response);
                    break;
                case "transation":
                    transaction(request,response);
                    //System.out.println("transaction");
                    break;
                case "obtener":
                    obtener(request,response);
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
        response.setContentType("text/html;charset=UTF-8");
        CuponBean carrito= new CuponBean();
        HttpSession session = request.getSession();
       carrito.setCantidad(request.getParameter("canProduct"));carrito.setOfertaID_CodigoCupon(request.getParameter("id"));
       


    }
    protected void listar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");


    }
}
