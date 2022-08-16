package www.sv.cuponera.beans;

public class OfertaBean {
	private int idOferta; 
	private String NombreOferta; 
	private String Descripcion; 
	private float PrecioRegular; 
	private float PrecioOfertado; 
	private String inicio; 
	private String fechaFin; 
	private String fechaLimite; 
	private int Limite;
	public OfertaBean(int idOferta, String nombreOferta, String descripcion, float precioRegular, float precioOfertado,
			String inicio, String fechaFin, String fechaLimite, int limite) {
		this.idOferta = idOferta;
		NombreOferta = nombreOferta;
		Descripcion = descripcion;
		PrecioRegular = precioRegular;
		PrecioOfertado = precioOfertado;
		this.inicio = inicio;
		this.fechaFin = fechaFin;
		this.fechaLimite = fechaLimite;
		Limite = limite;
	}
	public OfertaBean(int idOferta) {
		this.idOferta = idOferta;
	}
	public OfertaBean() {
	}
	public int getIdOferta() {
		return idOferta;
	}
	public void setIdOferta(int idOferta) {
		this.idOferta = idOferta;
	}
	public String getNombreOferta() {
		return NombreOferta;
	}
	public void setNombreOferta(String nombreOferta) {
		NombreOferta = nombreOferta;
	}
	public String getDescripcion() {
		return Descripcion;
	}
	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	public float getPrecioRegular() {
		return PrecioRegular;
	}
	public void setPrecioRegular(float precioRegular) {
		PrecioRegular = precioRegular;
	}
	public float getPrecioOfertado() {
		return PrecioOfertado;
	}
	public void setPrecioOfertado(float precioOfertado) {
		PrecioOfertado = precioOfertado;
	}
	public String getInicio() {
		return inicio;
	}
	public void setInicio(String inicio) {
		this.inicio = inicio;
	}
	public String getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}
	public String getFechaLimite() {
		return fechaLimite;
	}
	public void setFechaLimite(String fechaLimite) {
		this.fechaLimite = fechaLimite;
	} 
	
}
