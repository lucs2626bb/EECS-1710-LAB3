class Controls {
  
  //Determine the direction of the beat with an integer
  int direction = 0;
}

void keyPressed() {
    if (key == 'w') {
      //println("NORTH");
      controls.direction = 1;
    } else if (key == 's') {
      //println("SOUTH");
      controls.direction = 2;
    } else if (key == 'a') {
      //println("WEST");
      controls.direction = 3;
    } else if (key == 'd') {
      //println("EAST");
      controls.direction = 4;
    }
    //println(controls.direction); 
    text.tutorial = false;
  }
