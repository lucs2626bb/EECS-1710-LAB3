//nick fox Gieg Excersise 03    https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week05/Clock01/Clock01.pde

float rotEarth, rotMoon, rotMercury, rotVenus, rotMars, rotJupiter, rotSaturn;
PImage sun, mercury, venus, mars, jupiter, saturn;
float x, y;

PVector target;
PVector pos, earthPos, moonPos;
float xEarth, yEarth;

float d;   //distance (from the sun)

int lastSecond;
int lastMinute;

Moon moon;
Earth earth;

void setup() {
  size(800, 800, P2D);
  textSize(14);

  earth = new Earth(x, y);
  moon = new Moon(x, y);

  //Sun PNG source:  https://pluspng.com/png-17366.html
  sun = loadImage("sun.png");
  sun.resize(100, 100);

  //mercury PNG source:  http://www.wesleysteiner.com/ast/dtm/mercury.html
  mercury = loadImage("mercury.png");
  mercury.resize(8, 8);

  //Venus PNG source:  https://picsart.com/i/sticker-venus-planet-planets-freetoedit-268434396024211
  venus = loadImage("venus.png");
  venus.resize(23, 23);

  //mars PNG source:  https://pngimg.com/image/61176  
  mars = loadImage("mars.png");
  mars.resize(15, 15);

  //Jupiter PNG source:  https://petapixel.com/2015/12/09/these-photos-show-jupiter-from-above-and-below/
  jupiter = loadImage("jupiter.png");
  jupiter.resize(40, 40);

  //Saturn PNG source:  https://www.flickr.com/photos/53460575@N03/37533614911
  saturn = loadImage("saturn.png");
  saturn.resize(40, 40);

  /*
  PVector mousePos = new PVector(mouseX, mouseY);
   isRunning = position.dist(mousePos) < 300;    //how far away the creature is away from the mouse (moves when it does this)
   */
  //moon = new Moon(xEarth, yEarth);
}


void draw() {
  imageMode(CENTER);
  background(0);
  //image(earth, width/2, width/2);

  fill(255, 255, 255);
  text("not to scale, 1 minute = 1 earth year", (width/2) - 250, height - 25);

  //Sun (center)
  pushMatrix();
  translate(width/2, height/2);  //problem: earth is not centered (oops) check Exercise3
  rotate(radians(rotEarth));
  image(sun, 0, 0);
  popMatrix();

  //mercury
  pushMatrix();
  translate(width/2, height/2);  //problem: earth is not centered (oops) check Exercise3
  rotate(radians(rotMercury));
  image(mercury, 0, height/2 - 300);
  popMatrix();

  //venus
  pushMatrix();
  translate(width/2, height/2);  //problem: earth is not centered (oops) check Exercise3
  rotate(radians(rotVenus));
  image(venus, 0, height/2 - 250);
  popMatrix();

  //mars
  pushMatrix();
  translate(width/2, height/2);  //problem: earth is not centered (oops) check Exercise3
  rotate(radians(rotMars));
  image(mars, 0, height/2 - 175);
  popMatrix();

  //jupiter
  pushMatrix();
  translate(width/2, height/2);  //problem: earth is not centered (oops) check Exercise3
  rotate(radians(rotJupiter));
  image(jupiter, 0, height/2 - 125);
  popMatrix();

  //saturn
  pushMatrix();
  translate(width/2, height/2);  //problem: earth is not centered (oops) check Exercise3
  rotate(radians(rotSaturn));
  image(saturn, 0, height/2 - 70);
  popMatrix();

  //1 second
  int s = second();
  //1 minute
  int m = minute();

  /*
  Revolutions of planets
   The revolutions of each planet is calculated by dividing the # of earth years
   Data from NASA:  https://solarsystem.nasa.gov/planets/overview/
   */
  int earthYear = 365;

  float mercuryRev = (88 * 60 )/ earthYear;
  float marsRev = ((earthYear * 1.88) / 60) / 3;
  float venusRev = 225 / 60;
  //float jupiterRev = earthYear / 11.86 / 60;
  //float saturnRev = earthYear / 29.45 / 60;
  float jupiterRev = earthYear / 11.89 / 52;
  float saturnRev = earthYear / 29.45 / 52;

  if (s != lastSecond) {
    rotMercury += mercuryRev;
    rotMars += marsRev;
    rotVenus -= venusRev;
    rotJupiter += jupiterRev;
    rotSaturn += saturnRev;

    lastSecond = s;
  }


  earth.run();
  moon.run();
}






/*
Stuff to make:
 +Sun
 +Earth (orbiting around sun)
 +Moon
 Moon (obriting around earth properly)
 Orbiting and rotation in real time
 */
