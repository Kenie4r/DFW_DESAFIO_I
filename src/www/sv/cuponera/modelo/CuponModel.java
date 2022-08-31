package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import www.sv.cuponera.beans.CuponBean;

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
}
