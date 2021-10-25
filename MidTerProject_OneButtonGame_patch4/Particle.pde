//Nick fox Geig, particle 01  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Gravity01/Particle.pde
class Particle {

  //movement variables
  PVector pos;  //position
  PVector speed;
  int timeStamp; //determine how old something is

  //gravity
  float gravity = 0.9; 
  float gravityDelta = 0;

  float friction = 0.99;  //slipperieness
  float floor = height;    //the ground
  PImage bgstar;

  Particle(float x, float y) {
    pos = new PVector(x, y);
    timeStamp = millis();
    speed = new PVector(random(-1, 1), random(-1, 1));  //random x, y that is positive or negative
  }

  void update() {
    speed.mult(friction);  //speed slows down wih friction, multiplied
    pos.add(speed);      //each position is updated by speed
    pos.y += gravity;  //update the y position of the particles to the gravity
    pos.y = constrain(pos.y, 0, floor);  //??

    if (pos.y == floor) {    //when the particles hit the floor, teleport back up to the celling
      pos.y = 0;
      pos.x = random(width);
      speed.equals(0);
      //speed.equals(0) doesnt do anything. However, the gravity delta is 0 so there is no acceleration
    }

    gravity += gravityDelta;    //gravity of each particle increases by every gravityDelta
  }

  void draw() {
    //Discoruce Processing, ansewered by noel   https://discourse.processing.org/t/galaga-scrolling-background/26527/2
    //foreground objects loop around the background

    noStroke();
    colorMode(HSB);
    fill(0, 0, 35);
    ellipse(pos.x, pos.y, 10, 10);
  }

  void run() {
    update();
    draw();
  }
}
