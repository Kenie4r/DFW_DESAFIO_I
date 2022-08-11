package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import www.sv.cuponera.beans.RolBean;

public class RolModel  extends Conection{
    public List<RolBean>  listaRol() throws SQLException{
        String sql= "select * from roles";
        List<RolBean> lista= new ArrayList<>();
        this.conectar();
        st=conexion.prepareStatement(sql);
        rs=st.executeQuery();
        while (rs.next()){
            RolBean rolBean=new RolBean();
            rolBean.setIdRol(rs.getString("idRoles"));
            rolBean.setName(rs.getString("Nombre"));
            lista.add(rolBean);
        }
        this.desconectar();
        return lista;
    }
    public int insertarRol(RolBean rol) {
        try {
            int filasAfectadas=0;
            String sql = "call sp_insertRol(?)";
            this.conectar();
            cs=conexion.prepareCall(sql);
            cs.setString(1,rol.getNombre());
            filasAfectadas=cs.executeUpdate();
            this.desconectar();
            return filasAfectadas;
        } catch (SQLException e) {
            return 0;
        }
    }
    public void obtenerRol(RolBean rol){
        try {

            String sql="select Nombre from roles where idRoles=?";
            this.conectar();
            st=conexion.prepareStatement(sql);
            st.setString(1,rol.getIdRol());
            rs=st.executeQuery();
            if (rs.next()) {
                rol.setNombre( rs.getString("Nombre"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void eliminarRol(RolBean rol){
        try {

            String sql="delete from roles where idRoles=?";
            this.conectar();
            st=conexion.prepareStatement(sql);
            st.setString(1,rol.getIdRol());
            st.executeUpdate();
            this.desconectar();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int modificar(RolBean rol) {
        try {
            int filasAfectadas=0;
            String sql = "update roles set Nombre=? where idRoles=?";
            this.conectar();
            st=conexion.prepareStatement(sql);
            st.setString(1,rol.getNombre());
            st.setString(2,rol.getIdRol());
            filasAfectadas=st.executeUpdate();
            this.desconectar();
            return filasAfectadas;
        } catch (SQLException e) {
            return 0;
        }
    }
}
