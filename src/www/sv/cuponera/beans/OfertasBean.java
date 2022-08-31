package www.sv.cuponera.beans;

public class OfertasBean {
	
	String nombre, descripcion, fechaInicio, fechFin, fechaLimite, estado, empresaID, empresa, observaciones;
	int cupones, idOferta;
	float precioRe, precioOf;
	
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getEmpresa() {
		return empresa;
	}
	public void setEmpresa(String empresa) {
		this.empresa = empresa;
	}
	public int getIdOferta() {
		return idOferta;
	}
	public void setIdOferta(int idOferta) {
		this.idOferta = idOferta;
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
	public String getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public String getFechFin() {
		return fechFin;
	}
	public void setFechFin(String fechFin) {
		this.fechFin = fechFin;
	}
	public String getFechaLimite() {
		return fechaLimite;
	}
	public void setFechaLimite(String fechaLimite) {
		this.fechaLimite = fechaLimite;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getEmpresaID() {
		return empresaID;
	}
	public void setEmpresaID(String empresaID) {
		this.empresaID = empresaID;
	}
	public int getCupones() {
		return cupones;
	}
	public void setCupones(int cupones) {
		this.cupones = cupones;
	}
	public float getPrecioRe() {
		return precioRe;
	}
	public void setPrecioRe(float precioRe) {
		this.precioRe = precioRe;
	}
	public float getPrecioOf() {
		return precioOf;
	}
	public void setPrecioOf(float precioOf) {
		this.precioOf = precioOf;
	}

}
