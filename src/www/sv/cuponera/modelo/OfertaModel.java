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
}
