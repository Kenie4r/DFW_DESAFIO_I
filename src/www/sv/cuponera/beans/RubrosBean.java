package www.sv.cuponera.beans;

public class RubrosBean {
	String nombre, descripcion;
	int idRubro;

	public RubrosBean() {
		this.nombre = "";
		
	}
	
	public RubrosBean(String nombre) {
		this.nombre = nombre;
		
	}
	public int getIdRubro() {
		return idRubro;
	}

	public void setIdRubro(int idRubro) {
		this.idRubro = idRubro;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
