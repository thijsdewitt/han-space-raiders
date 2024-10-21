import processing.sound.SoundFile;

final int SCREEN_START = 0;
final int SCREEN_GAME_SETUP = 1;
final int SCREEN_GAME = 2;
final int SCREEN_END = 3;
final int SCREEN_HIGHSCORES = 4;
final int SCREEN_WIN = 5;

// scale factor for assets (default 16x16); will be recalulcated on setupGameScreen
float SCALE = 4;
float UNIT = 16 * SCALE;

int screen = SCREEN_START;

void setup() {
  size(1200, 900);
  noSmooth();
  fullScreen(2);

  setupAssets();
  setupStartScreen();
}

void draw() {
  switch(screen) {
  case SCREEN_START:
    drawStartScreen();
    break;
  case SCREEN_GAME_SETUP:
    drawGameSetupScreen();
    break;
  case SCREEN_GAME:
    drawGameScreen();
    break;
  case SCREEN_END:
    drawEndScreen();
    break;
  case SCREEN_HIGHSCORES:
    drawHighScoresScreen();
    break;
  case SCREEN_WIN:
    drawWinScreen();
    break;
  default:
    drawGameSetupScreen();
    break;
  }
}

void mouseClicked() {
  switch(screen) {
  case SCREEN_START:
    mouseClickedStartScreen();
    break;
  case SCREEN_GAME_SETUP:
    mouseClickedGameSetupScreen();
    break;
  case SCREEN_GAME:
    mouseClickedGameScreen();
    break;
  case SCREEN_END:
    mouseClickedEndScreen();
    break;
  case SCREEN_HIGHSCORES:
    mouseClickedHighScoresScreen();
    break;
  case SCREEN_WIN:
    mouseClickedWinScreen();
    break;
  default:
    mouseClickedGameSetupScreen();
    break;
  }
}

void keyPressed() {
  switch(screen) {
  case SCREEN_GAME:
    keyPressedGameScreen();
    break;
  default:
    break;
  }
}
