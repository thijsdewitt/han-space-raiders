void setupTutorialScreen() {
  textFont(tiny5);

  // apply settings for tutorial and go to first tutorial screen
  playerCountIndex = 1;
  badRaiderCountIndex = 4;
  treasureCountIndex = 4;

  setupGameScreen("tutorial_0");
}

float[] tutorialBackButtonProps = new float[4];

void drawTutorialScreen() {
  drawGameScreen();
  drawBackButton(tutorialBackButtonProps);
}

void mouseClickedTutorialScreen() {
  if (isMouseOver(tutorialBackButtonProps)) {
    audio_pickup_coin.play();
    setupStartScreen();
    screen = SCREEN_START;
  }
}

void keyPressedTutorialScreen() {
  keyPressedGameScreen();
}
