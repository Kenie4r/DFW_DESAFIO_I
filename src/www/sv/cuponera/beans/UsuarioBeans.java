package www.sv.cuponera.beans;

public class UsuarioBeans {
    String idUsuario,Username,Nombre,Apellido,Password,IdRol,IdEmpresa,eMail;

    public String getIdUsuario() {
        return idUsuario;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String apellido) {
        Apellido = apellido;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getIdRol() {
        return IdRol;
    }

    public void setIdRol(String idRol) {
        IdRol = idRol;
    }

    public String getIdEmpresa() {
        return IdEmpresa;
    }

    public void setIdEmpresa(String idEmpresa) {
        IdEmpresa = idEmpresa;
    }
}
