void setupHighscoresScreen() {
  // todo
}

float[] highScoresBackButtonProps = new float[4];


void drawHighScoresScreen() {
  background(PRIMARY_950);
  drawBackButton(highScoresBackButtonProps);

  textAlign(CENTER, CENTER);
  textSize(96);

  stroke(WHITE);
  strokeWeight(3);

  fill(BLACK);
  text("HIGHSCORES", width / 2, height * 0.3);
  fill(WHITE);
  text("HIGHSCORES", width / 2, height * 0.3 - 8);
}

void mouseClickedHighScoresScreen() {
  if (isMouseOver(highScoresBackButtonProps)) {
    audio_pickup_coin.play();
    screen = SCREEN_START;
  }
}
