import gifAnimation.*;

int buttonColor = #00aa00;

float[] startButton;

int playerCountIndex = 0;
String[] playerCount = {"1", "2"};

int badRaiderCountIndex = 0;
String[] badRaiderCount = {"2", "4", "6", "8", "10"};

int treasureCountIndex = 0;
String[] treasureCount = {"20%", "40%", "60%", "80%", "100%"};

void setupGameSetupScreen() {
  textFont(tiny5);
  audio_background.loop();

  fill(WHITE);
  textSize(48);
  stroke(WHITE);
  strokeWeight(3);
}

void drawGameSetupScreen() {
  background(PRIMARY_600);

  text("AANTAL SPELERS", width / 2, height * 0.3 - 60);
  playerCountIndex = drawButtonBar(width / 2, height * 0.3, playerCount, playerCountIndex);

  text("AANTAL BAD RAIDERS", width / 2, height * 0.45 - 60);
  badRaiderCountIndex = drawButtonBar(width / 2, height * 0.45, badRaiderCount, badRaiderCountIndex);

  text("AANTAL SCHATTEN", width / 2, height * 0.6 - 60);
  treasureCountIndex = drawButtonBar(width / 2, height * 0.6, treasureCount, treasureCountIndex);

  float[] _startButton = {width / 2, height * 0.8, textWidth("START SPEL") + 70, 70};
  startButton = _startButton;

  fill(PRIMARY_950);
  if (isMouseOver(startButton)) {
    fill(PRIMARY_900);
  }
  drawButton("START SPEL", startButton);

  image(coin, 200, 200, UNIT, UNIT);
  image(blue_coin, 200, 300, UNIT, UNIT);
}

void mouseClickedGameSetupScreen() {
  if (isMouseOver(startButton)) {
    setupGameScreen();
    screen = SCREEN_GAME;
  }
}
