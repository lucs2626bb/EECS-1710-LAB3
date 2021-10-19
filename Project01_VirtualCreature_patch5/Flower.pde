import gifAnimation.*;

class Flower {

  PVector position, target;  //how the AI moves
  PImage spriteMain, sprite0;
    
  //Decide when moving
  boolean isRunning = false;
  boolean isClose = false;
  boolean isAlive = true;
  
  //movement variables
  float x, y;
  float xFlower, yFlower;
  float moveSpeed = 0.05;

  //debuging    https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  float triggerFar = 100;
  float triggerClose = 5; 
  float movementSpeed = 0.08;
  boolean debug = false;
  
  int numBees = bees.length;
  
  Gif myGif;

  //Nick fox geig: Creature03  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  Flower(float x, float y, Gif flowerGif) {

    position = new PVector(x, y);
    target = new PVector(0, 0);

    this.myGif = flowerGif;
    //Nick Fox Geig: GIF example  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week05/GifExample/GifExample.pde
    flowerGif.loop();
    flowerGif.play();
  }
  
  /*
problem: Gif library was not updating in a seperate class
   Solution:
   In constructor, define Gif *gif name* in the constructor too
   in the constructor, put this.myGif = myGif; (myGif can be the name of your gif)
   
   You can now put this:
   myGif = new Gif(this, "blobby.gif");  
   
   before you call the class that uses gifs and 
   image(myGif, position.x, position.y);
   into the class that uses gifs
   
   (got help from TA)
   */

  //Nick Fox Gieg, Creature01  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature01/Creature01.pde
  /* Updates position of flower  */
  void update() {  
    
    //mouse x,y and the flower x,y are seprate a delay when the bees are chasing it
    PVector mousePos = new PVector(mouseX, mouseY);

    isRunning = position.dist(mousePos) < 300;    //how far away the creature is away from the mouse (moves when it does this)

    if (isRunning) {
      position = position.lerp(target, moveSpeed);

      if (position.dist(target) > triggerClose) {
        target = new PVector(mouseX, mouseY);
      }
      
      if (position.dist(target) > triggerClose) {
        target = new PVector(mouseX, mouseY);
      }
      
    }
  }

  void draw() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
    
    if (isAlive == true) { 
      image(myGif, mouseX, mouseY, 64, 64);
    }
    
    xFlower = position.x;
    yFlower = position.y;

    //Nick Fox geig: Creature02    https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature02/Creature02.pde
    if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerFar, triggerFar);
      ellipse(position.x, position.y, triggerClose, triggerClose);
      line(target.x, target.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);

      println(xFlower, " ", yFlower);
    }
  }
  
  void run() {
    draw();
    update();
  }
  
  void mouseClicked() {
    
  }
}
