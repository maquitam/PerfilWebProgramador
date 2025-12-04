package bannerfoto;

import jakarta.servlet.ServletContext;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

public class BannerConfig {

    private static final String CONFIG_FILE_PATH = "/WEB-INF/config-banner.properties";

    public static Properties cargarConfig(ServletContext context) {
        Properties props = new Properties();

        try {
            String realPath = context.getRealPath(CONFIG_FILE_PATH);

            if (realPath == null) {
                String root = context.getRealPath("/");
                if (root != null) {
                    realPath = root + "WEB-INF/config-banner.properties";
                }
            }

            if (realPath == null) {
                System.err.println("No se pudo resolver la ruta física de " + CONFIG_FILE_PATH);
                props.setProperty("banner.titulo", "");
                props.setProperty("banner.subtitulo", "");
                props.setProperty("foto.ruta", "");
                return props;
            }

            File file = new File(realPath);

            if (file.exists()) {
                try (InputStream in = new FileInputStream(file)) {
                    props.load(in);
                }
            } else {
                props.setProperty("banner.titulo", "");
                props.setProperty("banner.subtitulo", "");
                props.setProperty("foto.ruta", "");
                guardarConfig(context, props); 
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return props;
    }

    public static void guardarConfig(ServletContext context, Properties props) {
        try {
            String realPath = context.getRealPath(CONFIG_FILE_PATH);

            if (realPath == null) {
                String root = context.getRealPath("/");
                if (root != null) {
                    realPath = root + "WEB-INF/config-banner.properties";
                }
            }

            if (realPath == null) {
                System.err.println("No se puede guardar config-banner.properties: getRealPath devolvió null.");
                return;
            }

            File file = new File(realPath);

            File parent = file.getParentFile();
            if (parent != null && !parent.exists()) {
                parent.mkdirs();
            }

            try (OutputStream out = new FileOutputStream(file)) {
                props.store(out, "Configuración del banner y la foto de perfil");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
