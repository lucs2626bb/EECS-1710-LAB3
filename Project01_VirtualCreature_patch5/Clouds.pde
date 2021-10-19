//Cloud image source:  https://pngimg.com/download/4323
class Clouds {

  float x, y;
  PImage cloudMain, cloud1;
  float speedC = 0.1;

  Clouds(float x, float y) {
    this.x = int(random(x));
    this.y = int(random(y));

    cloud1 = loadImage("cloud1.png");
    cloud1.resize((cloud1.width * (height / cloud1.height)), height/4);
    cloudMain = cloud1;
  }


  void draw() {
    imageMode(CORNER);
    //Discoruce Processing, ansewered by noel   https://discourse.processing.org/t/galaga-scrolling-background/26527/2
    //foreground objects loop around the background
    image(cloudMain, -width + x, y);
    image(cloudMain, x += speedC, y);
    if (x > width){
      x = 0;
    }
  }

  void run() {
    draw();
  }
}
