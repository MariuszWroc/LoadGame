/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loadscript;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

/**
 *
 * @author jacek
 */
public class GameFrame extends JFrame {
    public GameFrame() {
        initUI();
    }

    private void initUI() {
        setTitle("OKNO TESTOWE - OPERACJE NA GRZE");
        setSize(300, 250);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(null);
        
        JButton createGameButton = new JButton("NOWA GRA");
        JButton loadGameButton = new JButton("WCZYTAJ GRĘ");
        JButton deleteGameButton = new JButton("USUN WPIS");
        JButton saveGameButton = new JButton("ZAPISZ GRĘ");
        JButton joinToButton = new JButton("DOŁĄCZ DO");
        
        JButton csvReadButton = new JButton("WCZYTAJ CSV");
        JButton csvWriteButton = new JButton("ZAPISZ CSV");
        JButton csvDeleteButton = new JButton("USUŃ CSV");
        JButton csvUpdateButton = new JButton("UPDATE CSV");
        
        doCreateGame(createGameButton);
        doLoadGame(loadGameButton);
        doDeleteGame(deleteGameButton);
        doSaveGame(saveGameButton);
        doJoinTo(saveGameButton);
        
        doReadCSV(csvReadButton);
        doWriteCSV(csvWriteButton);
        doUpdateCSV(csvUpdateButton);
        doDeleteCSV(csvDeleteButton);
        
        // lewy , górny , prawy, dolny)
        createGameButton.setBounds(0, 0, 150, 25);
        loadGameButton.setBounds(0, 25, 150, 25);
        deleteGameButton.setBounds(150, 0, 150, 25);
        saveGameButton.setBounds(150, 25, 150, 25);
        joinToButton.setBounds(0, 50, 150, 25);
        
        csvReadButton.setBounds(150, 50, 150, 25);
        csvWriteButton.setBounds(150, 75, 150, 25);
        csvDeleteButton.setBounds(0, 75, 150, 25);
        csvUpdateButton.setBounds(0, 100, 150, 25);
        
        add(createGameButton);
        add(loadGameButton);
        add(deleteGameButton);
        add(saveGameButton);
        add(joinToButton);
        
        add(csvReadButton);
        add(csvWriteButton);
        add(csvDeleteButton);
        add(csvUpdateButton);
    }

    private void doSaveGame(JButton saveGameButton) {
        saveGameButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                GameOperation.saveGame();
            }
        });
    }

    private void doDeleteGame(JButton deleteGameButton) {
        deleteGameButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                GameOperation.deleteGame();
            }
        });
    }

    private void doLoadGame(JButton loadGameButton) {
        loadGameButton.setToolTipText("WCZYTUJE DANE Z PLIKU");
        loadGameButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                GameOperation.loadGame();
            }
        });
    }

    private void doCreateGame(JButton createGameButton) {
        createGameButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                GameOperation.createGame();
            }
        });
    }

    private void doJoinTo(JButton joinToButton) {
        joinToButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                GameOperation.joinToGame();
            }
        });
    }
    
    private void doReadCSV(JButton button) {
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                CSVService.readCSV();
            }
        });
    }

    private void doWriteCSV(JButton button) {
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                CSVService.createCSV();
            }
        });
    }

    private void doDeleteCSV(JButton button) {
        button.setToolTipText("WCZYTUJE DANE Z PLIKU CSV");
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                CSVService.deleteCSV();
            }
        });
    }

    private void doUpdateCSV(JButton button) {
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                CSVService.updateCSV();
            }
        });
    }
}
