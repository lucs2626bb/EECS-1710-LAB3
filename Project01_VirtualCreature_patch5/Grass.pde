//Grass image was made by me in Krita
class Grass {

  float x, y;
  PImage grassGround;
  int speedG = 1;

  Grass(float x, float y) {
    this.x = x;
    this.y = y;

    grassGround = loadImage("grass.png");
  }

  void draw() {
    imageMode(CORNER);
    //Discoruce Processing, ansewered by noel   https://discourse.processing.org/t/galaga-scrolling-background/26527/2
    //foreground objects loop around the background
    image(grassGround, -width + x, y);
    image(grassGround, x += speedG, y);
    if (x > width) {
      x = 0;
    }
    
  }

  void run() {
    grass.draw();
  }
}
