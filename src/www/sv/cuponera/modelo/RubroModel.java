package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import www.sv.cuponera.beans.RubrosBean;

public class RubroModel  extends Conection{
	
	public List<RubrosBean> listaRubros() {
		String sql="select IdRubros, Nombre, Descripcion from rubros";
		List<RubrosBean> lista=new ArrayList<>();
		this.conectar();
		try {
			st=conexion.prepareStatement(sql);
			rs=st.executeQuery();
			while(rs.next()) {
				RubrosBean bean=new RubrosBean();
				bean.setId(rs.getString(1));
				bean.setNombre(rs.getString(2));
				bean.setDescripcion(rs.getString(2));
				lista.add(bean);
				
			}
			
			this.desconectar();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;
	}
		

}
