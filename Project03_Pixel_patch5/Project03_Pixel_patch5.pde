import processing.sound.*;
SoundFile file;

//Nick Fox Geig: PixelExample05   https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week10/PixelExample05
PImage img1, img2, img3, img4;
ArrayList<Dot> dots;
Move move;
int scaler = 5; // will use only every 10th pixel from the image

//Nick Fox Geig: PixelExample08  
PImage starPattern02, starPattern03;
ArrayList<PVector> blueEdge, redVert;



void setup() {
  size(1000, 1000, P2D);  
  img1 = loadImage("BigDipper.png");
  img1.loadPixels();
  img2 = loadImage("Cancer.png");
  img2.loadPixels();
  img3 = loadImage("Orion.png");
  img3.loadPixels();
  img4 = loadImage("Scorpio.png");
  img4.loadPixels();
  /*
  //Processing Ref: Sound  https://processing.org/reference/libraries/sound/SoundFile.html
   //Song: Chopin - Spring Waltz (Preformed by Toms Mucenieks) https://www.youtube.com/watch?v=EFJ7kDva7JE
   file = new SoundFile(this, "waltzMono.mp3");
   file.play();
   file.loop();
   file.rate(1);
   */

  //Nick Fox Gieg, Background01  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week03/Background01/Background01.pde

  //set the window to the size of the image
  //Nick Fox Geig, Pixel 06  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week10/PixelExample06
   
  int w, h;
  if (img1.width > img2.width) {
    w = img1.width;
  } else {
    w = img2.width;
  }
  
  if (img1.height > img2.height) {
    h = img1.height;
  } else {
    h = img2.height;
  }
  surface.setSize(w, h);


  //surface.setSize(1000, 1000);

  dots = new ArrayList<Dot>();

  //determine the connectors and main stars of the constellation
  blueEdge = new ArrayList<PVector>();
  redVert = new ArrayList<PVector>();
  
  for (int x = 0; x < img1.width; x += scaler) {
    for (int y = 0; y < img1.height; y += scaler) {
      int loc = x + y * width;
      //dots.add(new Dot(x, y, img1.pixels[loc]));
      color col = img1.pixels[loc];
      //if (red(col) > 200) redVert.add(new PVector(x, y));
      //if (blue(col) > 200) blueEdge.add(new PVector(x, y));
      if (blue(col) > 200) dots.add(new Dot(x, y, img1.pixels[loc]));
      
    }
  }

/*
  for (int x = 0; x < img1.width; x += scaler) {
    for (int y = 0; y < img1.height; y += scaler) {
      int loc = x + y * width;
      //dots.add(new Dot(x, y, img1.pixels[loc]));
      color col = img1.pixels[loc];
      //if (red(col) > 200) redVert.add(new PVector(x, y));
      //if (blue(col) > 200) blueEdge.add(new PVector(x, y));
      if (blue(col) > 200) dots.add(new Dot(x, y, img1.pixels[loc]));
      
    }
  }

  for (int x = 0; x < img2.width; x += scaler) {
    for (int y = 0; y < img2.height; y += scaler) {
      int loc = x + y * width;
      //dots.add(new Dot(x, y, img1.pixels[loc]));
      color col = img2.pixels[loc];
      //if (red(col) > 200) redVert.add(new PVector(x, y));
      //if (blue(col) > 200) blueEdge.add(new PVector(x, y));
      if (blue(col) > 200) dots.add(new Dot(x, y, img1.pixels[loc]));
    }
  }

  for (int x = 0; x < img3.width; x += scaler) {
    for (int y = 0; y < img3.height; y += scaler) {
      int loc = x + y * width;
      //dots.add(new Dot(x, y, img1.pixels[loc]));
      color col = img3.pixels[loc];
      //if (red(col) > 200) redVert.add(new PVector(x, y));
      //if (blue(col) > 200) blueEdge.add(new PVector(x, y));
      if (blue(col) > 200) dots.add(new Dot(x, y, img1.pixels[loc]));
    }
  }

  for (int x = 0; x < img4.width; x += scaler) {
    for (int y = 0; y < img4.height; y += scaler) {
      int loc = x + y * width;
      //dots.add(new Dot(x, y, img1.pixels[loc]));
      color col = img4.pixels[loc];
      //if (red(col) > 200) redVert.add(new PVector(x, y));
      //if (blue(col) > 200) blueEdge.add(new PVector(x, y));
      if (blue(col) > 200) dots.add(new Dot(x, y, img1.pixels[loc]));
    }
  }
  */
  move = new Move();
}

void pixelMap() {
}

void draw() {
  background(128);
  //Nick Fox Geig: PixelExample05   https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week10/PixelExample05
  for (Dot dot : dots) {
    dot.run();
    move.run();
  }
  surface.setTitle("The Star Scholar");
}
