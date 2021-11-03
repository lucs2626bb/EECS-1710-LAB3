class Letter {

  String input;
  PVector pos;  //position

  //Nick Fox Geig, Letter Generator  https://github.com/eecs17xx/eecs1710-2021f/commit/f98980edf3a930f88f88a2ab935ead0d52313e6f
  Letter(char inputKey, float x, float y) {  //inputKey is never used
    input = str(inputKey);
    pos = new PVector(x, y);


/*
    for (int i=0; i<input.length(); i++) {     

      //Nick Fox Geig, Letter Generator  https://github.com/eecs17xx/eecs1710-2021f/commit/f98980edf3a930f88f88a2ab935ead0d52313e6f    
      switch(inputKey) {
      case 'a':
        println("AAAAAAAAAA");
        //letters.add(new Letter(a, px, py));
        move();
        break;
      case 'b':
        println("BBBBBBBBBBB");
        //letters.add(new Letter(b, px, py));
        move();
        break;
      case 'c':
        println("CCCCCCCCCCCCCCCC");
        //letters.add(new Letter(c, px, py));
        move();
        break;
      }
      //These statements can't print
    }
   */ 
  }


void update() {
  
  for (int i=0; i<input.length(); i++) {     

      //Nick Fox Geig, Letter Generator  https://github.com/eecs17xx/eecs1710-2021f/commit/f98980edf3a930f88f88a2ab935ead0d52313e6f    
      switch(inputKey) {
      case 'a':
        println("AAAAAAAAAA");
        move();
        break;
      case 'b':
        println("BBBBBBBBBBB");
        move();
        break;
      case 'c':
        println("CCCCCCCCCCCCCCCC");
        move();
        break;
      }
    }
    println(inputKey);
}

void draw() {
  colorMode(HSB);
  fill(255, 255, 255);
  ellipse(pos.x, pos.y, 20, 20);
}

void move() {
  pos.x += 10;
}

void run() {
  draw();
  update();
}
}

/*
IDEAS:
 //Character Strings  https://processing.org/examples/charactersstrings.html
 //Typing on water, Mr. Doob`  https://mrdoob.com/#/123/water_type
 
 */
