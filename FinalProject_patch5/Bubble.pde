 //Nick Fox Geieg, Artillery03 and Explosion class https://github.com/eecs17xx/eecs1710-2021f/commit/6cf8595c4f29b268e4b5fdb33fa6c4b073905d51

class Bubble {
  PVector pos;
  boolean isAlive = true;
  int timestamp;
  int lifetime = 200;
  float size = 100;
  float hue = random(255);
  float fadeAlpha = 255;
  
  Bubble (float x, float y) {
    timestamp = millis();
    pos = new PVector(x, y);
  }
  
  void update() {
    if (isAlive && millis() > timestamp + lifetime) {
      isAlive = false;
    }
  }
  
  void draw() {
    noStroke();
    colorMode(HSB);
    fill(hue, 255, 200, fadeAlpha);
    if (size <= 100 || fadeAlpha >= 0) {
      size -= 5;
      fadeAlpha -= 5;
    }
    ellipse(pos.x, pos.y, size, size);
  }
  
  void run() {
    update();
    draw();
  }
  
}
