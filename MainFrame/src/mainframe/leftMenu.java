/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainframe;

import java.awt.Color;
import java.awt.Graphics;
import java.util.Observable;
import java.util.Observer;
import javax.swing.JPanel;

/**
 *
 * @author Simon
 */
public class leftMenu extends JPanel {
    Fenetre fenetre;
    leftMenu(Fenetre aThis) {
        fenetre = aThis;
    }

    @Override
    public void paintComponent(Graphics g) {
        //Vous verrez cette phrase chaque fois que la méthode sera invoquée
        System.out.println("Je suis exécutée !");
        g.fillRect(0, 0, 75, 75);
    }
}
