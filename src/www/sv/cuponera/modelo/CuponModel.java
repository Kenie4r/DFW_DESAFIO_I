package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import www.sv.cuponera.beans.CuponBean;
import www.sv.cuponera.beans.OfertaBean;

public class CuponModel extends Conection{
	public int newCuponeForUser(CuponBean cupon) throws SQLException {
		try {
			int result = 0; 
			String sql = " CALL `crearCupon`(?, ?, ?)"; 
			this.conectar();
			st = conexion.prepareStatement(sql); 
			st.setInt(1, cupon.getUsuarioID());
			st.setInt(2, cupon.getOfertaID());
			st.setString(3, cupon.getCodigoCupon()); 
	
			result = st.executeUpdate(); 
			this .desconectar();
			return result; 
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(CuponModel.class.getName()).log(Level.SEVERE, null, ex );

			return -1 ;
		}
	}
	public List<CuponBean> listarCuponesForUser(String codigo) throws SQLException{
		try {
			List<CuponBean> lista = new ArrayList<>(); 
			String sql  = " CALL `obtenerCuponesUser`(?)"; 
			this.conectar();
			st = conexion.prepareStatement(sql); 
			st.setInt(1, Integer.parseInt(codigo));
			rs = st.executeQuery(); 
			while(rs.next()) {
				CuponBean cupon = new CuponBean(); 
				cupon.setCodigoCupon(rs.getString("CodigoCupon"));
				cupon.setFechaCompra(rs.getString("FechaCompra"));
				cupon.setEstado(rs.getString("Estado"));
				cupon.setFechaUso(rs.getString("fechUso"));
				OfertaBean of = new OfertaBean(); 
				of.setNombreEmpresa(rs.getString("NombreEmpresa"));
				of.setNombreOferta(rs.getString("NombreOferta"));
				of.setDescripcion(rs.getString("Descripicon"));
				of.setFechaLimite(rs.getString("fechaLimite"));
				cupon.setOfertaD(of);
				lista.add(cupon);
			}
			
			this.desconectar();
			return lista; 
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(CuponModel.class.getName()).log(Level.SEVERE, null, ex );

			return null ;
		}
	}
	public List<CuponBean> listarCuponesForUserF(String codigo, String filter) throws SQLException{
		try {
			List<CuponBean> lista = new ArrayList<>(); 
			String sql  = " CALL `obtenerCuponesUserF`(?, 2)"; 
			this.conectar();
			st = conexion.prepareStatement(sql); 
			st.setInt(1, Integer.parseInt(codigo));
			st.setString(2, filter);
			rs = st.executeQuery(); 
			while(rs.next()) {
				CuponBean cupon = new CuponBean(); 
				cupon.setCodigoCupon(rs.getString("CodigoCupon"));
				cupon.setFechaCompra(rs.getString("FechaCompra"));
				cupon.setEstado(rs.getString("Estado"));
				cupon.setFechaUso(rs.getString("fechUso"));
				OfertaBean of = new OfertaBean(); 
				of.setNombreEmpresa(rs.getString("NombreEmpresa"));
				of.setNombreOferta(rs.getString("NombreOferta"));
				of.setDescripcion(rs.getString("Descripicon"));
				of.setFechaLimite(rs.getString("fechaLimite"));
				cupon.setOfertaD(of);
				lista.add(cupon);
			}
			
			this.desconectar();
			return lista; 
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(CuponModel.class.getName()).log(Level.SEVERE, null, ex );

			return null ;
		}
	}
}
