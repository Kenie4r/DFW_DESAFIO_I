package www.sv.cuponera.modelo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import www.sv.cuponera.beans.EmpresaBean;

public class EmpresaModel  extends Conection{
		
	
	
	public List<EmpresaBean> listaEmpresa() {
		String sql="SELECT e.IdEmpresa,e.NombreEmpresa,e.Ubicacion,e.PorcentajeGanancias,r.Nombre FROM empresa e INNER JOIN rubros r ON e.Rubros_IdRubros=r.IdRubros";
		List<EmpresaBean> lista=new ArrayList<>();
		
		this.conectar();
		try {
			st=conexion.prepareStatement(sql);
			rs=st.executeQuery();
			while(rs.next()) {
				EmpresaBean bean=new EmpresaBean();
				bean.setIdEmpresa(rs.getString(1));
				bean.setNombreEmpresa(rs.getString(2));
				bean.setUbicacion(rs.getString(3));
				bean.setPorcentajeGanancias(rs.getString(4));
				bean.setIdRubros(rs.getString(5));
				lista.add(bean);
				
			}
			this.desconectar();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lista;
	}
	public int insertarEmpresa(EmpresaBean empresa) {
		String sql="INSERT INTO empresa(IdEmpresa, NombreEmpresa, Ubicacion, PorcentajeGanancias, Rubros_IdRubros) VALUES (?,?,?,?,?)";
		int fila=0;
		this.conectar();
		try {
			st=conexion.prepareStatement(sql);
			st.setString(1, empresa.getIdEmpresa());
			st.setString(2, empresa.getNombreEmpresa());
			st.setString(3, empresa.getUbicacion());
			st.setString(4, empresa.getPorcentajeGanancias());
			st.setString(5, empresa.getIdRubros());
			fila=st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fila;
		
	}
	public int modificarEmpresa(EmpresaBean empresa) {
		String sql="UPDATE empresa SET NombreEmpresa=?,Ubicacion=?,PorcentajeGanancias=?,Rubros_IdRubros=? WHERE IdEmpresa=?";
		int fila=0;
		try {
			this.conectar();
			st=conexion.prepareStatement(sql);
			st.setString(1, empresa.getNombreEmpresa());
			st.setString(2, empresa.getUbicacion());
			st.setString(3, empresa.getPorcentajeGanancias());
			st.setString(4, empresa.getIdRubros());
			st.setString(5, empresa.getIdEmpresa());
			fila=st.executeUpdate();
			 this.desconectar();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fila;
	}
	  public void obtenerEmpresa(EmpresaBean empresa){
	        try {

	            String sql="SELECT IdEmpresa, NombreEmpresa, Ubicacion, PorcentajeGanancias, Rubros_IdRubros FROM empresa WHERE IdEmpresa=?";
	            this.conectar();
	            st=conexion.prepareStatement(sql);
	            st.setString(1,empresa.getIdEmpresa());
	            rs=st.executeQuery();
	            if (rs.next()) {
	            	empresa.setNombreEmpresa(rs.getString(2));
	            	empresa.setUbicacion(rs.getString(3));
	            	empresa.setPorcentajeGanancias(rs.getString(4));
	            	empresa.setIdRubros(rs.getString(5));
	            	this.desconectar();
	            }

	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	    }
	  public void eliminarEmpresa(EmpresaBean empresa) {
		  String sql="delete FROM empresa WHERE IdEmpresa=?";
		 
          try {
        	  this.conectar();
    		  st=conexion.prepareStatement(sql);
			st.setString(1,empresa.getIdEmpresa());
			st.executeUpdate();
			this.desconectar();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
}
