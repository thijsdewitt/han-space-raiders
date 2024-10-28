float[] playAgainButtonProps = new float[4];

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

  textSize(48);
  startButtonProps[BUTTON_X] = width / 2;
  startButtonProps[BUTTON_Y] = height * 0.5;
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
