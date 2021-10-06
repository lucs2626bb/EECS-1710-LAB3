/*
Lucas Bellotto
 Oct 4th, 2021
 EECS 1710
 */

import gifAnimation.*;

Guy guys;
//Cells cells;

int numCells = 8;
int guyPosX, guyPosy;

Cells[] cells = new Cells[numCells];

void setup() { 
   size(1280, 720, P2D);
   background(128);
   
   guys = new Guy(width/2, height/2);
   
   for (int i=0; i<cells.length; i++) {
    cells[i] = new Cells(random(width), random(height));
  }
   
}

void draw() {
    background(128);
    guys.run();
    
    for (int i=0; i<cells.length; i++) {
    cells[i].run();
  }
}
