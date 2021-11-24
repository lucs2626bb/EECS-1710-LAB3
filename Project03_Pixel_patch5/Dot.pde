//Nick Fox Geig: PixelExample05   https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week10/PixelExample05

class Dot {

  PVector position, target;
  color col;
  float speed;
  float dotSize;

  Dot(float x, float y, color _col) {
    position = new PVector(x, y);
    //target = new PVector(random(width), random(height));
    //target = new PVector(mouseX, mouseY);
    col = _col;

    float b = brightness(col) / 255;
    //speed = b / 1000;
    speed = 0.02;
    //play around with dot size???
    //dotSize = abs(10 - (b * 10)) + 2;
    dotSize = abs(10);
  }

  void update() {
    //Creature01   https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature01/Creature01.pde
    //position = position.lerp(target, speed);
/*
    PVector mousePos = new PVector(mouseX, mouseY);
    //if (position.dist(mousePos) < 300) {
    position = position.lerp(target, speed);
    if (position.dist(target) < 5) {
      target();
    }
    //}
    */
  }
  
    void target() {
    //target = new PVector(random(mouseX), random(height));
    int swarmRadiusL = -64;
    int swarmRadiusR = 64;
    target = new PVector(mouseX + int(random(swarmRadiusL, swarmRadiusR)), mouseY + int(random(swarmRadiusL, swarmRadiusR)));
  }

  void draw() {
    stroke(col);
    strokeWeight(dotSize);
    point(position.x, position.y);
  }

  void run() {
    update();
    draw();
  }

}
