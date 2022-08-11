package Controller;

import Beans.RolBean;
import Beans.UsuarioBeans;
import Model.RolModel;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RolController", value = "/RolController")
public class RolController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String op=request.getParameter("op");
        if (op == null) {
            listarRol(request,response);
        }
        switch (op){
            case "insertar":
                insertarRol(request,response);
                break;
            case "obtener":
                obtenerRol(request,response);
                break;
            case "modificar":
                modificarRol(request,response);
                break;
            case "listar":
                listarRol(request,response);
                break;
            case "eliminar":
                eliminarRol(request,response);
                break;

        }
    }
    RolModel model=new RolModel();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);

    }
    public void listarRol(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try {
            request.setAttribute("listaRol",model.listaRol());
            request.setAttribute("test","testeo del la funcion");
            request.getRequestDispatcher("/Roles/index.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void insertarRol(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        RolBean rolBean= new RolBean();
        rolBean.setNombre(request.getParameter("name"));
        if (model.insertarRol(rolBean)>0){
            request.setAttribute("exito","Se logro crear el rol");
            listarRol(request,response);

        }else {
            request.setAttribute("fracaso","Se logro crear el rol");
            request.getRequestDispatcher("/Roles/crearRol.jsp").forward(request,response);


        }
    }
    public void modificarRol(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        RolBean rolBean= new RolBean();
        rolBean.setNombre(request.getParameter("name"));
        rolBean.setIdRol(request.getParameter("id"));
        if (model.modificar(rolBean)>0){
            request.setAttribute("exito","Se logro modificar el rol");
            listarRol(request,response);
        }else {
            request.setAttribute("fracaso","No se pudo modificar");
            request.getRequestDispatcher("/Roles/modificarRol.jsp").forward(request,response);


        }
    }
    public void eliminarRol(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        RolBean rolBean= new RolBean();
        rolBean.setIdRol(request.getParameter("id"));
        model.eliminarRol(rolBean);
        request.setAttribute("exito","Se logro eliminar el rol");
        listarRol(request,response);

    }
    public void obtenerRol(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String id=request.getParameter("id");
        RolBean rolBean= new RolBean();
        rolBean.setIdRol(id);
        model.obtenerRol(rolBean);
        request.setAttribute("name",rolBean.getNombre());
        request.setAttribute("id",id);
        request.getRequestDispatcher("/Roles/modificarRol.jsp").forward(request,response);
    }
}
