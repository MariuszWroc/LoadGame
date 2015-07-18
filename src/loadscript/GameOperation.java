/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loadscript;

import com.ibatis.common.jdbc.ScriptRunner;
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mczarny
 */
public class GameOperation {
    private final static String PATH = "/home/mczarny/git/loadproject/LoadGame/src/script/";
    private final static Logger fLogger = Logger.getLogger("GameOperation");
    
    GameOperation() {
        RecordService.readAllRecords();
    }
    
    public static void saveGame() {
        CSVService.updateCSV();
        RecordService.createRecord();
    }

    public static void loadGame() {
        convertCSVIntoSQLScript();
        runScriptFromFile(PATH + "user/insertData.sql");
    }
    
    public static void createGame() {
        copyAndReplace(PATH + "original/makeSlaskDB.sql", PATH + "user/makeSlaskDB.sql", "databaseInstance", generateInstanceName());
//                copyAndReplace(PATH + "original/makeMainDB.sql", PATH + "user/makeMainDB.sql", "databaseInstance", "nowaInstancja2");
        copyAndReplace(PATH + "original/insertData.sql", PATH + "user/insertData.sql", "databaseInstance", generateInstanceName());
        runScriptFromFile(PATH + "user/makeSlaskDB.sql");
//        runScriptFromFile(PATH + "user/makeMainDB.sql");
        runScriptFromFile(PATH + "user/insertData.sql");
        RecordService.createRecord();
    }
    
    public static void deleteGame() {
        FileService.deleteFile(PATH + "sample2.csv");
        RecordService.deleteRecord();
    }
    
    public static void joinToGame() {
        RecordService.createRecord();
    }
    
    
    private static String generateInstanceName() {
        //TODO: Query that generate new instance
        return "NOWAINSTANCJA";
    }
        
    private static void copyAndReplace(String generalScriptPath, String userScriptPath, String replacedText, String insertedText) {
        try {
            BufferedReader reader = new BufferedReader(
                    new FileReader(generalScriptPath));
            FileWriter updatedFile = FileService.updateFile(userScriptPath);
            BufferedWriter writer = new BufferedWriter(updatedFile);
            
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
    
    private static void runScriptFromFile(String sqlPath) {
        try {
            ScriptRunner sr = new ScriptRunner(connectDB(), false, false);
            Reader reader = new BufferedReader(new FileReader(sqlPath));
            sr.runScript(reader);
        } catch (IOException | SQLException ex) {
            fLogger.log(Level.OFF, ex.getMessage());
        }
    }
   
    private static Connection connectDB() {
        fLogger.log(Level.OFF, "-------- MYSQL JDBC CONNECTION TESTING ------------");
        Connection connection;
        try {
            Class.forName("com.mysql.jdbc.driver");
        } catch (ClassNotFoundException ex) {
            fLogger.log(Level.OFF, "WHERE IS YOUR MYSQL JDBC DRIVER? {0}" + ex.getMessage());
            return null;
        }
        fLogger.log(Level.OFF, "MYSQL JDBC DRIVER REGISTERED!");


        try {
            connection = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/slaskdb", "root", "root");

        } catch (SQLException ex) {
            fLogger.log(Level.OFF, "CONNECTION FAILED! CHECK OUTPUT CONSOLE {0}" + ex.getMessage());
            return null;
        }

        if (connection != null) {
            fLogger.log(Level.OFF, "YOU MADE IT, TAKE CONTROL YOUR DATABASE NOW!");
        } else {
            fLogger.log(Level.OFF, "FAILED TO MAKE CONNECTION!");
        }
        return connection;
    }

    private static void convertCSVIntoSQLScript() {
        CSVService.readCSV(PATH + "sample2.csv");
    }

}
