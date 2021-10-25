class Emeny {

  //movemnet variables
  float x, y;
  float speedB = 5;
  PVector pos, target1, target2;  //position
  PVector velocity;
  PVector playerBulletPos;
  int moveMargin = 50;  //meve inbetween these

  //controls
  boolean swapDirection;
  boolean isAlive = true;
  boolean isLeft;
  //"1 action" moves
  boolean shootOnce, moveOnce;

  //attack
  ArrayList<BulletBad> starBullets;

  //background (make into seperate class?)
  int topFloor = height - 70;
  int bottomFloor = 70;

  //hitboxes
  int hitR = 20;
  int r = 25*2;   //diameter of hitbox (debugging)
  PVector hitbox = new PVector(r, r);  //x, y hitbox

  //timing (for movement)
  int markTime = 0;
  int interval1 = 300;
  int interval2 = 1000;

  //images
  PImage starMain, starL, starR;


  Gif myGif;
  Emeny(float x, float y, Gif starbadGif) {
    //this.x = x;
    //this.y = y;
    this.myGif = starbadGif;

    //Nick Fox Gieg, Background01  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week03/Background01/Background01.pde
    starL = loadImage("starLeft.png");
    starL.resize(starL.width/16, starL.height/16);
    starR = loadImage("starRight.png");
    starR.resize(starR.width/16, starR.height/16);

    //Nick Fox Geig, Frogger01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week05/Frogger01
    float xMargin = 100;

    //Nick Fox Gieg, Artelliery 02  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery02/Artillery02.pde
    float pickSide = random(1);
    x = width/2;
    y = random(height - (height - 250), height - 250);
    float x1;
    if (pickSide < 0.5) {
      isLeft = true;
      x1 = -xMargin;
      starMain = starL;
    } else {
      isLeft = false;
      x1 = width + xMargin;
      starMain = starL;
    }
    pos = new PVector(x1, y);  
    target2 = new PVector(random(x), y);

    starBullets = new ArrayList<BulletBad>();

    pos = new PVector(x1, y);
    target1 = new PVector(random(width), y);  //stay inbetween x:200 and y:600
  }

  void update() {
    //Colission detection:  https://happycoding.io/tutorials/processing/collision-detection

    //Nick Fox geig, Artillery01 (Cannon.pde & Bullet.pde)  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Artillery01
    // remove all bullets that are no longer alive
    for (int i=starBullets.size()-1; i>=0; i--) {
      BulletBad bullet = starBullets.get(i);
      if (bullet.isAlive) {
        bullet.run();
      } else {
        starBullets.remove(i);
      }
    }

    //Nick Fox Gieg, Artelliery 02  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery02/Artillery02.pde
    for (Bullet bullet : player.bullets) {
      if (isAlive && hitDetectCircle(pos, bullet.pos, hitbox)) {
        isAlive = false;
      }
    }

    if (isAlive) {
      if (millis() > markTime + interval1) {
        pos.lerp(target1, 0.07);
      }
      //pos.lerp(target2, 0.07);
    }

    //Execute once, answered by Rosdi Kasim  https://stackoverflow.com/a/2666025
    //Ensures that the emeny only fires once

    if (pos.dist(target1) < 2) {
      if (!shootOnce) {
        shoot();
        shootOnce = true;
        //pickEscape();
      }
    }
  }

  void shoot() {
    starBullets.add(new BulletBad(pos.x, pos.y));
  }


  void pickEscape() {
    //float escapeX = width*2;
    y = random(height - (height - 250), height - 250);
    target2  = new PVector(random(width), y);
  }


  void draw() {
    ellipseMode(CENTER);
    colorMode(HSB);
    starbadGif.loop();

    //println("Bad guy alive:`", isAlive);
    if (isAlive) {

      if (!shootOnce) {
        starbadGif.play();
        image(myGif, pos.x + 5, pos.y + 12, myGif.width/8, myGif.height/8);
      } else {
        //starbadGif.stop();
        image(starMain, pos.x, pos.y);
      }
    }
    noFill();

    noFill();
    colorMode(RGB);
    stroke(255, 0, 0);
    //ellipse(pos.x, pos.y, hitR*2, hitR*2);
  }



  void run() {
    draw();
    update();
  }
}
