void setupStartScreen() {
  textFont(tiny5);
  audio_background.loop();
}

float[] startButtonProps = new float[4];
float[] highscoresButtonProps = new float[4];
float[] tutorialButtonProps = new float[4];

void drawStartScreen() {
  background(PRIMARY_950);

  textAlign(CENTER, CENTER);
  textSize(96);

  stroke(WHITE);
  strokeWeight(3);

  fill(BLACK);
  text("SPACE RAIDERS", width / 2, height * 0.3);
  fill(WHITE);
  text("SPACE RAIDERS", width / 2, height * 0.3 - 8);
  textSize(32);
  text("By THIJS", width / 2, height * 0.3 + 56);

  textSize(48);
  startButtonProps[BUTTON_X] = width / 2;
  startButtonProps[BUTTON_Y] = height * 0.5;
  startButtonProps[BUTTON_WIDTH] = textWidth("START GAME") + 48;
  startButtonProps[BUTTON_HEIGHT] = 48 * 1.5;
  fill(PRIMARY_600);
  if (isMouseOver(startButtonProps)) {
    fill(PRIMARY_700);
  }
  drawButton("START GAME", startButtonProps);

  highscoresButtonProps = startButtonProps.clone();
  highscoresButtonProps[BUTTON_Y] = height * 0.6;
  fill(PRIMARY_600);
  if (isMouseOver(highscoresButtonProps)) {
    fill(PRIMARY_700);
  }
  drawButton("HIGHSCORES", highscoresButtonProps);

  tutorialButtonProps = startButtonProps.clone();
  tutorialButtonProps[BUTTON_Y] = height * 0.8;
  fill(PRIMARY_600);
  if (isMouseOver(tutorialButtonProps)) {
    fill(PRIMARY_700);
  }
  drawButton("TUTORIAL", tutorialButtonProps);
}

void mouseClickedStartScreen() {
  if (isMouseOver(startButtonProps)) {
    audio_pickup_coin.play();
    setupGameSetupScreen();
    screen = SCREEN_GAME_SETUP;
  }

  if (isMouseOver(highscoresButtonProps)) {
    audio_pickup_coin.play();
    setupHighscoresScreen();
    screen = SCREEN_HIGHSCORES;
  }

  if (isMouseOver(tutorialButtonProps)) {
    audio_pickup_coin.play();
    setupTutorialScreen();
    screen = SCREEN_TUTORIAL;
  }
}
