/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package loadscript;

import java.awt.EventQueue;

/**
 *
 * @author mczarny
 */
public class LoadScript {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
        
            @Override
            public void run() {
                GameFrame frame = new GameFrame();
                frame.setVisible(true);
            }
        }); 
    }
    
}
