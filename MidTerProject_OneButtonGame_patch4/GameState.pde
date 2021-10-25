class GameState {

  boolean dead = false;
  PFont font;
  String msg = "Space to shoot/teleport";

  void setup() {
    //text  https://pages.uoregon.edu/park/Processing/process5.html
    font = loadFont("Candara-BoldItalic-48.vlw");
    textFont(font);
    textAlign(CENTER);
  }

  void draw() {
    fill(255, 255, 255);
    text(msg, width/2, height/2);
    

    if (dead == true) {
      end();
    }
  }

  void end() {
    noStroke();
    colorMode(RGB);
    fill(255, 0, 0);
    text("YOU DIED", width/2, height/2);
  }

  void run() {
    setup();
    draw();
  }
}
