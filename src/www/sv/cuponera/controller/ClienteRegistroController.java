package www.sv.cuponera.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import www.sv.cuponera.beans.UsuarioBeans;
import www.sv.cuponera.modelo.ClienteRegistroModel;
import www.sv.cuponera.modelo.randomCode;
import www.sv.cuponera.utils.Email;

@WebServlet(name = "ClienteRegistroController", urlPatterns = "/ClienteRegistroController")
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
            case "logout":
            	logout(request,response);
            	break; 
        }
    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		request.getSession().invalidate();
		response.sendRedirect("/LaCuponera");
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
        	List<String> errores = new ArrayList<>(); 
            UsuarioBeans usuarioBeans= new UsuarioBeans();
            usuarioBeans.setApellido(request.getParameter("apellido"));
            usuarioBeans.setNombre(request.getParameter("name"));
            usuarioBeans.seteMail(request.getParameter("email"));
            usuarioBeans.setIdEmpresa("NUL100");usuarioBeans.setIdRol("4");
            String passEncrypt= request.getParameter("password");
            String passEncrypt2= request.getParameter("password2");
            usuarioBeans.setUsername(request.getParameter("username"));
            usuarioBeans.setPassword(passEncrypt);
            usuarioBeans.setDUI(request.getParameter("dui"));
            String passInit = randomCode.getRandomString(5); 
            System.out.print(passInit);
            //hay que hacer las respectivas validaciones para el desarrollo xd
            if(!passEncrypt2.equals(passEncrypt)) {
            	errores.add("Las contraseñas no coinciden");
            }
            if(model.duiIsUsed(usuarioBeans.getDUI())) {
            	errores.add("El DUI ya es utilizado por otra persona");
            }
            
            if(model.emailIsUsed(usuarioBeans.geteMail())) {
            	errores.add("El correo ya ha sido utilizado por otra persona");
            }
            if(model.usernameIsUsed(usuarioBeans.getUsername())) {
            	errores.add("El nombre de usuario ya ha sido seleccionado por otra persona"); 
            }
            usuarioBeans.setPassInit(passInit);
            if (errores.size() ==0 && model.insertarCliente(usuarioBeans)>0){
            	System.out.print("se registro");
                request.setAttribute("exito","El registro ha sido completado, ¡Ya puedes iniciar sesión!");
                Email.tokenUsuario(usuarioBeans.geteMail(), passInit); 
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }else {
            	System.out.print("no se registro");

            	request.setAttribute("errores", errores);
                request.setAttribute("fracaso","no se pudo crear el usuario");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void login(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try {
            UsuarioBeans usuarioBeans= new UsuarioBeans();
            usuarioBeans.seteMail(request.getParameter("email")); 
            usuarioBeans.setPassword(request.getParameter("password"));
            if (model.verificarLogin(usuarioBeans)) {
            	usuarioBeans = model.getUsuario(usuarioBeans); 
                HttpSession session=request.getSession(true);
                session.setAttribute("nombre",usuarioBeans.getNombre());
                session.setAttribute("username",usuarioBeans.getUsername());
                session.setAttribute("apellido",usuarioBeans.getApellido());
                session.setAttribute("idRol",usuarioBeans.getIdRol());
                session.setAttribute("idUsuario",usuarioBeans.getIdUsuario());
                session.setAttribute("email",usuarioBeans.geteMail());
                session.setAttribute("idEmpresa",usuarioBeans.getIdEmpresa());
                session.setAttribute("passinit", usuarioBeans.getPassInit());
                session.setAttribute("DUI", usuarioBeans.getDUI());
                request.getRequestDispatcher("inicio.jsp").forward(request, response);

            }else{
            	List<String> errores = new ArrayList<>(); 
            	errores.add("Las credenciales son incorrectas"); 
            	request.setAttribute("errores", errores);

                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
