//Nick Fox geig, Artillery01 (Cannon.pde & Bullet.pde)  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Artillery01
class Bullet {

  //movement
  PVector pos, velocity, playerPos;
  float speedB = 20;  //default speed: 20 5
  float x, y;


  //states
  boolean isAlive = true;
  boolean reachEdge = false;  //edge detection
  float edgePos;

  //timing (delay time)
  int markTime = 0;    //marktime (inital)
  int playerLifetime = 750;  //1 second interval
  int lifetime = 2000; //default: 1500

  boolean debug = true;

  Bullet(float x, float y) {
    pos = new PVector(x, y);
    playerPos = new PVector(player.x, player.y);
    velocity = new PVector(0, speedB);    //x, y velocity (speed)
    markTime = millis();  //
  }

  void update() {

    //teleporting

    if (player.teleport) {
      pos.y -= velocity.y;
    } else if (!player.teleport) {
      pos.y += velocity.y;
    }

    //TELEPORTING
    //Nick Fox geig, Artillery01 (Bullet.pde)  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Artillery01
    //Nick Fox Geig, TimeInterval01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/TimeInterval01
    //Flag bullets as "not alive" so they can be deleted (in player.update())
    if (player.isAlive && (isAlive && millis() > markTime + playerLifetime && reachEdge)) {
      isAlive = false;
    } else if (isAlive && millis() > markTime + playerLifetime && pos.y == 0 || pos.y == height) {
      playerLifetime += playerLifetime;
    }

    //detect when the bullet reach the "edge" of the screen
    if (pos.y <= 0 || pos.y >= height) {
      reachEdge = true;
    }

    if (!isAlive && reachEdge) {
      player.x = pos.x;  //problem:  registers the player's position, not the actual bullet
      player.teleport();
    }
  
  }


  void draw() {
    rectMode(CENTER);
    colorMode(RGB);
    noStroke();
    fill(255, 255, 0);

    rect(pos.x, pos.y, 8, 20);

    if (debug == true) {
      //println("PEW X: ", pos.x, "  PEW Y: ", pos.y);
    }
  }

  void run() {
    draw();
    update();
  }
}
