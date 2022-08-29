package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import  www.sv.cuponera.beans.EmpresaBean;
import  www.sv.cuponera.beans.RubrosBean;

public class EmpresaModel extends Conection{
	
	
	 public List<EmpresaBean> listarEmpresas() throws SQLException{
		 try {
			 List<EmpresaBean> lista = new ArrayList<>();
			 String sql = "CALL pa_listarEmpresas()";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 rs = cs.executeQuery();
			 while(rs.next()){
				 EmpresaBean Empresa = new EmpresaBean();
				 Empresa.setIdEmpresa(rs.getString("IdEmpresa"));
				 Empresa.setNombreEmpresa(rs.getString("NombreEmpresa"));
				 Empresa.setUbicacion(rs.getString("Ubicacion"));
				 Empresa.setContacto(rs.getString("Contacto"));
				 Empresa.setTelefono(rs.getString("Telefono"));
				 Empresa.setCorreo(rs.getString("Correo"));
				 Empresa.setPorcentajeGanancias(rs.getFloat("PorcentajeGanancias"));

				 lista.add(Empresa);
			 }
			 this.desconectar();
			 return lista;
		 } catch (SQLException ex) {
			 Logger.getLogger(EmpresaModel.class.getName()).log(Level.SEVERE, null, ex);
			 this.desconectar();
			 return null;
		 }
	 }
	 
	 public int insertarEmpresa(EmpresaBean Empresa) throws SQLException{
		 try {
			 int filasAfectadas =0;
			 String sql = "CALL pa_insertarEmpresa(?,?,?,?,?,?,?,1)";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 cs.setString(1, Empresa.getIdEmpresa());
			 cs.setString(2, Empresa.getNombreEmpresa());
			 cs.setString(3, Empresa.getUbicacion());
			 cs.setString(4, Empresa.getContacto());
			 cs.setString(5, Empresa.getTelefono());
			 cs.setString(6, Empresa.getCorreo());
			 cs.setFloat(7, Empresa.getPorcentajeGanancias());			 	
			 //cs.setInt(8, Empresa.getRubros_IdRubros());
			 filasAfectadas = cs.executeUpdate();
			 this.desconectar();
			 return filasAfectadas;
		 } catch (SQLException ex) {
			 Logger.getLogger(EmpresaModel.class.getName()).log(Level.SEVERE, null, ex);
			 this.desconectar();
			 return 0;
		 }
	 }
	 
	 public int eliminarEmpresa(String ID) throws SQLException{
		 try {
			 int filasAfectadas=0;
			 String sql = "CALL pa_eliminarEmpresa(?)";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 cs.setString(1, ID);
			 filasAfectadas = cs.executeUpdate();
			 this.desconectar();
			 return filasAfectadas;
		 } catch (SQLException ex) {
			 Logger.getLogger(EmpresaModel.class.getName()).log(Level.SEVERE, null, ex);
			 this.desconectar();
			 return 0;
		 }
	 
	 }
	 
	 public EmpresaBean obtenerEmpresa(String ID) throws SQLException{
		 try {
			 String sql = "CALL pa_obtenerEmpresa(?)";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 cs.setString(1, ID);
			 rs = cs.executeQuery();
			 if(rs.next()){
				 EmpresaBean Empresa = new EmpresaBean();
				 Empresa.setIdEmpresa(rs.getString("IdEmpresa"));
				 Empresa.setNombreEmpresa(rs.getString("NombreEmpresa"));
				 Empresa.setUbicacion(rs.getString("Ubicacion"));
				 Empresa.setContacto(rs.getString("Contacto"));
				 Empresa.setTelefono(rs.getString("Telefono"));
				 Empresa.setCorreo(rs.getString("Correo"));
				 Empresa.setPorcentajeGanancias(rs.getFloat("PorcentajeGanancias"));
				 //Empresa.setRubrosBean(new RubrosBean(rs.getInt("Rubros_IdRubros")));				 						 
				 this.desconectar();
				 return Empresa;
			 }
			 	this.desconectar();
			 	return null;
		 	} catch (SQLException ex) {
		 		Logger.getLogger(EmpresaModel.class.getName()).log(Level.SEVERE, null, ex);
		 		this.desconectar();
		 		return null;
		 	}
	 }
	 
	 public int editarEmpresa(EmpresaBean Empresa) throws SQLException{
		 try {
			 int filasAfectadas =0;
			 String sql = "CALL pa_modificarEmpresa(?,?,?,?,?,?,?,1)";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 cs = conexion.prepareCall(sql);
			 cs.setString(1, Empresa.getIdEmpresa());
			 cs.setString(2, Empresa.getNombreEmpresa());
			 cs.setString(3, Empresa.getUbicacion());
			 cs.setString(4, Empresa.getContacto());
			 cs.setString(5, Empresa.getTelefono());
			 cs.setString(6,Empresa.getCorreo());
			 cs.setFloat(7, Empresa.getPorcentajeGanancias());
			 //cs.setInt(8, Empresa.getRubros_IdRubros());			 
			 filasAfectadas = cs.executeUpdate();			 
			 this.desconectar();
			 return filasAfectadas;			 	
		 	} catch (SQLException ex) {
		 		Logger.getLogger(EmpresaModel.class.getName()).log(Level.SEVERE, null, ex);
		 		this.desconectar();
		 		return 0;
		 	}
	 }
}
