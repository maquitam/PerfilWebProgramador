package repositorio;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import objetos.Perfil;

public class PerfilRepositorio {
    private File file;
    public static final String PATH = "datos\\Perfil.txt";

    public PerfilRepositorio() throws IOException{
        file = new File(PATH);

        File parent = file.getParentFile();
        if (parent != null && !parent.exists()) {
            parent.mkdirs();
        }

        if (!file.exists()) {
            file.createNewFile();
        }
    }

    public Perfil obtenerPerfil() throws Exception{
        try (Scanner scanner = new Scanner(file, "UTF-8")) {

            if (!scanner.hasNextLine()) {
                return null; // no hay perfil guardado todavía
            }

            String linea = scanner.nextLine();
            Perfil perfil = Perfil.fromTxtFormat(linea);
            return perfil;

        } catch (Exception exe){
            throw new Exception(exe.getMessage());
        }
    }

    public boolean guardarPerfil(Perfil perfil) throws Exception{
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(PATH, false))){

            String contenido = perfil.toTxtFormat();
            bufferedWriter.write(contenido);
            bufferedWriter.newLine();
            return true;

        } catch (Exception exe){
            throw new Exception(exe.getMessage());
        }
    }

}
