//nick fox-gieg: classExample01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week03/ClassExample01
/*
The trees are randomly generated (height, position, and colour)
 */
class Tree {

  int trunkColour, bushColour;
  int trunkHeight, trunkX, trunkY;
  int bushSize;

  Tree() {
    //trunkColour = color(12, 210, 100);
  }


  void setup() {
    //tree trunk
    noStroke();
    
    for (int i=0; i<=10; i++) {
      trunkX = int(random(width/2 - 20));   
      trunkY = int(random(height/2, (height + 20)));  //prevents trees from generating in the lake and the sky
      
      trunkHeight = int(random(40, 100));  
      bushSize = int(random(10, 40));

      rectMode(CENTER);
      ellipseMode(RADIUS);
      colorMode(HSB);
      trunkColour = color(255, 12, 50);  
      bushColour = int(random(350));
      bushColour = color(bushColour, 100, 150);

      fill(trunkColour);
      rect(trunkX, trunkY, 10, trunkHeight);;
      fill(bushColour);
      ellipse((trunkX), (trunkY - trunkHeight/2), bushSize, bushSize * 0.75);  //centers leaves to tree trunk
    }
  }

  void draw() {

    /*
    for (int i=0; i<=10; i++) {
     trunkX = int(random(width/4));   
     trunkY = int(random(height));
     trunkHeight = int(random(40, 100));   
     }
     */
  }
}
