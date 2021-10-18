
class Moon {

  PImage moonSprite;
  float moonX, moonY;
  PVector pos, moonPos;
  float rotEarth, rotMoon;

  int lastSecond;
  int lastMinute;

  //consturctor
  //Nick fox geig: Creature03  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature03/Steve.pde
  Moon(float x, float y) {
    pos = new PVector(x, y);

    //Moon PNG source:  https://pngimg.com/image/25413
    moonSprite = loadImage("moon.png");
    moonSprite.resize(0, 25);

    moonPos = new PVector(x, y);
    pos = new PVector(x, y);
  }


  void update() {
  }

  void draw() {
    //Moon (orbits around earth)
    //  The Coding Train: Solar System in porcessing https://www.youtube.com/watch?v=l8SiJ-RmeHU

    pushMatrix();
    translate(moonPos.x + rotEarth, moonPos.y + rotEarth);  //problem: Moon is not orbiting outside of earth
    rotate(radians(rotMoon));
    // translate(width/2 - rotEarth, height/2 - rotEarth);  //problem: Moon is orbiting outside of earth
    image(moonSprite, moonPos.x, moonPos.y);

    //Moon (orbits around earth)
    //  The Coding Train: Solar System in porcessing https://www.youtube.com/watch?v=l8SiJ-RmeHU

    noFill();
    stroke(0, 255, 0);
    ellipse(pos.x, pos.y, 30, 30);
    popMatrix();

    //1 second
    int s = second();
    //1 minute
    int m = minute();

    if (m != lastMinute) {
      rotMoon +=6;
      lastSecond = m;
    }
  }

  void run() {
    draw();
    update();
  }
}
