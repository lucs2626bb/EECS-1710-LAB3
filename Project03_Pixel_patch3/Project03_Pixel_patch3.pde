import processing.sound.*;
SoundFile file;

//Nick Fox Geig: PixelExample05   https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week10/PixelExample05
PImage img1;
ArrayList<Dot> dots;
Move move;
int scaler = 5; // will use only every 10th pixel from the image

void setup() {
  size(800, 800, P2D);  
  img1 = loadImage("BigDipper.png");
  //set the window to the size of the image
  surface.setSize(img1.width, img1.height);

  img1.loadPixels();
  dots = new ArrayList<Dot>();

  //Nick Fox Geig: PixelExample05   https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week10/PixelExample05
  
  //Processing Ref: Sound  https://processing.org/reference/libraries/sound/SoundFile.html
   //Song: Chopin - Spring Waltz (Preformed by Toms Mucenieks) https://www.youtube.com/watch?v=EFJ7kDva7JE
   file = new SoundFile(this, "waltzMono.mp3");
   file.play();
   file.loop();
   file.rate(1);

  for (int x = 0; x < img1.width; x += scaler) {
    for (int y = 0; y < img1.height; y += scaler) {
      int loc = x + y * width;
      //dots.add(new Dot(x, y, img1.pixels[loc]));
      color col = img1.pixels[loc];
      //if (red(col) > 200) redVert.add(new PVector(x, y));
      //if (blue(col) > 200) blueEdge.add(new PVector(x, y));
      if (blue(col) > 200) {
        dots.add(new Dot(x, y, img1.pixels[loc]));
      }
    }
  }
  move = new Move();
}

void draw() { 
  background(0, 36, 0);
  //Nick Fox Geig: PixelExample05   https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week10/PixelExample05
  for (Dot dot : dots) {
    dot.run();
    move.run();
  }
  surface.setTitle("Pixel_patch2");
}
