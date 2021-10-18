class Earth {

  PImage earthSprite;
  float rotEarth;

  int lastSecond;
  int lastMinute;

  Earth(float x, float y) {
    //Earth PNG source:   http://www.countingthoughts.com/ct/index.php?page=wtw
    earthSprite = loadImage("earth.png");
    earthSprite.resize(25, 25);
  }

  void update() {
  }

  void draw() {
    //Earth? (main orbiter) 
    pushMatrix();
    translate(width/2, height/2);  //problem: earth is not centered (oops) check Exercise3
    rotate(radians(rotEarth));
    image(earthSprite, 0, (height/2) - 220);
    popMatrix();

    //1 second
    int s = second();
    //1 minute
    int m = minute();

    if (s != lastSecond) {
      rotEarth +=6;
      lastSecond = s;
    }
  }

  void run() {
    draw();
    update();
  }
}
