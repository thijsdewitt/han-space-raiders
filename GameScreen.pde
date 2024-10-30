int[][] grid; //<>//
boolean isButtonPressed = false;
String gameMap;

void setupGameScreen(String map) {
  isButtonPressed = false;
  isPlayer1Alive = false;
  isPlayer2Alive = false;

  // reset gifs
  button.jump(0);
  gate_left.jump(0);
  gate_right.jump(0);

  gameMap = map;
  grid = loadMap("maps/" + map +".png");

  UNIT = constrain(calculateUnitSize(), 16, 64);
  SCALE = UNIT / 16;

  setupPlayer1();
  if (playerCount[playerCountIndex] == "2") {
    setupPlayer2();
  }
}

void drawGameScreen() {
  background(PRIMARY_950);

  if (!isPlayer1Alive && !isPlayer2Alive) {
    audio_background.pause();
    screen = SCREEN_END;
    return;
  }

  float gridWidth = grid[0].length * UNIT;
  float gridHeight = grid.length * UNIT;

  push();
  float translateX = (width - gridWidth) / 2;
  float translateY = (height - gridHeight) / 2;
  if (gridHeight > height) {
    translateY = constrain(height / 2 - player1Pos.y * UNIT, height - gridHeight, 0);
  }
  if (gridWidth > width) {
    translateX = constrain(width / 2 - player1Pos.x * UNIT, width - gridWidth, 0);
  }

  if (playerCount[playerCountIndex] == "2") {
    translateX = (width - gridWidth) / 2;
    translateY = (height - gridHeight) / 2;
  }
  translate(translateX, translateY);

  drawGrid(grid);

  drawPlayer1();
  if (playerCount[playerCountIndex] == "2") {
    drawPlayer2();
  }
  pop();

  drawControls();
  drawScore();
}

void drawControls() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(#22FFFFFF);
  float[] buttonProps = {60, 60, 40, 40};
  drawButton("W", buttonProps);

  fill(#22FFFFFF);
  buttonProps[BUTTON_X] += 60;
  drawButton("S", buttonProps);

  fill(#22FFFFFF);
  buttonProps[BUTTON_X] += 60;
  drawButton("A", buttonProps);

  fill(#22FFFFFF);
  buttonProps[BUTTON_X] += 60;
  drawButton("D", buttonProps);

  buttonProps[BUTTON_X] += 100;
  text("MOVE", buttonProps[BUTTON_X], buttonProps[BUTTON_Y]);

  if (playerCount[playerCountIndex] == "2") {
    fill(#22FFFFFF);
    buttonProps[BUTTON_X] = width - 60 - 40;
    drawButton("→", buttonProps);

    fill(#22FFFFFF);
    buttonProps[BUTTON_X] -= 60;
    drawButton("←", buttonProps);

    fill(#22FFFFFF);
    buttonProps[BUTTON_X] -= 60;
    drawButton("↓", buttonProps);

    fill(#22FFFFFF);
    buttonProps[BUTTON_X] -= 60;
    drawButton("↑", buttonProps);

    buttonProps[BUTTON_X] -= 100;
    text("MOVE", buttonProps[BUTTON_X], buttonProps[BUTTON_Y]);
  }
}

void drawScore() {
  if (playerCount[playerCountIndex] == "1") {
    fill(WHITE);
    textSize(30);
    textAlign(RIGHT, TOP);
    text("SCORE: " + player1Score, width - 60, 60);
    image(overlayTiles[1], width - 60 - textWidth("SCORE: " + player1Score) - 40, 56, 32, 32);
  } else {
    fill(WHITE);
    textSize(30);
    textAlign(LEFT, TOP);
    text("SCORE: " + player1Score, 72, 100);
    image(overlayTiles[1], 32, 96, 32, 32);

    fill(WHITE);
    textSize(30);
    textAlign(RIGHT, TOP);
    text("SCORE: " + player2Score, width - 60, 100);
    image(overlayTiles[1], width - 60 - textWidth("SCORE: " + player2Score) - 40, 96, 32, 32);
  }
}

void mouseClickedGameScreen() {
}

void keyPressedGameScreen() {
  keyPressedPlayer1();
  if (playerCount[playerCountIndex] == "2") {
    keyPressedPlayer2();
  }
}

// return true if the player can move, false otherwise
boolean beforeMove(float x, float y) {
  int cell = grid[int(y)][int(x)];
  return NOCLIP || (cell % 100 == 0) || (cell % 100 == 99 && isButtonPressed);
}

// called on every grid step
void onMove(int player, float x, float y) {
  int cell = grid[int(y)][int(x)];

  if (cell >= 100)
    switch(cell / 100) {
    case 1:
      if (player == 1) {
        player1Score += 1;
      } else {
        player2Score += 1;
      }
      audio_pickup_coin.play();
      grid[int(y)][int(x)] = cell % 100;
      break;
    case 2:
      if (player == 1) {
        player1Score += 5;
      } else {
        player2Score += 5;
      }
      audio_pickup_coin.play();
      grid[int(y)][int(x)] = cell % 100;
      break;
    case 3:
      if (isButtonPressed) {
        return;
      }

      isButtonPressed = true;
      audio_switch.play();

      button.play();
      gate_left.play();
      gate_right.play();
      break;
    case 4:
      if (player == 1) {
        resetPlayer1Oxygen();
      } else {
        resetPlayer2Oxygen();
      }
      audio_pickup_important.play();
      grid[int(y)][int(x)] = cell % 100;
      break;
    case 5:
      if (player == 1) {
        player1Death();
      } else {
        player2Death();
      }
      break;
    case 6:
      audio_portal.play();
      onMoveThroughPortal(player);
      break;
    case 9 :
      audio_steal_coins.play();
      if (player == 1) {
        player1Score /= 2;
      } else {
        player2Score /= 2;
      }
      grid[int(y)][int(x)] = cell % 100;
      break;
    default:
      break;
    }
}

float calculateUnitSize() {
  if (playerCount[playerCountIndex] == "2") {
    return height / grid.length;
  }

  return width / grid[0].length;
}

void drawGrid(int[][] grid) {
  for (int y = 0; y < grid.length; y++) {
    for (int x = 0; x < grid[y].length; x++) {
      int cell = grid[y][x];
      PImage tile = cell < tiles.length ? tiles[cell % 100] : tiles[0];
      image(tile, x * UNIT, y * UNIT, UNIT, UNIT);
      if (cell >= 100) {
        image(overlayTiles[cell / 100], x * UNIT, y * UNIT, UNIT, UNIT);
      }
    }
  }
}

void onMoveThroughPortal(int player) {
  switch (gameMap) {
  case "tutorial_0":
    setupGameScreen("tutorial_1");
    break;
  case "tutorial_1":
    setupGameScreen("tutorial_2");
    break;
  case "tutorial_2":
    screen = SCREEN_START;
    break;
  case "dust2":
    if (player == 1) {
      player1Win();
    } else {
      player2Win();
    }
    break;
  default:
    break;
  }
}
