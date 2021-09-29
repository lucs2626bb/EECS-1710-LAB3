//nick fox-gieg: classExample01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week03/ClassExample01
/*
class Sun {
 
 //float sunColour = color(239, 247, 22);
 float sunColour;
 Sun(float sunColour) {
 this.colour = colour;
 }
 
 void setup() {
 //sun
 //sun.colour = color(239, 247, 22);  //The variable "colour" does not exist
 fill(sunColour);
 stroke(sunColour);
 ellipse(width/2, (((height/2) / 2) + 20), 30, 30);
 } 
 
 }
 */

/*
class Sun {
 
 float sunColour = color(239, 247, 22);
 
 Sun() {
 
 }
 
 void setup() {
 //sun
 fill(sunColour);
 stroke(sunColour);
 ellipse(width/2, (((height/2) / 2) + 20), 30, 30);
 } 
 
 }
 */

/*
"Variable type 'color' doesn't work when using processing 3.5.3 in intellij" 
answered by Kevin Workman  
https://stackoverflow.com/questions/54790664/variable-type-color-doesnt-work-when-using-processing-3-5-3-in-intellij
(Bug where the color variable does not work inside the class)
*/

//The sun is randomly generated
class Sun {

  int sunColour;

  Sun() {
    //sunColour =  color(239, 247, 22);
  }

  void setup() {
    //sun
    sunColour = int(random(0, 355));
    colorMode(RGB);
    sunColour = color(255, sunColour, 50);
    fill(sunColour);
    stroke(sunColour);
    ellipse(width/2, (((height/2) / 2) + 20), 30, 30);
  }
}
