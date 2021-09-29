/*
Lucas Bellotto
 EECS 1710
 Sept 29th 2021
 */

//Nick fox gieg: ClassExample01 (github) https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week03/ClassExample01/ClassExample01.pde
Tree tree;
Sun sun;

PVector pos1, pos2;
PShape shp;
PImage cloud;
//colours (bg)
float skyColour = 255;
int grassColour = color(12, 210, 100);
float sunColour = color(239, 247, 22);
//clouds
float x, y;
float speedC = 1;

void setup() {
  //nick fox-gieg: classExample01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week03/ClassExample01
  tree = new Tree();
  sun = new Sun();
  
  //nick fox-gieg: background 01 https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week03/Background01
  size(640, 480, P2D);
  pos1 = new PVector(width, 300);
  pos2 = new PVector(width, height/2);
  
  cloud = loadImage("cloud1.png");
  imageMode(CENTER);
  //jason ikeowu
  cloud.resize((cloud.width * (height / cloud.height)), height/4);
  x = width/2;
  y = height/2;

  background(162, 242, skyColour);
  //background(162, 242, 255);

  fill(grassColour);
  rectMode(CENTER);
  ellipseMode(CENTER);
  stroke(grassColour);
  rect(0, height, width, height);  
  //nick fox-geig Drawing example 03 https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week02/Drawing03

  shp = createShape();
  shp.beginShape();
  //river
  shp.stroke(grassColour);
  shp.fill(grassColour);
  shp.vertex(pos1.x, pos1.y);
  shp.vertex(pos2.x, pos2.y);
  shp.vertex(width/2, height/2);
  shp.endShape();
  //Solution: make sure values for color and int are the same for the color variable
  
  tree.draw();
  tree.setup();
  sun.setup();
}

void draw() {
  frameRate(60);         
  strokeWeight(20);
  //stroke(255,0,0);
  point(pos1.x, pos1.y);
  point(pos2.x, pos2.y);

  strokeWeight(10);
  stroke(0, 255, 0);
  line(pos1.x, pos1.y, pos2.x, pos2.y);
  shape(shp);
  
  //Nick Fox Gieg (Background01) https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week03/Background01/Background01.pde
  rectMode(CENTER);
  noStroke();
  fill(162, 242, skyColour);
  rect(width/2, height/12, width, 100);
  
  x += speedC;
  if (x > width) {
    speedC *= -1;
  } else if (x < 0) {
    speedC = abs(speedC);
  }
  //image(cloud, x, y, cloud.width * (height / cloud.height), height);  //resizes the image correctly
  image(cloud, x, y - 200);  //resizes the image correctly

  /* Problem: background is flashing rapidly instead of smoothly transitioning to a diffrent colour
   only do this for "objects", not the foreground
   */
   
  //nick fox-gieg: background 01
  //Day/night cycle

  /*
  background(162, 242, skyColour);
   
   skyColour += speedX;
   if (skyColour > 255) {
   skyColour--;
   speedX *= -1;
   } else if (skyColour < 0) {
   skyColour++;
   speedX *= -1;
   }
   */
}


/*
Inspiration: 
 Sapari community place (Honjio village)
 ENA: Temptation Stairway
 
 Ideas/stuff to do:
 SORT OF DONE - day/night cycle (colour changing BG)
 DONE - trees
 BROKEN "NullerExceptionPoint" - fix terrain (load terrain and all othe robjects constantly in another "class" (named ground, plants and objects respectively) )
 moving objects
 
 
 */
