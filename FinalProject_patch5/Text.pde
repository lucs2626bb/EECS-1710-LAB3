class Text {
  PFont font;
  boolean tutorial = true;

  void setup() {
    //text  https://pages.uoregon.edu/park/Processing/process5.html
    font = loadFont("LucidaSans-Demi-48.vlw");
    textFont(font);
    textAlign(CENTER);
  }

  void draw() {
    if (tutorial == true) { 
      fill(255, 255, 255);
      text("SongBox", width/2, height/2 - 300);
      text("use WSAD for spike control", width/2, height/2 - 250);
      
      text("W", width/2, height/2 - 150);
      text("S", width/2, height/2 + 150);
      text("A", width/2 - 150, height/2);
      text("D", width/2 + 150, height/2);
    }
  }

  void run() {
    setup();
    draw();
  }
}
