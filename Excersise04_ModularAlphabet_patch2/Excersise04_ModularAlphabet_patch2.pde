float x, y;
char inputKey = ' ';

//Letters letters;
ArrayList<Letter> letters = new ArrayList();
//Letter lg1;

void setup() {
  size(1280, 720, P2D);

  x = 100;
  y = height/2;
  //letters = new Letters(inputKey, x, y);
  
  //lg1 = new Letter(inputKey, 0, height/2);
}

void draw() {
  background(16);
  
  background(127);
  
  //lg1.run();
  
}

//Character strings  https://processing.org/examples/charactersstrings.html
//Each key corresponds to a letter to be controlled in Letters();

void keyTyped() {
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    //inputKey = str(key);
    letters.add(new Letter(inputKey, x, y));
    
    //debug
    println(inputKey);
    println("Num of letters:  ", letters.size());
  }
}
