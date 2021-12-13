//https://processing.org/reference/libraries/sound/SoundFile.html
//https://forum.processing.org/two/discussion/16851/problem-with-sound-library
//Song: Chopin - Spring Waltz (Preformed by Toms Mucenieks) https://www.youtube.com/watch?v=EFJ7kDva7JE
import processing.sound.*;
SoundFile file;

void setup() {
  size(640, 360);
  background(255);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "waltzMono.mp3");
  file.play();
  file.loop();
  file.rate(1);
  //Audio only plays mono tracks, not stereo (convert stereo tracks audio)
}      

void draw() {
}
