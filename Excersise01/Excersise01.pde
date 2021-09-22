int brushSize = 8;
int brushColour = 255;
color bgColor = color(255, 255, 255);

PFont font;
String titleText = "Drawing game";
String promptL = "L-Click = draw";
String promptR = "R-Click = erase";
int titleFontSize = 32;
int raveColourGreen;

PImage img, img2;

//nick fox geig, week 1 excersise on github
void setup() {
  fill(0, 0, 0);
  size(1280, 720, P2D);  //P2D enables 2D CPU acceleration (whatever that menas)
  background(bgColor);
  ellipseMode(CENTER);
  rectMode(CENTER);

  //processing reference: image()
  img = loadImage("tree.png"); 
  img2 = loadImage("adachi.png");  //funny man
  image(img2, width/2, 300);

  //text stuff
  font = createFont("Calibri", titleFontSize);  //nick fox-geig github lecture 4
  textFont(font, titleFontSize);
  textAlign(CENTER);
  text(titleText, width/2, 64);
  text(promptL, width/10, 64);
  text(promptR, (width-width/10), 64);
  
  
  //from proccesing reference
  String[] fontList = PFont.list();
  printArray(fontList);
}

//nick fox geig, week 1 excersise on github
void draw() {

  //Cycles the background colour pulsing
  if (raveColourGreen == 255) {
    raveColourGreen = 0;
  }

  if (mousePressed && mouseButton == LEFT) {  //when clicking the left mousebutton, paint
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, brushSize, brushSize);

    raveColourGreen++;
    stroke(brushColour, raveColourGreen, 0);    //sets RGB value of green to a pulsing colour (raveColour)
    fill(brushColour, raveColourGreen, 0);

/*
Eraser source: kevin Workman on Stackoverflow: https://stackoverflow.com/questions/32830769/processing-draw-program
     Procesing tutorial: Interactivity (mouse buttons): https://processing.org/tutorials/interactivity 
     */
    //when clicking the right mousebutton, erase
  } else if (mousePressed && mouseButton == RIGHT) {
    stroke(bgColor);
    fill(bgColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, brushSize, brushSize);
  }
}

//nick geig fox - lecture 3
/*
void mouseDragged() {
  stroke(brushColour, 0, raveColourGreen);
  fill(brushColour, 0,  raveColourGreen);
  line(mouseX, mouseY, pmouseX, pmouseY);
  ellipse(mouseX, mouseY, 10, 10); 
}
*/


void mouseReleased() {
//place image where corsour is
 
    imageMode(CORNER);
    image(img, pmouseX, pmouseY, 30, 30);
}

//from proccesing reference
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e); 
  // Scrolling up (-) = larger brush
  if (e < 0) {         
    brushSize++;
    //  Scrolling down (+) = smaller brush
  } else if (e > 0) {   
    brushSize--;
  }
}

/*
Ideas:
 -show how big your brush is  
 DONE (not contollable) -select multiple colours
 -select multiple brushes -> single button press with text prompt?
 FAILED -background rave
 DONE -funny image in the bg
 ALMOST DONE  (not the cursour, but  i did the brush) -set cursour to png of adachi
 */
 
 /*
 //nick fox geig lecture
 random(var) - random(var)
 var++;
 */
