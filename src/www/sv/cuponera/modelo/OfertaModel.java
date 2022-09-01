package www.sv.cuponera.modelo;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import www.sv.cuponera.beans.OfertaBean;

public class OfertaModel extends Conection {
	public List<OfertaBean> listarOfertas() throws SQLException{
		try {
			List<OfertaBean> lista = new ArrayList<>(); 
			this.conectar(); 
			String sql = "SELECT * FROM oferta"; 
			st = conexion.prepareCall(sql); 
			rs = st.executeQuery(); 
			while ( rs.next()) {
				OfertaBean oferta = new OfertaBean(); 
			
				oferta.setIdOferta(rs.getInt("idOferta"));
				oferta.setNombreOferta(rs.getString("NombreOferta"));
				oferta.setDescripcion(rs.getString("Descripicon"));
				oferta.setPrecioRegular(rs.getFloat("PrecioRegular"));
				oferta.setPrecioOfertado(rs.getFloat("PrecioOfertado")); 
				oferta.setInicio(rs.getString("inicio"));
				oferta.setFechaFin(rs.getString("Fin"));
				oferta.setFechaLimite(rs.getString("fechaLimite"));
				lista.add(oferta); 
			}
			this.desconectar();
			return lista;
			
		}catch( SQLException ex) {
			this.desconectar();
			Logger.getLogger(OfertaModel.class.getName()).log(Level.SEVERE, null, ex );
			return null; 
		}
	}
	public List<OfertaBean> listarOfertasClientes() throws SQLException{
		try {
			List<OfertaBean> lista = new ArrayList<>(); 
			this.conectar(); 
			String sql = "SELECT * FROM `oferta`  INNER JOIN empresa ON empresa.idEmpresa = Empresa_IdEmpresa  WHERE inicio<= NOW() AND fin>=NOW() AND Estado = 'APROBADA' AND limite >0 ORDER BY idOferta DESC"; 
			st = conexion.prepareCall(sql); 
			rs = st.executeQuery(); 
			while ( rs.next()) {
				OfertaBean oferta = new OfertaBean(); 
			
				oferta.setIdOferta(rs.getInt("idOferta"));
				oferta.setNombreOferta(rs.getString("NombreOferta"));
				oferta.setDescripcion(rs.getString("Descripicon"));
				oferta.setPrecioRegular(rs.getFloat("PrecioRegular"));
				oferta.setPrecioOfertado(rs.getFloat("PrecioOfertado")); 
				oferta.setInicio(rs.getString("inicio"));
				oferta.setFechaFin(rs.getString("Fin"));
				oferta.setFechaLimite(rs.getString("fechaLimite"));
				oferta.setNombreEmpresa(rs.getString("NombreEmpresa"));

				lista.add(oferta); 
			}
			this.desconectar();
			return lista;
			
		}catch( SQLException ex) {
			this.desconectar();
			Logger.getLogger(OfertaModel.class.getName()).log(Level.SEVERE, null, ex );
			return null; 
		}
	}
	
