/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loadscript;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mczarny
 */
public class RecordService {
    private final static Logger fLogger = Logger.getLogger("RECORDSERVICE");
        
        
    public static void createRecord() {
        //TODO: query that insert Game entity
        fLogger.log(Level.OFF, "RECORD CREATED");
    }
    
    public static void readAllRecords() {
        //TODO: query that update Game entity
        fLogger.log(Level.OFF, "RECORDS READED");
    }
    
    public static void updateRecord() {
        //TODO: query that update Game entity
        fLogger.log(Level.OFF, "RECORD UPDATED");
    }
    
    public static void deleteRecord() {
        // TODO: delete record from user
        fLogger.log(Level.OFF, "RECORD DELETED");
    }
}
