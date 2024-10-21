boolean isPlayer1Moving = false;
int player1Direction = 1;

PImage[][] player1Running;
PImage[][] player1Idle;

// position is relative to grid
PVector player1Pos = new PVector(13, 29);
PVector player1Dest;

boolean isPlayer1Alive = false;
float player1Oxygen = 0;
int player1Score = 0;

void resetPlayer1Oxygen() {
  player1Oxygen = millis() + MAX_OXYGEN;
}

void setupPlayer1() {
  resetPlayer1Oxygen();
  player1Dest = player1Pos.copy();
  isPlayer1Alive = true;
  player1Running = getPlayerImages(loadImage("assets/images/player1_moving.png"), 16, 17);
  player1Idle = getPlayerImages(loadImage("assets/images/player1_idle.png"), 16, 16);
}

void drawPlayer1() {
  if (!INFINITE_OXYGEN && player1Oxygen < millis()) {
    player1Death();
    return;
  }

  if (!GODMODE && !isPlayer1Alive) {
    return;
  }

  isPlayer1Moving = player1Pos.dist(player1Dest) > 1.0 / (frameRate / 4);

  if (isPlayer1Moving) {
    PVector diff = player1Dest.copy().sub(player1Pos);
    PVector prevPos = player1Pos.copy();
    player1Pos.add(diff.copy().normalize().div(frameRate / 4));
    // only send move event if player actually moved to a new tile
    if (round(player1Pos.x) != round(prevPos.x) || round(player1Pos.y) != round(prevPos.y)) {
      onMove(1, round(player1Pos.x), round(player1Pos.y));
    }
  }

  PVector pos = player1Pos.copy().mult(UNIT);

  // draw 8 frames per second;
  int tile = millis() / 125 % 8;
  if (isPlayer1Moving) {
    image(player1Running[player1Direction][tile], pos.x, pos.y, 16 * SCALE, 17 * SCALE);
  } else {
    image(player1Idle[player1Direction][tile], pos.x, pos.y, 16 * SCALE, 16 * SCALE);
  }

  rectMode(CORNER);
  noStroke();
  fill(BLACK);
  rect(pos.x, pos.y - 4 * SCALE, 16 * SCALE, 2 * SCALE);
  fill(BLUE);
  rect(pos.x, pos.y - 4 * SCALE, constrain(16 * SCALE * (player1Oxygen - millis()) / MAX_OXYGEN, 0, 16 * SCALE), 2 * SCALE);
}

void keyPressedPlayer1() {
  if (isPlayer1Moving) return;

  switch(key) {
  case 'w':
    player1Direction = 2;
    while (beforeMove(player1Dest.x, player1Dest.y - 1)) {
      player1Dest.y--;
    }
    break;
  case 'd':
    player1Direction = 1;
    while (beforeMove(player1Dest.x + 1, player1Dest.y)) {
      player1Dest.x++;
    }
    break;
  case 's':
    player1Direction = 0;
    while (beforeMove(player1Dest.x, player1Dest.y + 1)) {
      player1Dest.y++;
    }
    break;
  case 'a':
    player1Direction = 3;
    while (beforeMove(player1Dest.x - 1, player1Dest.y)) {
      player1Dest.x--;
    }
    break;
  default:
    break;
  }
}

void player1Death() {
  if (!GODMODE && isPlayer1Alive) {
    audio_death.play();
    isPlayer1Alive = false;
  }
}

void player1Win() {
  if (isPlayer1Alive) {
    isPlayer1Alive = false;
    screen = SCREEN_WIN;
  }
}
