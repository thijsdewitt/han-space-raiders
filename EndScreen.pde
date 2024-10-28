float[] tryAgainButtonProps = new float[4];

void drawEndScreen() {
  background(PRIMARY_950);

  textAlign(CENTER, CENTER);
  textSize(96);

  stroke(WHITE);
  strokeWeight(3);

  fill(BLACK);
  text("GAME OVER", width / 2, height * 0.3);
  fill(WHITE);
  text("GAME OVER", width / 2, height * 0.3 - 8);

  textSize(48);
  tryAgainButtonProps[BUTTON_X] = width / 2;
  tryAgainButtonProps[BUTTON_Y] = height * 0.5;
  tryAgainButtonProps[BUTTON_WIDTH] = textWidth("TRY AGAIN") + 48;
  tryAgainButtonProps[BUTTON_HEIGHT] = 48 * 1.5;

  fill(PRIMARY_600);
  if (isMouseOver(tryAgainButtonProps)) {
    fill(PRIMARY_700);
  }
  drawButton("TRY AGAIN", tryAgainButtonProps);
}

void mouseClickedEndScreen() {
  if (isMouseOver(tryAgainButtonProps)) {
    audio_pickup_coin.play();
    setupStartScreen();
    screen = SCREEN_START;
  }
}
