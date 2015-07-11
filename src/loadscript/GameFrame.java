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
        setTitle("Okno testowe - operacje na grze");
        setSize(300, 250);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(null);
        
        JButton createGameButton = new JButton("Nowa gra");
        JButton loadGameButton = new JButton("Wczytaj grę");
        JButton deleteGameButton = new JButton("Usun wpis");
        JButton saveGameButton = new JButton("Zapisz grę");
        JButton joinToButton = new JButton("Dołącz do");
        
        doCreateGame(createGameButton);
        doLoadGame(loadGameButton);
        doDeleteGame(deleteGameButton);
        doSaveGame(saveGameButton);
        doJoinTo(saveGameButton);
        
        createGameButton.setBounds(0, 50, 150, 25);
        loadGameButton.setBounds(0, 0, 150, 25);
        deleteGameButton.setBounds(150, 0, 150, 25);
        saveGameButton.setBounds(150 , 50, 150, 25);
        joinToButton.setBounds(150, 50, 150, 25);
        
        add(createGameButton);
        add(loadGameButton);
        add(deleteGameButton);
        add(saveGameButton);
        add(joinToButton);
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
        loadGameButton.setToolTipText("wczytuje dane z pliku");
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
}
