package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import www.sv.cuponera.beans.*;

public class UsuariosModel extends Conection {
	
	public List<UsuarioBeans> listarUsuarios() throws SQLException{ //listar usuarios
		 try {
			 List<UsuarioBeans> lista = new ArrayList<>();
			 String sql = "CALL listarUsuarios()";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 rs = cs.executeQuery();
			 while(rs.next()){
			 UsuarioBeans usuario = new UsuarioBeans();
			 usuario.setIdUsuario(rs.getString("IdUsuario"));
			 usuario.setUsername(rs.getString("Username"));
			 usuario.setNombre(rs.getString("Nombre"));
			 usuario.setApellido(rs.getString("Apellidos"));
			 usuario.seteMail(rs.getString("Email"));
			 usuario.setIdRol(rs.getString("idRoles"));
			 usuario.setIdEmpresa(rs.getString("IdEmpresa"));
			 usuario.setEmpresa(rs.getString("NombreEmpresa"));
			 usuario.setDUI(rs.getString("DUI"));
		
			 lista.add(usuario);
			 }
			 this.desconectar();
			 return lista;
			 } catch (SQLException ex) {
			 Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, null, ex);
			 this.desconectar();
			 return null;
		 }
	}
	
	public List<UsuarioBeans> listarEmpreas() throws SQLException{ //listar usuarios
		 try {
			 List<UsuarioBeans> lista = new ArrayList<>();
			 String sql = "CALL listarEmpresas()";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 rs = cs.executeQuery();
			 while(rs.next()){
			 UsuarioBeans usuario = new UsuarioBeans();
			 usuario.setIdEmpresa(rs.getString("IdEmpresa"));
			 usuario.setEmpresa(rs.getString("NombreEmpresa"));
		
			 lista.add(usuario);
			 }
			 this.desconectar();
			 return lista;
			 } catch (SQLException ex) {
			 Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, null, ex);
			 this.desconectar();
			 return null;
		 }
	}
	
	public int eliminarUsuario(int id) throws SQLException{ //eliminar usuario
		 try {
		 int filasAfectadas=0;
		 String sql = "CALL eliminarUsuario(?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setInt(1, id);
		 filasAfectadas = cs.executeUpdate();
		 this.desconectar();
		 return filasAfectadas;
		 } catch (SQLException ex) {
		 Logger.getLogger(UsuariosModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return 0;
		 }
	}
}
