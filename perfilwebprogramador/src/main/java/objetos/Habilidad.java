package objetos;

public class Habilidad {
    private String nombre;
    private int porcentaje, id;

    public Habilidad(String nombre, int porcentaje, int id) {
        this.nombre = nombre.toUpperCase();
        this.porcentaje = porcentaje;
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre.toUpperCase();
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public int getId() {
        return id;
    }

    public String toTxtFormat() {
        return nombre + "|" + porcentaje + "|" + id;
    }

    public static Habilidad fromTxtFormat(String lineaHabilidad) {
        String[] parts = lineaHabilidad.split("\\|");
        if (parts.length != 3) {
            throw new IllegalArgumentException("Fórmato de linea no valido.");
        }
        Habilidad habilidad = new Habilidad(parts[0], Integer.parseInt(parts[1]), Integer.parseInt(parts[2]));
        return habilidad;
    }
}
