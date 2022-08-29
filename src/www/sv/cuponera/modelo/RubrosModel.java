package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import www.sv.cuponera.beans.*;


public class RubrosModel extends Conection{

	public List<RubrosBean> listarRubros() throws SQLException{ //listar rubros
		 try {
			 List<RubrosBean> lista = new ArrayList<>();
			 String sql = "CALL listarRubros()";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 rs = cs.executeQuery();
			 while(rs.next()){
			 RubrosBean rubro = new RubrosBean();
			 rubro.setIdRubro(rs.getInt("idRubros"));
			 rubro.setNombre(rs.getString("Nombre"));
			 rubro.setDescripcion(rs.getString("Descripcion"));
		
			 lista.add(rubro);
			 }
			 this.desconectar();
			 return lista;
			 } catch (SQLException ex) {
			 Logger.getLogger(RubrosModel.class.getName()).log(Level.SEVERE, null, ex);
			 this.desconectar();
			 return null;
		 }
	}
	
	public int insertarRubro(RubrosBean rubro) throws SQLException{ //insertar rubro
		 try {
		 int filasAfectadas=0;
		 String sql = "CALL insertarRubro(?,?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setString(1, rubro.getNombre());
		 cs.setString(2, rubro.getDescripcion());

		 filasAfectadas = cs.executeUpdate();
		 this.desconectar();
		 return filasAfectadas;
		 } catch (SQLException ex) {
		 Logger.getLogger(RubrosModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return 0;
		 }
	}
	 
	 public int eliminarRubro(int id) throws SQLException{ //eliminar rubro
		 try {
		 int filasAfectadas=0;
		 String sql = "CALL eliminarRubro(?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setInt(1, id);
		 filasAfectadas = cs.executeUpdate();
		 this.desconectar();
		 return filasAfectadas;
		 } catch (SQLException ex) {
		 Logger.getLogger(RubrosModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return 0;
		 }
	}
	 
	 public int modificarRubro(RubrosBean rubro) throws SQLException{ //modificar rubro
		 try {
		 int filasAfectadas=0;
		 String sql = "CALL modificarRubro(?,?,?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setInt(1, rubro.getIdRubro());
		 cs.setString(2, rubro.getNombre());
		 cs.setString(3, rubro.getDescripcion());
		 
		 filasAfectadas = cs.executeUpdate();
		 this.desconectar();
		 return filasAfectadas;
		 } catch (SQLException ex) {
		 Logger.getLogger(RubrosModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return 0;
		 }
	}
	 
	 public RubrosBean obtenerRubro(int id) throws SQLException{ //obetener información de un rubro
		 try {
		 String sql = "CALL obtenerRubro(?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setInt(1, id);
		 rs = cs.executeQuery();
		 if(rs.next()){
		 RubrosBean rubro = new RubrosBean();
		 rubro.setIdRubro(rs.getInt("idRubros"));
		 rubro.setNombre(rs.getString("Nombre"));
		 rubro.setDescripcion(rs.getString("Descripcion"));
		 this.desconectar();
		 return rubro;
		 }
		 this.desconectar();
		 return null;
		 } catch (SQLException ex) {
		 Logger.getLogger(RubrosModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return null;
		 }
	}
	 
	
}
