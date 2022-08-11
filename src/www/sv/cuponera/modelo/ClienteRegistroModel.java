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
            String sql="insert into usuarios(username, nombre, apellidos, pass, `e-mail`, roles_idroles, empresa_idempresa) VALUE (?,?,?,?,?,?,?) ";
            this.conectar();
            st=conexion.prepareStatement(sql);
            st.setString(1,usuario.getUsername());
            st.setString(2,usuario.getNombre());
            st.setString(3,usuario.getApellido());
            st.setString(4,usuario.getPassword());
            st.setString(5,usuario.geteMail());
            st.setString(6,usuario.getIdRol());
            st.setString(7,usuario.getIdEmpresa());
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
        String sql="select * from usuarios where `email`=? and Pass=?";
        this.conectar();
        st=conexion.prepareStatement(sql);
        st.setString(1,usuarioBeans.geteMail());
        st.setString(2,usuarioBeans.getPassword());
        rs= st.executeQuery();
        if (rs.next()){
            existe=true;
            usuarioBeans.setUsername(rs.getString("Username"));
            usuarioBeans.setIdUsuario(rs.getString("idUsuario"));
            usuarioBeans.setIdRol(rs.getString("Roles_idRoles"));
            usuarioBeans.setNombre(rs.getString("Nombre"));
            usuarioBeans.setApellido(rs.getString("Apellidos"));
            usuarioBeans.setIdEmpresa(rs.getString("Empresa_IdEmpresa"));

            return existe;
        }else {
            existe=false;
            return existe;
        }
    }
}
