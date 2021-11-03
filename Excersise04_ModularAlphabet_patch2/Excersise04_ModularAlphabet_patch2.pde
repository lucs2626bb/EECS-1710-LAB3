float x, y;
String inputKey = "a";

//Letters letters;
ArrayList<Letter> letters = new ArrayList();
Letter lg1, lg2, lg3;

void setup() {
  size(1280, 720, P2D);

  x = 100;
  y = height/2;
  //letters = new Letters(inputKey, x, y);
  
  lg1 = new Letter("a", 0, 0);
  lg2 = new Letter("b", 200, 50);
  lg3 = new Letter("c", 400, 100);
}

void draw() {
  background(16);
  
  background(127);
  
  lg1.draw();
  lg2.draw();
  lg3.draw();
  
}

//Character strings  https://processing.org/examples/charactersstrings.html
//Each key corresponds to a letter to be controlled in Letters();

void keyTyped() {
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    inputKey = str(key);
    letters.add(new Letter(inputKey, x, y));
    
    //debug
    println(inputKey);
    println("Num of letters:  ", letters.size());
  }
}
