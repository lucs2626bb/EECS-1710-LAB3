//Gif Library:  https://github.com/akiljohnson1/GifAnimation

import gifAnimation.*;
Gif starbadGif;

//Nick Fox Gieg, Gravity01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Gravity01
int numParticles = 500;
Particle[] particles = new Particle[numParticles];

//https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery02/Artillery02.pde
ArrayList<Emeny> starbads;
Emeny[][] emenycount = new Emeny[10][4]; //10 across, 4 down
float x, y;

int markTime = 0;
int badinterval = 3000;

Player player;
GameState gamestate;

void setup() {
  size(800, 800, P2D);
  gamestate = new GameState();
  starbadGif = new Gif(this, "starShoot.gif");

  for (int i = 0; i < numParticles; i++) {
    particles[i] = new Particle(random(width), random(height));
  }

  player = new Player(width/2, height - 70);

  //Nick Fox Geig, artillery02   https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery02/Artillery02.pde
  starbads = new ArrayList<Emeny>();
  imageMode(CENTER);
}


void draw() {
  //Nick Fox Geig, artillery02   https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery02/Artillery02.pde
  colorMode(HSB);
  background(10);
  
  gamestate.run();
  
  for (int i=0; i<particles.length; i++) {
    Particle particle = particles[i];    //reduces RAM?
    particle.run();
  }

  
  if (millis() > markTime + badinterval) {
    for (int i = 0; i < 1; i ++) {
      starbads.add(new Emeny(x, y, starbadGif));  //Harrish. T (TA help)
      markTime = millis();
    }
  }


  player.run();

  for (int i=starbads.size()-1; i>=0; i--) {
    Emeny starbad = starbads.get(i);


    if (starbad.isAlive) {
      starbad.run();
    } else {
      starbads.remove(i);
    }
  }
}


//Nick Fox Geig, Artillery02  https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week07/Artillery02/Artillery02.pde
boolean hitDetectCircle(PVector p1, PVector p2, PVector hitbox) {
  hitbox = hitbox.copy().div(2);

  if (p1.x >= p2.x - hitbox.x && p1.x <= p2.x + hitbox.x && p1.y >= p2.y - hitbox.y && p1.y <= p2.y + hitbox.y) {
    return true;
  } else {
    return false;
  }
}
