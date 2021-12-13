/*
* Lucas Bellotto
* EECS 1710
* Dec 12th, 2021
* Final Project: Visual Instremunt
*
* Song used: Rythm n' Face: Swan Song 2000, Osamu Sato  https://www.youtube.com/watch?v=byvpTktqwiY
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

//Nick Fox Gieg, Instrument01    https://github.com/eecs17xx/eecs1710-2021f/commit/ad102be22ea32e0b767362bff71075e38174b24f#diff-cf1e8a41650adba6f7809c76487e05c70cf3148ee5494c8e6f842405472469c6 
Controls controls;
Text text;

PVector pos;
PShape group;
float spikeBeat1, spikeBeat2, spikeBeat3, spikeBeat4 = 100;
float beatChange;
int cubeSize = 100;
int minor_cubeSize = cubeSize / 2;
float directColour;
ArrayList<Bubble> bubbles;

void setup() {
  size(800, 800, P3D);
  controls = new Controls();
  text = new Text();
  //DrawWavefromAndLevel  Minim library example (basics)
  minim = new Minim(this);
  song = minim.loadFile("swan_comp.mp3", 1024);  
  /*
  * Solution: edit mp3 w/ tag editor and remove ID3v2 tags,   PhiLho: https://forum.processing.org/one/topic/javasound-minim-error#25080000000304098.html
  * ID3 Remover:   https://sourceforge.net/projects/id3remover/
  * BeatDetect: http://code.compartmental.net/minim/beatdetect_class_beatdetect.html
  */
  beat = new BeatDetect();
  song.loop();
  
  bubbles = new ArrayList<Bubble>();

  drawShape();
}

void drawShape() {
  //Processing example: BeginEndContour
  //Create Object
  colorMode(HSB);
  color hole = color(128, 255, 100); 

  group = createShape(GROUP);  //GroupPShape Pshape processing example

  PShape cube = createShape();
  cube = createShape();
  cube.beginShape();
  cube.fill(directColour - beatChange, 255, 100);
  cube.stroke(255);
  cube.strokeWeight(2);
  //Edges
  cube.vertex(-100 - beatChange, -100 - beatChange);
  cube.vertex(100 + beatChange, -100 - beatChange);
  cube.vertex(100 + beatChange, 100 + beatChange);
  cube.vertex(-100 - beatChange, 100 + beatChange); 
  //"in between" points
  cube.beginContour();
  cube.fill(hole);
  cube.vertex(0, (-1 * spikeBeat1));  //x, y
  cube.vertex(spikeBeat4, 0);
  cube.vertex(0, spikeBeat2);
  cube.vertex((-1 * spikeBeat3), 0);
  cube.endContour();
  cube.endShape(CLOSE);

  group.addChild(cube); //GroupPShape Pshape processing example
}

void determineSize() {
  //Effects of pitch

  //beats correpond to the direction

  //BeatDetect: http://code.compartmental.net/minim/beatdetect_class_beatdetect.html
  if (controls.direction == 1) {  //north
    if ( beat.isOnset() ) {
      spikeBeat1 = cubeSize * 2.5;
      bubbles.add(new Bubble(width/2 + int(random(-50, 50)), int(random(220)) ) );
    }
    spikeBeat1 *= 0.95;
    if ( spikeBeat1 < minor_cubeSize ) { 
      spikeBeat1 = minor_cubeSize;
    } 
  } else if (controls.direction == 2) {  //south
    if ( beat.isOnset() ) {
      spikeBeat2 = cubeSize * 2.5;
      bubbles.add(new Bubble(width/2 + int(random(-50, 50)), height/2 + int(random(220, 475)) ) );
    }
    spikeBeat2 *= 0.95;
    if ( spikeBeat2 < minor_cubeSize ) { 
      spikeBeat2 = minor_cubeSize;
    }
  } else if (controls.direction == 3) {  //west
    if ( beat.isOnset() ) {
      spikeBeat3 = cubeSize * 2.5;
      bubbles.add(new Bubble(width/2 - int(random(120, 475)), height/2 + int(random(-50, 50))) );
    }
    spikeBeat3 *= 0.95;
    if ( spikeBeat3 < minor_cubeSize ) { 
      spikeBeat3 = minor_cubeSize;
    }
  } else if (controls.direction == 4) {  //east
    if ( beat.isOnset() ) {
      spikeBeat4 = cubeSize * 2.5;
      bubbles.add(new Bubble(width/2 + int(random(120, 475)), height/2 + int(random(-50, 50))));
    }
    spikeBeat4 *= 0.95;
    if ( spikeBeat4 < minor_cubeSize ) { 
      spikeBeat4 = minor_cubeSize;
    }
  } 
}

void updateSpikeState() {
  if (controls.direction == 1) {
    directColour = 200;
    spikeBeat2 = minor_cubeSize;
    spikeBeat3 = minor_cubeSize;
    spikeBeat4 = minor_cubeSize;
  } else if (controls.direction == 2) {
    directColour = 50;
    spikeBeat1 = minor_cubeSize;
    spikeBeat3 = minor_cubeSize;
    spikeBeat4 = minor_cubeSize;
  } else if (controls.direction == 3) {  //west
    directColour = 128;
    spikeBeat1 = minor_cubeSize;
    spikeBeat2 = minor_cubeSize;
    spikeBeat4 = minor_cubeSize;
  } else if (controls.direction == 4) {  //east
    directColour = 255;
    spikeBeat1 = minor_cubeSize;
    spikeBeat2 = minor_cubeSize;
    spikeBeat3 = minor_cubeSize;
  }
  //println("Number of bubblies on da screen: ", bubbles.size());
}

void draw() {
  background(0);
  beat.detect(song.mix);
  drawShape();
  determineSize();
  updateSpikeState();
  text.run();
  
  beatChange = (song.left.level() * 100);
  
  //Nick Fox Geieg, Artillery03 and Bubble class https://github.com/eecs17xx/eecs1710-2021f/commit/6cf8595c4f29b268e4b5fdb33fa6c4b073905d51
  for (int i=bubbles.size()-1; i>=0; i--) {
    Bubble bubble = bubbles.get(i);
    
    if (bubble.isAlive) {
       bubble.run();
    } else {
      bubbles.remove(i);
    }
  }
  
  PShape cube = group.getChild(0);

  translate(width/2, height/2);
  shape(group);  //this has to be last

  //drawShape();

  //DrawWavefromAndLevel  Minim library example (basics)
}
