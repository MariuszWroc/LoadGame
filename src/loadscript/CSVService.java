/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loadscript;

import com.opencsv.CSVReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mczarny
 */
public class CSVService {
    private final static Logger fLogger = Logger.getLogger("FileService");

    public static void readCSV(String csvPath) {
        try {
            CSVReader csvReader = null;
            String[] row = null;

            try {
                csvReader = new CSVReader(new FileReader(csvPath));
            } catch (FileNotFoundException ex) {
                fLogger.log(Level.OFF, ex.getMessage());
            }

            try {
                while ((row = csvReader.readNext()) != null) {
                    System.out.println(row[0]
                            + " # " + row[1]
                            + " #  " + row[2]);
                }
            } catch (IOException ex) {
                fLogger.log(Level.OFF, ex.getMessage());
            }
            csvReader.close();
        } catch (IOException ex) {
            fLogger.log(Level.OFF, ex.getMessage());
        }
    }

    public static void createCSV() {
    }
    
    public static void deleteCSV() {
    }

    public static void updateCSV() {
    }
}