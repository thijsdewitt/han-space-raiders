float[] playAgainButtonProps = new float[4];
int winScreenPlayer = 0;

void setupWinScreen(int player) {
  winScreenPlayer = player;

  // save highscore and name to file
  if (player == 1) {
    saveHighscore(player1Score);
  } else {
    saveHighscore(player2Score);
  }
}

void drawWinScreen() {
  background(PRIMARY_950);

  textAlign(CENTER, CENTER);
  textSize(96);

  stroke(WHITE);
  strokeWeight(3);

  fill(BLACK);
  text("YOU WIN!", width / 2, height * 0.3);
  fill(WHITE);
  text("YOU WIN!", width / 2, height * 0.3 - 8);
  textSize(32);
  // TODO: Change this to your name
  // text("THIJS", width / 2, height * 0.3 + 56);

  int score = winScreenPlayer == 1 ? player1Score : player2Score;
  textSize(48);
  fill(BLACK);
  text("Score " + score, width / 2, height * 0.5);
  fill(WHITE);
  text("Score " + score, width / 2, height * 0.5 - 8);

  textSize(48);
  startButtonProps[BUTTON_X] = width / 2;
  startButtonProps[BUTTON_Y] = height * 0.6;
  startButtonProps[BUTTON_WIDTH] = textWidth("PLAY AGAIN") + 48;
  startButtonProps[BUTTON_HEIGHT] = 48 * 1.5;

  fill(PRIMARY_600);
  if (isMouseOver(startButtonProps)) {
    fill(PRIMARY_700);
  }
  drawButton("PLAY AGAIN", startButtonProps);
}

void mouseClickedWinScreen() {
  if (isMouseOver(startButtonProps)) {
    audio_pickup_coin.play();
    setupStartScreen();
    screen = SCREEN_START;
  }
}

void saveHighscore(int score) {
  String[] lines = loadStrings("highscores.txt");
  String[] newLines = new String[lines.length + 1];
  for (int i = 0; i < lines.length; i++) {
    newLines[i] = lines[i];
  }
  newLines[lines.length] = "THIJS" + "|" + score;
  saveStrings("highscores.txt", newLines);
}
