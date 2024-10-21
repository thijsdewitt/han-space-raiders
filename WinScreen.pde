void drawWinScreen() {
  background(0);
  fill(255);
  textFont(tiny5);
  textAlign(CENTER, CENTER);
  text("YOU WIN", width / 2, height / 2);
  text("Press any key to restart", width / 2, height / 2 + 64);
}

void mouseClickedWinScreen() {
  setupGameSetupScreen();
  screen = SCREEN_GAME_SETUP;
}
