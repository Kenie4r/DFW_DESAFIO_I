package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import www.sv.cuponera.beans.UsuarioBeans;

public class ClienteRegistroModel extends Conection{
    public int insertarCliente(UsuarioBeans usuario) throws SQLException{
        try {
            Integer filas=0;
            String sql="insert into usuarios(Username, Nombre, Apellidos, Pass, Email, Roles_idRoles, Empresa_idEmpresa,DUI, passinit) VALUE (?,?,?,?,?,?,?,?,?) ";
            this.conectar();
            st=conexion.prepareStatement(sql);
            st.setString(1,usuario.getUsername());
            st.setString(2,usuario.getNombre());
            st.setString(3,usuario.getApellido());
            st.setString(4,usuario.getPassword());
            st.setString(5,usuario.geteMail());
            st.setString(6,usuario.getIdRol());
            st.setString(7,usuario.getIdEmpresa());
            st.setString(9,usuario.getPassInit());
            st.setString(8, usuario.getDUI());
            filas=st.executeUpdate();
            this.desconectar();
            return filas;
        }catch (SQLException ex) {
            Logger.getLogger(ClienteRegistroModel.class.getName()).log(Level.SEVERE, null, ex);
            this.desconectar();
            return 0;
        }
    }
    public boolean verificarLogin(UsuarioBeans usuarioBeans) throws SQLException{
        ArrayList info= new ArrayList<>();
        boolean existe=false;
        String sql="SELECT COUNT(*) FROM usuarios WHERE Email=? AND Pass=?";
        this.conectar();
        st=conexion.prepareStatement(sql);
        st.setString(1,usuarioBeans.geteMail());
        st.setString(2,usuarioBeans.getPassword());
        rs= st.executeQuery();
        if (rs.next()){
            existe=true;
            if(rs.getInt(1)>0) {
            	return true; 
            }

            return false;
        }else {
            existe=false;
            return existe;
        }
    }
    
    public boolean emailIsUsed(String email) throws SQLException {
    	boolean existe=false;
        String sql="select COUNT(*) from usuarios where Email=?";
        this.conectar();
        st=conexion.prepareStatement(sql);
        st.setString(1,email);
        rs= st.executeQuery();
        
        if (rs.next()){
            int countE = rs.getInt(1); 
            System.out.println("EMAIL . " + countE);

            if(countE>0) {
            	return true; 
            }

            return false;
        }else {
            return true;
        }
    }
    public boolean duiIsUsed(String email) throws SQLException {
    	boolean existe=false;
        String sql="select COUNT(*) from usuarios where DUI=?";
        this.conectar();
        st=conexion.prepareStatement(sql);
        st.setString(1,email);
        rs= st.executeQuery();
        
        if (rs.next()){
            int countE = rs.getInt(1); 
            System.out.println("DUI . " + countE);
            if(countE>0) {
            	return true; 
            }

            return false;
        }else {
            return true;
        }
    }
    public boolean usernameIsUsed(String email) throws SQLException {
    	boolean existe=false;
        String sql="select COUNT(*) from usuarios where Username=?";
        this.conectar();
        st=conexion.prepareStatement(sql);
        st.setString(1,email);
        rs= st.executeQuery();
        
        if (rs.next()){
            int countE = rs.getInt(1); 
            System.out.println("usuario." + countE);

            if(countE>0) {
            	return true; 
            }

            return false;
        }else {
            return true;
        }
    }
	public UsuarioBeans getUsuario(UsuarioBeans usuarioBeans) throws SQLException {
		UsuarioBeans info= new UsuarioBeans();
        boolean existe=false;
        String sql="SELECT * FROM usuarios WHERE Email=? AND Pass=?";
        this.conectar();
        st=conexion.prepareStatement(sql);
        st.setString(1,usuarioBeans.geteMail());
        st.setString(2,usuarioBeans.getPassword());
        rs= st.executeQuery();
        if (rs.next()){
            existe=true;
            info.setIdUsuario(rs.getString("idUsuario"));
            info.setUsername(rs.getString("Username"));
            info.setNombre(rs.getString("Nombre"));
            info.setApellido(rs.getString("Apellidos"));
            info.setIdRol(rs.getString("Roles_idRoles"));
            info.setIdEmpresa(rs.getString("Empresa_IdEmpresa"));
            info.setDUI(rs.getString("DUI"));
            info.setPassInit(rs.getString("passinit"));
            info.setPassword("");
            info.seteMail(rs.getString("Email"));
            return info;
        }else {
            existe=false;
            return null;
        }
	}
}
