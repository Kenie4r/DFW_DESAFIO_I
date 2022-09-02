package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import www.sv.cuponera.beans.PagoBean;
import www.sv.cuponera.utils.cesarCipher;
import org.apache.commons.lang3.StringUtils;

public class pagosModel extends Conection {

	public int insertarPago(PagoBean pago) throws SQLException {
		try
		{
			this.conectar();
			String sql = "INSERT INTO pagos(Metodo, Codigo, CV, Usuarios_idUsuario, FechaVencimiento) VALUES (?, ?,?,?, ?)"; 
			st = conexion.prepareStatement(sql); 
			String lsfour = StringUtils.right(pago.getCodigo(), 4); 
			st.setString(1, pago.getMetodo());
			st.setString(2, cesarCipher.ceasarCipher(pago.getCodigo(), 12) + lsfour);
			st.setString(3, cesarCipher.cipher(pago.getCodigoVerificacion()));
			st.setInt(4, pago.getIdUsuario()); 
			st.setString(5, pago.getVencimiento());
			int rs = st.executeUpdate(); 
			this.desconectar();
			
			
			return rs; 
			
			
			
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(pagosModel.class.getName()).log(Level.SEVERE , null, ex);
			return 0; 
		}
	}
	
	public int eliminarPago(int index) throws SQLException {
		try
		{
			this.conectar();
			String sql = "DELETE FROM pagos WHERE IdPagos = ?"; 
			st = conexion.prepareStatement(sql); 
			
			st.setInt(1, index);
	
			int rs = st.executeUpdate(); 
			this.desconectar();
			
			
			return rs; 
			
			
			
		}catch(SQLException ex) {
			this.desconectar();
			Logger.getLogger(pagosModel.class.getName()).log(Level.SEVERE , null, ex);
			return 0; 
		}
	}
	
	
	public List<PagoBean> listarPagosUser(String codigo) throws SQLException{
		try {
			List<PagoBean> lista = new ArrayList<>(); 
			this.conectar();
			String sql = "SELECT * FROM pagos WHERE Usuarios_idUsuario = ?";
			st = conexion.prepareStatement(sql); 
			st.setInt(1, Integer.parseInt(codigo));
			rs = st.executeQuery(); 
			while(rs.next()) {
				PagoBean pago = new PagoBean(); 
				pago.setIdPagos(Integer.parseInt(rs.getString("IdPagos")));
				pago.setMetodo(rs.getString("Metodo"));
				String codigoS = rs.getString("Codigo"); 
			
				String code  = ""; 
				for(int indx = 0; indx < 12 ; indx++) {
					code+="*"; 
				}
				code+= StringUtils.right(codigoS, 4); 
				pago.setCodigo(code); 
				pago.setCodigoVerificacion(rs.getString("CV"));
				pago.setIdUsuario(rs.getInt("Usuarios_idUsuario"));
				pago.setVencimiento(rs.getString("FechaVencimiento"));
				pago.setEstado(rs.getString("Estado"));
				lista.add(pago); 
			}
			
			this.desconectar();
			
			return lista; 
		}catch(SQLException ex) {
			
			this.desconectar();
			Logger.getLogger(pagosModel.class.getName()).log(Level.SEVERE , null, ex);
			return null; 
		}
	}
	public List<PagoBean> listarPagosUserA(String codigo) throws SQLException{
		try {
			List<PagoBean> lista = new ArrayList<>(); 
			this.conectar();
			String sql = "SELECT * FROM pagos WHERE Usuarios_idUsuario = ? AND Estado = 'ACTIVO'";
			st = conexion.prepareStatement(sql); 
			st.setInt(1, Integer.parseInt(codigo));
			rs = st.executeQuery(); 
			while(rs.next()) {
				PagoBean pago = new PagoBean(); 
				pago.setIdPagos(Integer.parseInt(rs.getString("IdPagos")));
				pago.setMetodo(rs.getString("Metodo"));
				String codigoS = rs.getString("Codigo"); 
			
				String code  = ""; 
				for(int indx = 0; indx < 12 ; indx++) {
					code+="*"; 
				}
				code+= StringUtils.right(codigoS, 4); 
				pago.setCodigo(code); 
				pago.setCodigoVerificacion(rs.getString("CV"));
				pago.setIdUsuario(rs.getInt("Usuarios_idUsuario"));
				pago.setVencimiento(rs.getString("FechaVencimiento"));
				pago.setEstado(rs.getString("Estado"));
				lista.add(pago); 
			}
			
			this.desconectar();
			
			return lista; 
		}catch(SQLException ex) {
			
			this.desconectar();
			Logger.getLogger(pagosModel.class.getName()).log(Level.SEVERE , null, ex);
			return null; 
		}
	}
	public PagoBean obtainPago(String codigo) throws SQLException {
		try {
			this.conectar();
			String sql = "SELECT * FROM pagos WHERE IdPagos = ?";
			st = conexion.prepareStatement(sql); 
			st.setInt(1, Integer.parseInt(codigo));
			rs = st.executeQuery(); 
			while(rs.next()) {
				PagoBean pago = new PagoBean(); 
				pago.setIdPagos(Integer.parseInt(rs.getString("IdPagos")));
				pago.setMetodo(rs.getString("Metodo"));
				String codigoS = rs.getString("Codigo"); 
				codigoS = cesarCipher.ceasarCipher(codigoS, -12);
				String code  = ""; 
				for(int indx = 0; indx < codigoS.length()-4; indx++) {
					code+="*"; 
				}
				code+= StringUtils.right(codigoS, 4); 
				pago.setCodigo(code); 
				pago.setCodigoVerificacion(rs.getString("CV"));
				pago.setIdUsuario(rs.getInt("Usuarios_idUsuario"));
				this.desconectar();
				return pago;
			}
			
			this.desconectar();
			
			return null ; 
		}catch(SQLException ex) {
			
			this.desconectar();
			Logger.getLogger(pagosModel.class.getName()).log(Level.SEVERE , null, ex);
			return null; 
		}
	}
}
