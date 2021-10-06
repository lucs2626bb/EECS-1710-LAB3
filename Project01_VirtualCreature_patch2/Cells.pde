//Cells are not showing up???

class Cells {

  PVector positionCell, targetCell;  //how the AI moves
  float x, y;
  float moveSpeed = 0.03;
  int runPos;

  boolean isRunning = false;
  boolean isClose = false;

  //debug    https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  float triggerDistance1 = 100;
  float triggerDistance2 = 5;
  float movementSpeed = 0.08;
  boolean debug = true;

  //constructor  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  Cells(float x, float y) {

    positionCell = new PVector(x, y);
    targetCell = new PVector(random(width), random(height));
  }

  //Creature01   https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature01/Creature01.pde
  void scatter() {

    PVector guyPos = new PVector(mouseX, mouseY);
    //needs to detect position of the main character
    isRunning = positionCell.dist(guyPos) < 100;    //how far away the creature is away from the mouse (moves when it does this)
  
    if (isRunning) {
      positionCell = positionCell.lerp(targetCell, moveSpeed);

      if (positionCell.dist(targetCell) < 5) {
        targetCell = new PVector(random(width), random(height));
      }
      
      if (isClose) {
      }
      
    }
  }


  void draw() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);

    //x = random(0, width/2);
    //y = random(0, height/2);

    noStroke();
    fill(123, 37, 234);
    ellipse(positionCell.x, positionCell.y, 20, 20);

    if (debug) {
      noFill();
      stroke(0, 255, 0);
      ellipse(positionCell.x, positionCell.y, triggerDistance1*2, triggerDistance1*2);
      ellipse(positionCell.x, positionCell.y, triggerDistance2*2, triggerDistance2*2);
      line(targetCell.x, targetCell.y, positionCell.x, positionCell.y);
      stroke(255, 0, 0);
      rect(targetCell.x, targetCell.y, 10, 10);
    }
  }
  
  //ARE YOU KIDDING ME NULLPOINTEXCEPTION I HATE THIS
  void run() {
    draw();
    scatter();
  }
}
