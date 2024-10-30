float[] gameSetupstartButtonProps = new float[4];
float[] gameSetupBackButtonProps = new float[4];

int playerCountIndex = 0;
String[] playerCount = {"1", "2"};

int badRaiderCountIndex = 0;
String[] badRaiderCount = {"2", "4", "6", "8", "10"};

int treasureCountIndex = 0;
String[] treasureCount = {"20%", "40%", "60%", "80%", "100%"};

void setupGameSetupScreen() {
  textFont(tiny5);
}

void drawGameSetupScreen() {
  background(PRIMARY_950);

  fill(WHITE);
  textSize(48);
  stroke(WHITE);
  strokeWeight(3);

  text("AANTAL SPELERS", width / 2, height * 0.3 - 60);
  playerCountIndex = drawButtonBar(width / 2, height * 0.3, playerCount, playerCountIndex);

  text("AANTAL BAD RAIDERS", width / 2, height * 0.45 - 60);
  badRaiderCountIndex = drawButtonBar(width / 2, height * 0.45, badRaiderCount, badRaiderCountIndex);

  text("AANTAL SCHATTEN", width / 2, height * 0.6 - 60);
  treasureCountIndex = drawButtonBar(width / 2, height * 0.6, treasureCount, treasureCountIndex);

  gameSetupstartButtonProps[BUTTON_X] = width / 2;
  gameSetupstartButtonProps[BUTTON_Y] = height * 0.8;
  gameSetupstartButtonProps[BUTTON_WIDTH] = textWidth("START SPEL") + 70;
  gameSetupstartButtonProps[BUTTON_HEIGHT] = 70;
  fill(PRIMARY_600);
  if (isMouseOver(gameSetupstartButtonProps)) {
    fill(PRIMARY_700);
  }
  drawButton("START SPEL", gameSetupstartButtonProps);

  drawBackButton(gameSetupBackButtonProps);

  image(coin, 200, 200, UNIT, UNIT);
  image(blue_coin, 200, 300, UNIT, UNIT);
}

void mouseClickedGameSetupScreen() {
  if (isMouseOver(gameSetupstartButtonProps)) {
    audio_pickup_coin.play();
    setupGameScreen("dust2");
    screen = SCREEN_GAME;
  }

  if (isMouseOver(gameSetupBackButtonProps)) {
    audio_pickup_coin.play();
    setupStartScreen();
    screen = SCREEN_START;
  }
}
