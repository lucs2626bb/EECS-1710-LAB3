/*
Project01: Bee Swarm
 
 Lucas Bellotto
 Oct 4th, 2021
 EECS 1710
 
 Bee and flower art were made in Piskel my me
 Use the mouse to attract bees
 */

import gifAnimation.*;

//Creature01, Nick Fox Geieg   https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week04/Creature01/Creature01.pde
int numBees = 50;
int numClouds = 3;
float flowerPos;

Gif flowerGif, beeGif;

Flower flowers;
Bees[] bees = new Bees[numBees];
Clouds[] clouds = new Clouds[numClouds];
Grass grass;


void setup() { 
  size(1280, 720, P2D);

  flowerGif = new Gif(this, "flower.gif");      //TA help: Harrish T (De bugging)
  beeGif = new Gif(this, "Bee.gif");

  flowers = new Flower(width/2, height/2, flowerGif);

  for (int i=0; i<bees.length; i++) {
    bees[i] = new Bees(random(width), random(height), beeGif);
  }

  for (int i=0; i<clouds.length; i++) {
    clouds[i] = new Clouds(random(width), random(height/2));
  }

  grass = new Grass(width/2, 0);
}

void draw() {
  colorMode(HSB);
  background(150, 128, 200);
  
  grass.run();
  
  for (int i=0; i<clouds.length; i++) {
    //clouds.run();
    clouds[i].run();
  }
  
  flowers.run();

  for (int i=0; i<bees.length; i++) {
    bees[i].run();
  }
  
}
