/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loadscript;

import com.ibatis.common.jdbc.ScriptRunner;
import com.opencsv.CSVReader;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mczarny
 */
public class GameOperation {
    private final static String PATH = "/home/mczarny/NetBeansProjects/LoadScript/src/script/";
    private final static Logger fLogger = Logger.getLogger("GameOperation");
    
    public static void saveGame() {
        storeGameAsCSV();
        insertRecordInDB();
    }

    public static void loadGame() {
        checkSavedGames("jacek");
        convertCSVIntoSQLScript();
        runScriptFromFile(PATH + "user/insertData.sql");
    }
    
    public static void createGame() {
        copyAndReplace(PATH + "original/makeSlaskDB.sql", PATH + "user/makeSlaskDB.sql", "databaseInstance", generateInstanceName());
//                copyAndReplace(PATH + "original/makeMainDB.sql", PATH + "user/makeMainDB.sql", "databaseInstance", "nowaInstancja2");
        copyAndReplace(PATH + "original/insertData.sql", PATH + "user/insertData.sql", "databaseInstance", generateInstanceName());
        runScriptFromFile(PATH + "user/makeSlaskDB.sql");
//                openFile(PATH + "user/makeMainDB.sql");
        runScriptFromFile(PATH + "user/insertData.sql");
    }

    private static String generateInstanceName() {
        return "nowaInstancja";
    }
    
    public static void deleteGame() {
        deleteGameInstance();
        deleteCSVFile();
        deleteRecordFromDB("mariusz");
    }
    
    public static void joinToGame() {
        checkSavedGames("mariusz");
    }
        
    private static void copyAndReplace(String generalScriptPath, String userScriptPath, String replacedText, String insertedText) {
        try {
            BufferedReader reader = new BufferedReader(
                    new FileReader(generalScriptPath));
            FileWriter updateFile = updateFile(userScriptPath);
            BufferedWriter writer = new BufferedWriter(updateFile);
            
            String nextLine = reader.readLine();
            while (nextLine != null) {
                String replace = nextLine.replaceAll(replacedText, insertedText);
                fLogger.log(Level.INFO, (replace));
                writer.append(replace);
                writer.newLine();
                nextLine = reader.readLine();
            }
        } catch (IOException ex) {
            fLogger.log(Level.OFF, ex.getMessage());
        }
    }

    private static FileWriter updateFile(String path) throws IOException {
        File file = new File(path);
        // if file doesnt exists, then create it
        if (file.exists()) {
            boolean isDelete = file.delete();
            if (isDelete) {
                fLogger.log(Level.INFO, "usunięty");
            }
        }
        fLogger.log(Level.INFO, "tworzenie pliku");
        file.createNewFile();
        FileWriter fileWriter = new FileWriter(file.getAbsoluteFile());
        
        return fileWriter;
    }
    
    private static void readCSV(String csvPath) {
        try {
            CSVReader csvReader = null;
            try {
                csvReader = new CSVReader(new FileReader(csvPath));
            } catch (FileNotFoundException ex) {
                fLogger.log(Level.OFF, ex.getMessage());
            }
            String[] row = null;
            try {
                while((row = csvReader.readNext()) != null) {
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
    
    private static void runScriptFromFile(String sqlPath){
		try {
                    ScriptRunner sr = new ScriptRunner(connectDB(), false, false);
                    Reader reader = new BufferedReader(new FileReader(sqlPath));
                    sr.runScript(reader);
		} catch (Exception ex) {
			fLogger.log(Level.OFF, ex.getMessage());
		}
    }
   
    private static Connection connectDB() {

        System.out.println("-------- MySQL JDBC Connection Testing ------------");

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Where is your MySQL JDBC Driver?");
            e.printStackTrace();
            return null;
        }

        System.out.println("MySQL JDBC Driver Registered!");
        Connection connection = null;

        try {
            connection = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/slaskdb", "root", "root");

        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
            return null;
        }

        if (connection != null) {
            System.out.println("You made it, take control your database now!");
        } else {
            System.out.println("Failed to make connection!");
        }
        return connection;
    }

    private static void checkSavedGames(String user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static void deleteGameInstance() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static void deleteRecordFromDB(String user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static void deleteCSVFile() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static void storeGameAsCSV() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static void insertRecordInDB() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private static void convertCSVIntoSQLScript() {
        readCSV("sciezka");
    }
}
