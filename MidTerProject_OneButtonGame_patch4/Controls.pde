//Key controls in processing:  https://processing.org/reference/keyPressed_.html
void keyPressed() {
  if (key == ' ') {
    player.shoot();
    gamestate.msg = "";
  }
}
