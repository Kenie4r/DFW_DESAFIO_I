package Beans;

public class CuponBean {
    String UsuarioID,OfertaID_CodigoCupon,FechaCompra,Estado,FechaUso,Cantidad;

    public String getUsuarioID() {
        return UsuarioID;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String cantidad) {
        Cantidad = cantidad;
    }

    public void setUsuarioID(String usuarioID) {
        UsuarioID = usuarioID;
    }

    public String getOfertaID_CodigoCupon() {
        return OfertaID_CodigoCupon;
    }

    public void setOfertaID_CodigoCupon(String ofertaID_CodigoCupon) {
        OfertaID_CodigoCupon = ofertaID_CodigoCupon;
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
