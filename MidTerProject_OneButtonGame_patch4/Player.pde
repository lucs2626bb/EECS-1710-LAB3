class Player {

  PImage shipMain, shipTest;

  //movemnet variables
  float x, y;
  float speedShip = 5;
  PVector pos;  //position
  PVector velocity;
  PVector playerBulletPos;
  int moveMargin = 50;

  //controls
  boolean teleport = true;
  boolean swapDirection;
  boolean isPlayer = true;
  boolean allowTeleport = false;
  boolean isAlive = true;

  //attack
  ArrayList<Bullet> bullets;

  //background (make into seperate class?)
  int topFloor = height - 70;
  int bottomFloor = 70;

  //hitbox
  int hitR = 25;
  int r = 25*2;   //diameter of hitbox (debugging)
  PVector hitbox = new PVector(r, r);  //x, y hitbox


  Player(float x, float y) {
    this.x = x;
    this.y = y;

    //Nick Fox geig, Background 02  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week03/Background02/Background02.pde
    shipTest = loadImage("testShip.png");
    shipMain = shipTest;
    shipMain.resize(shipMain.width * (height / shipMain.height), height/16);  //resizing image

    pos = new PVector(x, y);  //The nature of code: example 1.2: Bouncing ball with PVectors (pg 35)
    velocity = new PVector(speedShip, 0);

    bullets = new ArrayList<Bullet>();
  }

  void update() {
    //The nature of code: example 1.2: Bouncing ball with PVectors (pg 35)
    pos.add(velocity); 
    if (pos.x > width) {
      velocity.x *= -1;
    } else if (pos.x < 0) {
      velocity.x *= -1;
    }

    //Nick Fox geig, Artillery01 (Cannon.pde & Bullet.pde)  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Artillery01
    // remove all bullets that are no longer alive
    for (int i=bullets.size()-1; i>=0; i--) {
      Bullet bullet = bullets.get(i);
      if (bullet.isAlive) {
        bullet.run();
      } else {
        bullets.remove(i);
      }
    }
  }

  void draw() {
    imageMode(CENTER);
    if (isAlive) {
      image(shipMain, pos.x, pos.y);
      //println("SHIP X: ", pos.x, "  SHIP Y: ", pos.y);
      //println("TELEPORT:  ", teleport);
      x = pos.x;
      y = pos.y;
      //ellipse(pos.x, pos.y, 50, 50);
    } else {
      gamestate.dead = true;
    }
  }

  void switchDirection() {
    velocity.x *= -1;
  }

  void shoot() {
    //"Shooting in a game", Discourse processing, answered by Sarah  https://discourse.processing.org/t/shooting-in-a-game/5328/6
    bullets.add(new Bullet(pos.x, pos.y));
  }

  void teleport() {
    teleport = !teleport;

    if (teleport) {
      pos.y = topFloor;
      //pos.x = position x of each bullet
    } else if (!teleport) {
      pos.y = bottomFloor;
    }

    //pos.x = bullet.x;    //problem: not detecting bullet position
  }

  void switchGravity() {
  }

  void run() {
    player.draw();
    player.update();
  }
}
