package objetos;

public class Perfil {

    private String nombres;
    private String apellidos;
    private int edad;
    private String telefono;
    private String correo;
    private String ciudadNacimiento;
    private String ciudadResidencia;
    private String biografia;
    private String experiencia;
    private String enlaceGithub;
    private String enlaceLinkedin;

    public Perfil(){
        this("", "", 0, "", "", "", "", "", "", "", "");
    }

    public Perfil(String nombres, String apellidos, int edad, String correo, String telefono,
        String ciudadNacimiento, String ciudadResidencia, String biografia, String experiencia, String enlaceGithub, String enlaceLinkedin){

        this.nombres = nombres;
        this.apellidos = apellidos;
        this.edad = edad;
        this.correo = correo;
        this.telefono = telefono;
        this.ciudadNacimiento = ciudadNacimiento;
        this.ciudadResidencia = ciudadResidencia;
        this.biografia = biografia;
        this.experiencia = experiencia;
        this.enlaceGithub = enlaceGithub;
        this.enlaceLinkedin = enlaceLinkedin;

    }

    public String getNombres(){
        return nombres; 
    }
    public void setNombres(String nombres){ 
        this.nombres = nombres; 
    }

    public String getApellidos(){ 
        return apellidos;
    }
    public void setApellidos(String apellidos){ 
        this.apellidos = apellidos; 
    }

    public int getEdad(){ 
        return edad; 
    }
    public void setEdad(int edad){ 
        this.edad = edad; 
    }

    public String getCorreo(){ 
        return correo; 
    }
    public void setCorreo(String correo){ 
        this.correo = correo; 
    }

    public String getTelefono(){ 
        return telefono;
    }
    public void setTelefono(String telefono){ 
        this.telefono = telefono; 
    }

    public String getCiudadNacimiento(){ 
        return ciudadNacimiento; 
    }
    public void setCiudadNacimiento(String ciudadNacimiento){ 
        this.ciudadNacimiento = ciudadNacimiento; 
    }

    public String getCiudadResidencia(){ 
        return ciudadResidencia; 
    }
    public void setCiudadResidencia(String ciudadResidencia){ 
        this.ciudadResidencia = ciudadResidencia; 
    }

    public String getBiografia(){ 
        return biografia; 
    }
    public void setBiografia(String biografia){ 
        this.biografia = biografia; 
    }

    public String getExperiencia(){ 
        return experiencia; 
    }
    public void setExperiencia(String experiencia){ 
        this.experiencia = experiencia; 
    }

    public String getEnlaceGithub(){ 
        return enlaceGithub; 
    }
    public void setEnlaceGithub(String enlaceGithub){ 
        this.enlaceGithub = enlaceGithub; 
    }

    public String getEnlaceLinkedin(){ 
        return enlaceLinkedin; 
    }
    public void setEnlaceLinkedin(String enlaceLinkedin){ 
        this.enlaceLinkedin = enlaceLinkedin; 
    }

    public String toTxtFormat(){
       return getNombres() + "|" + getApellidos() + "|" + getEdad() + "|" + getCorreo() + "|" + getTelefono() + "|" + getCiudadNacimiento() + "|" 
       + getCiudadResidencia() + "|" + getBiografia() + "|" + getExperiencia() + "|" + getEnlaceGithub() + "|" + getEnlaceLinkedin();
    }

    public static Perfil fromTxtFormat(String lineaPerfil) {
        String[] parts = lineaPerfil.split("\\|");
        if (parts.length != 11) {
            throw new IllegalArgumentException("Formato de línea de perfil no válido.");
        }
        int edad = Integer.parseInt(parts[2]);
        Perfil perfil = new Perfil( parts[0], parts[1], edad, parts[3], parts[4], parts[5], parts[6], parts[7], parts[8], parts[9], parts[10]);
        return perfil;
    }
}
