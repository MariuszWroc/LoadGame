/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loadscript;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mczarny
 */
public class FileService {
    private final static Logger fLogger = Logger.getLogger("FileService");

    public static FileWriter updateFile(String path) {
        File file = new File(path);
        FileWriter fileWriter = null;

        deleteFile(file);
        createFile(file);

        try {
            fileWriter = new FileWriter(file.getAbsoluteFile());
        } catch (IOException ex) {
            Logger.getLogger(GameOperation.class.getName()).log(Level.SEVERE, null, ex);
        }

        return fileWriter;
    }

    public static File createFile(File file) {
        fLogger.log(Level.INFO, "tworzenie pliku");
        
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException ex) {
                Logger.getLogger(GameOperation.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return file;
    }

    public static void readile(File file) {
        fLogger.log(Level.INFO, "wczytywanie pliku");
        
        if (!file.exists()) {
                if (file.canRead()) {
                    try {
                        FileReader fileReader = new FileReader(file.getAbsoluteFile());
                        BufferedReader reader = new BufferedReader(
                                fileReader);

                        String nextLine = reader.readLine();
                        while (nextLine != null) {
                            fLogger.log(Level.OFF, nextLine);
                        }
                    } catch (IOException ex) {
                        fLogger.log(Level.OFF, ex.getMessage());
                    }
                }
            }
    }

    public static void deleteFile(String path) {
        fLogger.log(Level.INFO, "usuwanie pliku");
        File file = new File(path);
        deleteFile(file);
    }

    public static File deleteFile(File file) {
        fLogger.log(Level.INFO, "usuwanie pliku");
        if (file.exists()) {
            boolean isDelete = file.delete();
            if (isDelete) {
                fLogger.log(Level.INFO, "usunięty");
            } else {
                fLogger.log(Level.INFO, "nie usunięty");
            }
        }

        return file;
    }
}