	public List<OfertaBean> listarOfertasClientesByRubro(int rubro) throws SQLException{
		try {
			List<OfertaBean> lista = new ArrayList<>(); 
			this.conectar(); 
			String sql = "SELECT *, empresa.NombreEmpresa FROM `oferta` INNER JOIN empresa ON empresa.idEmpresa = Empresa_IdEmpresa  WHERE inicio<= NOW() AND fin>=NOW() AND Estado = 'APROBADA' AND limite >0  and Empresa_IdEmpresa IN ((SELECT idEmpresa FROM empresa WHERE Rubros_IdRubros = ?)) ORDER BY idOferta DESC"; 
			st = conexion.prepareCall(sql); 
			st.setInt(1, rubro);
			rs = st.executeQuery(); 
			while ( rs.next()) {
				OfertaBean oferta = new OfertaBean(); 
			
				oferta.setIdOferta(rs.getInt("idOferta"));
				oferta.setNombreOferta(rs.getString("NombreOferta"));
				oferta.setDescripcion(rs.getString("Descripicon"));
				oferta.setPrecioRegular(rs.getFloat("PrecioRegular"));
				oferta.setPrecioOfertado(rs.getFloat("PrecioOfertado")); 
				oferta.setInicio(rs.getString("inicio"));
				oferta.setFechaFin(rs.getString("Fin"));
				oferta.setFechaLimite(rs.getString("fechaLimite"));
				oferta.setNombreEmpresa(rs.getString("NombreEmpresa"));
				lista.add(oferta); 

			}
			this.desconectar();
			return lista;
			
		}catch( SQLException ex) {
			this.desconectar();
			Logger.getLogger(OfertaModel.class.getName()).log(Level.SEVERE, null, ex );
			return null; 
		}
	}
	public OfertaBean obtenerOferta(int codigo) throws SQLException{
		try {
			this.conectar(); 
			String sql = "SELECT * FROM oferta WHERE idOferta = ?"; 
			st = conexion.prepareCall(sql);
			st.setInt(1, codigo);
			rs = st.executeQuery(); 
			while ( rs.next()) {
				OfertaBean oferta = new OfertaBean(); 
			
				oferta.setIdOferta(rs.getInt("idOferta"));
				oferta.setNombreOferta(rs.getString("NombreOferta"));
				oferta.setDescripcion(rs.getString("Descripicon"));
				oferta.setPrecioRegular(rs.getFloat("PrecioRegular"));
				oferta.setPrecioOfertado(rs.getFloat("PrecioOfertado")); 
				oferta.setInicio(rs.getString("inicio"));
				oferta.setFechaFin(rs.getString("Fin"));
				oferta.setFechaLimite(rs.getString("fechaLimite"));
				this.desconectar();

				return oferta; 
			}
			this.desconectar();
			return null;
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(OfertaModel.class.getName()).log(Level.SEVERE, null, ex );
			return null; 
		}
	}
	
	
	public OfertaBean obtenerOfertayEmpresa(int codigo) throws SQLException{
		try {
			this.conectar(); 
			String sql = "SELECT * FROM oferta WHERE idOferta = ?"; 
			st = conexion.prepareCall(sql);
			st.setInt(1, codigo);
			rs = st.executeQuery(); 
			while ( rs.next()) {
				OfertaBean of = new OfertaBean(); 
				of.setIdOferta(rs.getInt("idOferta"));
				of.setNombreOferta(rs.getString("NombreOferta"));
				of.setLimite(rs.getInt("limite"));
				of.setNombreEmpresa(rs.getString("Empresa_IdEmpresa"));
				this.desconectar();

				return of; 
			}
			this.desconectar();
			return null;
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(OfertaModel.class.getName()).log(Level.SEVERE, null, ex );
			return null; 
		}
	}
	public List<OfertaBean> listadoOfertaCarrito(String inOption) throws SQLException{
		try {
			this.conectar(); 
			List<OfertaBean> lista = new ArrayList<>(); 

			String sql = "SELECT * FROM oferta WHERE idOferta = ( ?)"; 
			st = conexion.prepareCall(sql);
			st.setString(1, inOption);
			rs = st.executeQuery(); 
			while ( rs.next()) {
				OfertaBean oferta = new OfertaBean(); 
			
				oferta.setIdOferta(rs.getInt("idOferta"));
				oferta.setNombreOferta(rs.getString("NombreOferta"));
				oferta.setDescripcion(rs.getString("Descripicon"));
				oferta.setPrecioRegular(rs.getFloat("PrecioRegular"));
				oferta.setPrecioOfertado(rs.getFloat("PrecioOfertado")); 
				oferta.setInicio(rs.getString("inicio"));
				oferta.setFechaFin(rs.getString("Fin"));
				oferta.setFechaLimite(rs.getString("fechaLimite"));

				lista.add(oferta);
			}
			this.desconectar();
			return lista;
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(OfertaModel.class.getName()).log(Level.SEVERE, null, ex );
			return null; 
		}
	}
	public OfertaBean OfertaCarrito(String inOption) throws SQLException{
		try {
			this.conectar(); 

			String sql = "SELECT * FROM oferta WHERE idOferta =  ? AND inicio<=NOW() AND fin>=NOW() AND Estado = 'APROBADA'"; 
			st = conexion.prepareCall(sql);
			st.setString(1, inOption);
			rs = st.executeQuery(); 
			while ( rs.next()) {
				OfertaBean oferta = new OfertaBean(); 
			
				oferta.setIdOferta(rs.getInt("idOferta"));
				oferta.setNombreOferta(rs.getString("NombreOferta"));
				oferta.setDescripcion(rs.getString("Descripicon"));
				oferta.setPrecioRegular(rs.getFloat("PrecioRegular"));
				oferta.setPrecioOfertado(rs.getFloat("PrecioOfertado")); 
				oferta.setInicio(rs.getString("inicio"));
				oferta.setFechaFin(rs.getString("Fin"));
				oferta.setFechaLimite(rs.getString("fechaLimite"));
				this.desconectar();

				return oferta; 
			}
			this.desconectar();
			return null;
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(OfertaModel.class.getName()).log(Level.SEVERE, null, ex );
			return null; 
		}
	}
	
}
