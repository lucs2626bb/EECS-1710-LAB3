class Bees {

  //AI movement
  PVector position, target, targetSwarm; 
  float x, y;
  float xBee, yBee;
  float moveSpeed = 0.09;
  
  //Decide to chase flower
  boolean isClose = false;
  boolean isHungry = true;

  //debug: creature03 Nick Fox Geig    https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  float triggerFar = 300;
  float triggerClose = 50;
  float movementSpeed = 0.08;
  int scatterMargin = 10;
  boolean debug = false;

  Gif myGif;
  //Nick fox geig: Creature03  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  Bees(float x, float y, Gif beeGif) {
    position = new PVector(x, y);
    targetScatter();
    
    this.myGif = beeGif;
    //Nick Fox Geig: GIF example  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week05/GifExample/GifExample.pde
    beeGif.loop();
    beeGif.play();
  }

  //Creature01, Nick Fox Geieg   https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature01/Creature01.pde
  void update() {
    
    PVector beePos = new PVector(xBee, yBee);
    PVector flowerPos = new PVector(flowers.xFlower, flowers.yFlower);
    isClose = position.dist(flowerPos) < 300;    //how far away the creature is away from the mouse (moves when it does this)

    if (isClose) {
      //isHungry = true;
      position = position.lerp(target, moveSpeed);
      //Scattering
      if ((position.dist(target) < triggerClose) && isHungry == true && flowers.isAlive) {
        targetWander();
      }
    }
    
    //Nick fox geig: Creature03  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
    if (!isHungry) {
      targetScatter();
      isHungry = true;
    }
    
    if (beePos == flowerPos) {
      flowers.isAlive = !flowers.isAlive;
      isHungry = !isHungry;
    }
    
}

  //targetScatter();

  //Nick fox geig: Creature03  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  void draw() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);

    xBee = position.x;
    yBee = position.y;  

    //random() used to affect x and y position of the sprite
    xBee += sin(millis()) * random(8);
    yBee += sin(millis()) * random(8);

    image(myGif, xBee, yBee, 32, 32);

    if (debug == true) {
      noFill();
      colorMode(RGB);
      stroke(240, 255, 240);
      //"far" detection
      ellipse(position.x, position.y, triggerFar, triggerFar);
      //"close" detection
      stroke(255, 0, 0);
      ellipse(position.x, position.y, triggerClose, triggerClose);
      //Path of movement
      stroke(0, 255, 0);
      line(target.x, target.y, position.x, position.y);
      //"target"
      stroke(255, 0, 0);
      rect(target.x, target.y, 10, 10);
      colorMode(HSB);
     
    }
  }

  void targetScatter() {
    target = new PVector(random(width) - scatterMargin, random(height) - scatterMargin);
    
  }

  //Bees moving to a random coordinate around the cursour's last postion (x, y)
  void targetWander() {
    int swarmRadiusL = -128;
    int swarmRadiusR = 128;
    
    if (isHungry) {
      target = new PVector(flowers.xFlower + int(random(swarmRadiusL, swarmRadiusR)), flowers.yFlower + int(random(swarmRadiusL, swarmRadiusR)));
    } 
    
  }

/*
  //Computer Science Education: key press    https://barclaysapps.wordpress.com/2012/12/06/how-to-detect-a-key-press-in-processing/
  //"simple toggle with spacebar in processing", answered by GKFX, Stackoverflow   https://stackoverflow.com/questions/60609922/simple-toggle-with-spacebar-in-processing
  void keyPressed() {
    if (key == ' ') {
      isHungry = !isHungry;  //toggle
    }
  }
*/
  void run() {
    draw();
    update();
    //scatter();
  }
}
