package www.sv.cuponera.beans;

public class EmpresaBean {
	private String IdEmpresa;
	private String nombreEmpresa;
	private String Ubicacion;	
	private String Contacto;	
	private String Telefono;	
	private String Correo;	
	private float PorcentajeGanancias;
	private RubrosBean rubrosBean;
	private int Rubros_IdRubros;
	
	public EmpresaBean() {
		this.IdEmpresa = "";
		this.nombreEmpresa = "";
		this.Ubicacion = "";
		this.Contacto = "";
		this.Telefono = "";
		this.Correo = "";
		this.PorcentajeGanancias = 0;
		this.rubrosBean = null;
		this.Rubros_IdRubros = 0;
	}	

	public EmpresaBean(String IdEmpresa, String nombreEmpresa, String ubicacion,  String Contacto,  String Telefono,  String Correo, float porcentajeGanancias, RubrosBean rubrosBean, int rubros_IdRubros) {
		this.IdEmpresa = IdEmpresa;
		this.nombreEmpresa = nombreEmpresa;
		this.Ubicacion = ubicacion;
		this.Contacto = Contacto;
		this.Telefono = Telefono;
		this.Correo = Correo;
		this.PorcentajeGanancias = porcentajeGanancias;
		this.rubrosBean = rubrosBean;
		this.Rubros_IdRubros = rubros_IdRubros;
	}

	public String getIdEmpresa() {
		return IdEmpresa;
	}

	public void setIdEmpresa(String idEmpresa) {
		IdEmpresa = idEmpresa;
	}

	public String getNombreEmpresa() {
		return nombreEmpresa;
	}

	public void setNombreEmpresa(String nombreEmpresa) {
		this.nombreEmpresa = nombreEmpresa;
	}

	public String getUbicacion() {
		return Ubicacion;
	}

	public void setUbicacion(String ubicacion) {
		Ubicacion = ubicacion;
	}
	
	public String getContacto() {
		return Contacto;
	}

	public void setContacto(String contacto) {
		Contacto = contacto;
	}

	public String getTelefono() {
		return Telefono;
	}

	public void setTelefono(String telefono) {
		Telefono = telefono;
	}

	public String getCorreo() {
		return Correo;
	}

	public void setCorreo(String correo) {
		Correo = correo;
	}

	public float getPorcentajeGanancias() {
		return PorcentajeGanancias;
	}

	public void setPorcentajeGanancias(float porcentajeGanancias) {
		PorcentajeGanancias = porcentajeGanancias;
	}

	public RubrosBean getRubrosBean() {
		return rubrosBean;
	}

	public void setRubrosBean(RubrosBean rubrosBean) {
		this.rubrosBean = rubrosBean;
	}
	
	public int getRubros_IdRubros() {
		return Rubros_IdRubros;
	}

	public void setRubros_IdRubros(int rubros_IdRubros) {
		Rubros_IdRubros = rubros_IdRubros;
	}	

}
