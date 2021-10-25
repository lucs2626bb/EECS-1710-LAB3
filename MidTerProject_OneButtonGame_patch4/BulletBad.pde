//Nick Fox geig, Artillery01 (Cannon.pde & Bullet.pde)  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Artillery01
class BulletBad {

  //movement
  PVector pos, velocity, target;
  float speedB = 5;  //default speed: 1500    5
  float x, y;


  //states
  boolean isAlive = true;
  boolean reachEdge = false;  //edge detection
  boolean targetSelect;
  float edgePos;

  //timing (delay time)
  int markTime = 0;    //marktime (inital)
  int playerLifetime = 750;  //1 second interval
  int lifetime = 10000;

  //player hitbox
  float bulletR = 20;
  float playerR = 40;
  
  
  boolean debug = true;
  
  BulletBad(float x, float y) {
    pos = new PVector(x, y);
    velocity = new PVector(0, speedB);    //x, y velocity (speed)
    markTime = millis();  //
  }

  void update() {
    //pos.y += velocity.y;
    PVector playerPos = new PVector(player.x, player.y);
    homming();


    //"homing" missle bahaviour, bullets move slightly towards tyhe player when shot
    if (pos.dist(playerPos) < 800) {
      pos.lerp(target, 0.02);
      if (player.y == player.topFloor) {
        pos.lerp(target, 0.02);
        pos.y += velocity.y;
      } else if (player.y == player.bottomFloor) {
        pos.y -= velocity.y;
      }
    }


    if (player.isAlive && (isAlive && millis() > markTime + lifetime && reachEdge)) {
      isAlive = false;
    } else if (isAlive && millis() > markTime + lifetime && pos.y == 0 || pos.y == height) {
      lifetime += lifetime;
    }

    //detect when the bullet reach the "edge" of the screen
    if (pos.y <= 0 || pos.y >= height) {
      reachEdge = true;
    }

    //collisiion (for loop does not work for me) https://stackoverflow.com/a/36334611
    if (dist(player.x, player.y, pos.x, pos.y) < playerR + bulletR) {
      player.isAlive = false;
    }
  }


  void draw() {
    rectMode(CENTER);
    colorMode(RGB);
    noStroke();
    fill(255, 0, 0);

    //rect(pos.x, pos.y, 8, 20);
    
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 20, 20);
      
    if (debug == true) {
      //println("PEW X: ", pos.x, "  PEW Y: ", pos.y);
    }

    x = pos.x;
    y = pos.y;
  }

  void homming() {
    if (!targetSelect) {
      target = new PVector(player.x, player.y);
      targetSelect = true;
    }
  }

  void run() {
    draw();
    update();
  }
}
