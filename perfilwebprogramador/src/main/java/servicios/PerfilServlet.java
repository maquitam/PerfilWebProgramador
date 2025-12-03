package servicios;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import objetos.Perfil;
import repositorio.PerfilRepositorio;

public class PerfilServlet extends HttpServlet{
    PerfilRepositorio perfilRepositorio;

    @Override
    public void init() throws ServletException {
        try {
            perfilRepositorio = new PerfilRepositorio();
        } catch (IOException e) {
            throw new ServletException("No fue posible inicializar el repositorio de perfil.", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        Perfil perfil = null;

        try {
            perfil = perfilRepositorio.obtenerPerfil();
        } catch (Exception ex) {
            solicitud.setAttribute("mensajeError",
                    "Ocurrió un error al cargar los datos del perfil. Intenta nuevamente.");
        }

        if (perfil == null) {
            perfil = new Perfil(); // se crea con valores por defecto
        }

        solicitud.setAttribute("perfil", perfil);
        solicitud.getRequestDispatcher("/perfil.jsp").forward(solicitud, respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        solicitud.setCharacterEncoding("UTF-8");

        String nombres = solicitud.getParameter("nombres");
        String apellidos = solicitud.getParameter("apellidos");
        String edadTexto = solicitud.getParameter("edad");
        String correo = solicitud.getParameter("correo");
        String telefono = solicitud.getParameter("telefono");
        String ciudadNacimiento = solicitud.getParameter("ciudadNacimiento");
        String ciudadResidencia = solicitud.getParameter("ciudadResidencia");
        String biografia = solicitud.getParameter("biografia");
        String experiencia = solicitud.getParameter("experiencia");
        String enlaceGithub = solicitud.getParameter("enlaceGithub");
        String enlaceLinkedin = solicitud.getParameter("enlaceLinkedin");

        int edad = 0;
        if (edadTexto != null && !edadTexto.isBlank()) {
            try {
                edad = Integer.parseInt(edadTexto);
            } catch (NumberFormatException e) {
                solicitud.setAttribute("mensajeError", "La edad debe ser un número entero.");
            }
        }

        Perfil perfil = new Perfil( nombres, apellidos, edad, correo, telefono, ciudadNacimiento,
            ciudadResidencia, biografia, experiencia, enlaceGithub, enlaceLinkedin);

        try {
            validarPerfil(perfil);
            perfilRepositorio.guardarPerfil(perfil);
            solicitud.setAttribute("mensajeExito", "Perfil actualizado correctamente.");
        } catch (Exception ex) {
            if (solicitud.getAttribute("mensajeError") == null) {
                solicitud.setAttribute("mensajeError", ex.getMessage());
            }
        }

        solicitud.setAttribute("perfil", perfil);
        solicitud.getRequestDispatcher("/perfil.jsp").forward(solicitud, respuesta);
    }

    private void validarPerfil(Perfil perfil) throws Exception {

        if (perfil.getNombres() == null || perfil.getNombres().isBlank()) {
            throw new Exception("El nombre es obligatorio.");
        }

        if (perfil.getApellidos() == null || perfil.getApellidos().isBlank()) {
            throw new Exception("Los apellidos son obligatorios.");
        }

        if (perfil.getEdad() <= 0) {
            throw new Exception("La edad debe ser mayor que cero.");
        }

        if (perfil.getCorreo() == null || perfil.getCorreo().isBlank()) {
            throw new Exception("El correo es obligatorio.");
        }

        if (perfil.getTelefono() == null || perfil.getTelefono().isBlank()) {
            throw new Exception("El teléfono es obligatorio.");
        }

        if (perfil.getBiografia() == null || perfil.getBiografia().isBlank()) {
            throw new Exception("La biografía es obligatoria.");
        }

        if (perfil.getExperiencia() == null || perfil.getExperiencia().isBlank()) {
            throw new Exception("La experiencia es obligatoria.");
        }
    }

}
