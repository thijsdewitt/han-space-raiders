float[] highScoresBackButtonProps = new float[4];
String[][] highscores;

void setupHighscoresScreen() {
  highscores = loadHighscores();
}

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

  for (int highscoreIndex = 0; highscoreIndex < highscores.length; highscoreIndex++) {
    String[] highscore = highscores[highscoreIndex];
    textSize(48);
    fill(BLACK);
    text(highscore[0] + " " + highscore[1], width / 2, height * 0.5 + highscoreIndex * 48);
    fill(WHITE);
    text(highscore[0] + " " + highscore[1], width / 2, height * 0.5 + highscoreIndex * 48 - 8);
  }
}

void mouseClickedHighScoresScreen() {
  if (isMouseOver(highScoresBackButtonProps)) {
    audio_pickup_coin.play();
    screen = SCREEN_START;
  }
}

String[][] loadHighscores() {
  String[] lines = loadStrings("highscores.txt");
  String[][] highscores = new String[lines.length][2];
  for (int i = 0; i < lines.length; i++) {
    String[] parts = split(lines[i], '|');
    highscores[i] = parts;
  }
  return highscores;
}
