/*
Problem:  importing Gifs with GIFAnimation does not work
//PImage[] allFrames = Gif.getPImages(this, "blobby.gif");



myGif = new Gif(this, "blobby.gif");
/\ this ling result in a syntax error where "The constructor "(Guy, String)" does not exist"
It says this no matter where I imported this line
*/

import gifAnimation.*;

class Guy {

  PVector position, target;  //how the AI moves

  boolean isRunning = false;
  boolean isClose = false;
  PImage faceMain, face00, face01;
  float x, y;

  float moveSpeed = 0.05;
  
  //debug    https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  float triggerDistance1 = 100;
  float triggerDistance2 = 5;
  float movementSpeed = 0.08;
  boolean debug = true;
  float xGuy, yGuy;
  
  //Nick Fox Geig: GIF example  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week05/GifExample/GifExample.pde
  Gif myGif;
  //PImage[] allFrames = Gif.getPImages(this, "blobby.gif");
  
  //constrcutor    https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  Guy(float x, float y) {

    position = new PVector(x, y);
    target = new PVector(mouseX, mouseY);

    face00 = loadImage("testGuy.png");
    face00.resize(face00.width/3, face00.height/3);
    faceMain = face00;
    
  }
  




  //Nick Fox Gieg, Creature01  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature01/Creature01.pde
  void setup() {
    
  }

  void update() {

    //cells.setup();
    //cells.draw();

    PVector mousePos = new PVector(mouseX, mouseY);
    //PVector mainPos = new PVector(x, y);    //main charcter's postion
    isRunning = position.dist(mousePos) < 300;    //how far away the creature is away from the mouse (moves when it does this)
    //isClose = positionCell.dist(mainPos) < 100;

    if (isRunning) {
      position = position.lerp(target, moveSpeed);
      //processing ref
      //Fixed bug where the creature stoopped moving when flicking past the center
      //x = lerp(x, mouseX, moveSpeed);
      //y = lerp(y, mouseY, moveSpeed);

      if (position.dist(target) > 5) {
        faceMain = face00;
        target = new PVector(mouseX, mouseY);
        //target = new PVector(x, y);
      }
    }

  }


  void draw() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
    
    myGif = new Gif(this, "blobby.gif");
    //image(faceMain, position.x, position.y);
    xGuy = position.x;
    yGuy = position.y;
    
    //Nick Fox geig: Creature02`    https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature02/Creature02.pde
    if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
      line(target.x, target.y, position.x, position.y);
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);
      
      println(xGuy, " ", yGuy);
    }
    
  }
 
  void run() {
    draw();
    update();
  }
  
  
}
