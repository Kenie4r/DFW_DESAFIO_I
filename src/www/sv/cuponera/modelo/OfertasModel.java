package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import www.sv.cuponera.beans.*;


public class OfertasModel extends Conection{

	public List<OfertasBean> listarOfertas() throws SQLException{ //listar ofertas
		 try {
			 List<OfertasBean> lista = new ArrayList<>();
			 String sql = "CALL listarOfertas()";
			 this.conectar();
			 cs = conexion.prepareCall(sql);
			 rs = cs.executeQuery();
			 while(rs.next()){
			 OfertasBean oferta = new OfertasBean();
			 oferta.setIdOferta(rs.getInt("idOferta"));
			 oferta.setNombre(rs.getString("NombreOferta"));
			 oferta.setDescripcion(rs.getString("Descripicon"));
			 oferta.setPrecioRe(rs.getFloat("PrecioRegular"));
			 oferta.setPrecioOf(rs.getFloat("PrecioOfertado"));
			 oferta.setFechaInicio(rs.getString("inicio"));
			 oferta.setFechFin(rs.getString("Fin"));
			 oferta.setFechaLimite(rs.getString("fechaLimite"));
			 oferta.setCupones(rs.getInt("limite"));
			 oferta.setEstado(rs.getString("Estado"));
			 oferta.setEmpresaID(rs.getString("Empresa_IdEmpresa"));
			 oferta.setEmpresa(rs.getString("NombreEmpresa"));
			 oferta.setObservaciones(rs.getString("observaciones"));
		
			 lista.add(oferta);
			 }
			 this.desconectar();
			 return lista;
			 } catch (SQLException ex) {
			 Logger.getLogger(OfertasModel.class.getName()).log(Level.SEVERE, null, ex);
			 this.desconectar();
			 return null;
		 }
	}
	
	public int insertarOferta(OfertasBean oferta) throws SQLException{ //insertar oferta
		 try {
		 int filasAfectadas=0;
		 String sql = "CALL insertarOferta(?,?,?,?,?,?,?,?,?,?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setString(1, oferta.getNombre());
		 cs.setString(2, oferta.getDescripcion());
		 cs.setFloat(3, oferta.getPrecioRe());
		 cs.setFloat(4, oferta.getPrecioOf());
		 cs.setString(5, oferta.getFechaInicio());
		 cs.setString(6, oferta.getFechFin());
		 cs.setString(7, oferta.getFechaLimite());
		 cs.setInt(8, oferta.getCupones());
		 cs.setString(9, oferta.getEstado());
		 cs.setString(10, oferta.getEmpresaID());

		 filasAfectadas = cs.executeUpdate();
		 this.desconectar();
		 return filasAfectadas;
		 } catch (SQLException ex) {
		 Logger.getLogger(OfertasModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return 0;
		 }
	}
	 
	 public int eliminarOferta(int id) throws SQLException{ //eliminar oferta
		 try {
		 int filasAfectadas=0;
		 String sql = "CALL eliminarOferta(?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setInt(1, id);
		 filasAfectadas = cs.executeUpdate();
		 this.desconectar();
		 return filasAfectadas;
		 } catch (SQLException ex) {
		 Logger.getLogger(OfertasModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return 0;
		 }
	}
	 
	 public int modificarOferta(OfertasBean oferta) throws SQLException{ //modificar oferta
		 try {
		 int filasAfectadas=0;
		 String sql = "CALL modificarOferta(?,?,?,?,?,?,?,?,?,?,?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setInt(1, oferta.getIdOferta());
		 cs.setString(2, oferta.getNombre());
		 cs.setString(3, oferta.getDescripcion());
		 cs.setFloat(4, oferta.getPrecioRe());
		 cs.setFloat(5, oferta.getPrecioOf());
		 cs.setString(6, oferta.getFechaInicio());
		 cs.setString(7, oferta.getFechFin());
		 cs.setString(8, oferta.getFechaLimite());
		 cs.setInt(9, oferta.getCupones());
		 cs.setString(10, oferta.getEstado());
		 cs.setString(11, oferta.getEmpresaID());
		 
		 filasAfectadas = cs.executeUpdate();
		 this.desconectar();
		 return filasAfectadas;
		 } catch (SQLException ex) {
		 Logger.getLogger(OfertasModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return 0;
		 }
	}
	 
	 public OfertasBean obtenerOferta(int id) throws SQLException{ //obetener información de una oferta
		 try {
		 String sql = "CALL obtenerOferta(?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setInt(1, id);
		 rs = cs.executeQuery();
		 if(rs.next()){
		 OfertasBean oferta = new OfertasBean();
		 
		 oferta.setIdOferta(rs.getInt("idOferta"));
		 oferta.setNombre(rs.getString("NombreOferta"));
		 oferta.setDescripcion(rs.getString("Descripicon"));
		 oferta.setPrecioRe(rs.getFloat("PrecioRegular"));
		 oferta.setPrecioOf(rs.getFloat("PrecioOfertado"));
		 oferta.setFechaInicio(rs.getString("inicio"));
		 oferta.setFechFin(rs.getString("Fin"));
		 oferta.setFechaLimite(rs.getString("fechaLimite"));
		 oferta.setCupones(rs.getInt("limite"));
		 oferta.setEstado(rs.getString("Estado"));
		 oferta.setEmpresaID(rs.getString("Empresa_IdEmpresa"));
		 oferta.setEmpresa(rs.getString("NombreEmpresa"));
		 oferta.setObservaciones(rs.getString("observaciones"));
		 
		 this.desconectar();
		 return oferta;
		 }
		 this.desconectar();
		 return null;
		 } catch (SQLException ex) {
		 Logger.getLogger(OfertasModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return null;
		 }
	}
	 
	 public int aprobacion_rechazo(OfertasBean oferta) throws SQLException{ //aprobación o rechazo oferta
		 try {
		 int filasAfectadas=0;
		 String sql = "CALL aprobacion_rechazoOferta(?,?,?)";
		 this.conectar();
		 cs = conexion.prepareCall(sql);
		 cs.setInt(1, oferta.getIdOferta());
		 cs.setString(2, oferta.getObservaciones());
		 cs.setString(3, oferta.getEstado());
		 
		 filasAfectadas = cs.executeUpdate();
		 this.desconectar();
		 return filasAfectadas;
		 } catch (SQLException ex) {
		 Logger.getLogger(OfertasModel.class.getName()).log(Level.SEVERE, null, ex);
		 this.desconectar();
		 return 0;
		 }
	}
	 
	
}
