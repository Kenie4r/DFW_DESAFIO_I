package www.sv.cuponera.beans;

public class CuponBean {
    String FechaCompra,Estado,FechaUso, CodigoCupon; 
    int UsuarioID,OfertaID; 
 

    public int getUsuarioID() {
		return UsuarioID;
	}

	public void setUsuarioID(int usuarioID) {
		UsuarioID = usuarioID;
	}



	public String getCodigoCupon() {
		return CodigoCupon;
	}

	public void setCodigoCupon(String codigoCupon) {
		CodigoCupon = codigoCupon;
	}

	public int getOfertaID() {
		return OfertaID;
	}

	public void setOfertaID(int ofertaID) {
		OfertaID = ofertaID;
	}

	public String getFechaCompra() {
        return FechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        FechaCompra = fechaCompra;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        Estado = estado;
    }

    public String getFechaUso() {
        return FechaUso;
    }

    public void setFechaUso(String fechaUso) {
        FechaUso = fechaUso;
    }
}
