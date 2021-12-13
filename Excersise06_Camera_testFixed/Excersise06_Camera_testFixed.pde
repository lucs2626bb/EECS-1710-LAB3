//Fun Programming: "121. Using a webcam in Processing" https://funprogramming.org/121-Using-a-webcam-in-Processing.html
import processing.video.*;

Capture cam;

void setup() {
  size(1280, 720);
  //Processing fourm, neilcsmith:   https://discourse.processing.org/t/processing-cant-find-the-camera-video-libraries-dont-work/25128/13
  cam = new Capture(this, "pipeline:autovideosrc");
  cam.start();
  printArray(Capture.list());
}

void draw() {
  if (cam.available()) {
    cam.read();
  }
  image(cam, 0, 0);
}

/*
To use for Stero01:

import processing.video.*;
Capture capture1, capture2;
int videoWidth = 320;
int videoHeight = 240;
int videoFps = 30;

void setupCapture(int whichCamera1, int whichCamera2) {  
  String[] cameraNames = capture1.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  capture1 = new Capture(this, "pipeline:autovideosrc");
  capture1.start();
  
}


void captureEvent(Capture c) {
  c.read();
  if (c == capture1) {
    imgL = c;
    armUpdateL = true;
  } else {
    imgR = c;
    armUpdateR = true;
  }
}

*/
