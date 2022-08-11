package www.sv.cuponera.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import www.sv.cuponera.beans.UsuarioBeans;
import www.sv.cuponera.modelo.ClienteRegistroModel;

@WebServlet(name = "ClienteRegistroController", value = "/ClienteRegistroController")
public class ClienteRegistroController extends HttpServlet {
    ClienteRegistroModel model=new ClienteRegistroModel();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String op=request.getParameter("op");
        switch (op){
            case "register":
                registrar(request,response);
                break;
            case "login":
                login(request,response);
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
    public void registrar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try {
            UsuarioBeans usuarioBeans= new UsuarioBeans();
            usuarioBeans.setApellido(request.getParameter("apellido"));usuarioBeans.setNombre(request.getParameter("name"));
            usuarioBeans.seteMail(request.getParameter("email"));usuarioBeans.setIdEmpresa("2");usuarioBeans.setIdRol("4");
            String passEncrypt= request.getParameter("password");usuarioBeans.setUsername(request.getParameter("username"));
            usuarioBeans.setPassword(passEncrypt);
            if (model.insertarCliente(usuarioBeans)>0){
                request.setAttribute("exito","Ingrese sus credenciales");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }else {
                request.setAttribute("fracaso","no se pudo crear el usuario");
                request.getRequestDispatcher("register.jsp").forward(request,response);
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void login(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try {
            UsuarioBeans usuarioBeans= new UsuarioBeans();
            usuarioBeans.seteMail(request.getParameter("email")); usuarioBeans.setPassword(request.getParameter("password"));
            if (model.verificarLogin(usuarioBeans) == true) {
                HttpSession session=request.getSession();
                session.setAttribute("nombre",usuarioBeans.getNombre());
                session.setAttribute("username",usuarioBeans.getUsername());
                session.setAttribute("apellido",usuarioBeans.getApellido());
                session.setAttribute("idRol",usuarioBeans.getIdRol());
                session.setAttribute("idUsuario",usuarioBeans.getIdUsuario());
                session.setAttribute("email",usuarioBeans.geteMail());
                session.setAttribute("idEmpresa",usuarioBeans.getIdEmpresa());
                response.sendRedirect("index.jsp");

            }else{
                request.setAttribute("fracaso","Las credenciales estan equivocadas intente de nuevo");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
