package www.sv.cuponera.beans;

public class PagoBean {

	private int  idPagos; 
	private String metodo; 
	private String codigo; 
	private String codigoVerificacion; 
	private int idUsuario;
	private String estado; 
	private String vencimiento; 
	public String getVencimiento() {
		return vencimiento;
	}
	public void setVencimiento(String vencimiento) {
		this.vencimiento = vencimiento;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getIdPagos() {
		return idPagos;
	}
	public void setIdPagos(int idPagos) {
		this.idPagos = idPagos;
	}
	public String getMetodo() {
		return metodo;
	}
	public void setMetodo(String metodo) {
		this.metodo = metodo;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getCodigoVerificacion() {
		return codigoVerificacion;
	}
	public void setCodigoVerificacion(String codigoVerificacion) {
		this.codigoVerificacion = codigoVerificacion;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	} 
	
}
