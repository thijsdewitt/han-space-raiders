void setupTutorialScreen() {
  textFont(tiny5);

  // apply settings for tutorial and go to first tutorial screen
  playerCountIndex = 1;
  badRaiderCountIndex = 4;
  treasureCountIndex = 4;

  setupGameScreen("tutorial_0");
  screen = SCREEN_GAME;
}
