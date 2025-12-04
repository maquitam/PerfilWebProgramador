package servicios;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet("/config-banner")
@MultipartConfig
public class BannerConfigServlet extends HttpServlet {

    private static final String ATTR_TITULO = "banner.titulo";
    private static final String ATTR_SUBTITULO = "banner.subtitulo";
    private static final String ATTR_FOTO = "foto.ruta";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext ctx = getServletContext();

        String titulo = (String) ctx.getAttribute(ATTR_TITULO);
        String subtitulo = (String) ctx.getAttribute(ATTR_SUBTITULO);
        String fotoRuta = (String) ctx.getAttribute(ATTR_FOTO);

        if (titulo == null || titulo.trim().isEmpty()) {
            titulo = "Bienvenid@ al portafolio de perfiles profesionales";
        }
        if (subtitulo == null) {
            subtitulo = "Aquí podrás encontrar datos personales, datos de contacto, experiencia y enlaces profesionales de diversas personas.";
        }
        if (fotoRuta == null) {
            fotoRuta = "";
        }

        request.setAttribute("bannerTitulo", titulo);
        request.setAttribute("bannerSubtitulo", subtitulo);
        request.setAttribute("fotoRuta", fotoRuta);

        request.getRequestDispatcher("/perfil.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        ServletContext ctx = getServletContext();

        String titulo = request.getParameter("bannerTitulo");
        String subtitulo = request.getParameter("bannerSubtitulo");

        if (titulo != null) {
            ctx.setAttribute(ATTR_TITULO, titulo.trim());
        }
        if (subtitulo != null) {
            ctx.setAttribute(ATTR_SUBTITULO, subtitulo.trim());
        }

        Part fotoPart = request.getPart("fotoPerfil");
        if (fotoPart != null && fotoPart.getSize() > 0) {
            String fileName = Paths.get(fotoPart.getSubmittedFileName())
                                    .getFileName().toString();

            String uploadsRealPath = ctx.getRealPath("/uploads");
            if (uploadsRealPath != null) {
                Files.createDirectories(Paths.get(uploadsRealPath));

                Path destino = Paths.get(uploadsRealPath, fileName);
                try (InputStream in = fotoPart.getInputStream()) {
                    Files.copy(in, destino, StandardCopyOption.REPLACE_EXISTING);
                }

                String rutaRelativa = "uploads/" + fileName;
                ctx.setAttribute(ATTR_FOTO, rutaRelativa);
            }
        }

        response.sendRedirect(request.getContextPath() + "/config-banner");
    }
}
