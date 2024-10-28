boolean isPlayer2Moving = false;
int player2Direction = 1;

PImage[][] player2Running;
PImage[][] player2Idle;

// position is relative to grid
PVector player2Pos = new PVector(12, 7);
PVector player2Dest;

boolean isPlayer2Alive = false;
float player2Oxygen = 0;
int player2Score = 0;

void resetPlayer2Oxygen() {
  player2Oxygen = millis() + MAX_OXYGEN;
}

void setupPlayer2() {
  player2Dest = player2Pos.copy();
  isPlayer2Alive = true;
  resetPlayer2Oxygen();
  player2Score = 0;
  player2Running = getPlayerImages(loadImage("assets/images/player2_moving.png"), 16, 17);
  player2Idle = getPlayerImages(loadImage("assets/images/player2_idle.png"), 16, 16);
}

void drawPlayer2() {
  if (!INFINITE_OXYGEN && player2Oxygen < millis()) {
    player2Death();
    return;
  }

  if (!GODMODE && !isPlayer2Alive) {
    return;
  }

  isPlayer2Moving = player2Pos.dist(player2Dest) > 0.125;

  if (isPlayer2Moving) {
    PVector diff = player2Dest.copy().sub(player2Pos);
    PVector prevPos = player2Pos.copy();
    player2Pos.add(diff.copy().normalize().div(frameRate / 4));

    // only send move event if player actually moved to a new tile
    if (round(player2Pos.x) != round(prevPos.x) || round(player2Pos.y) != round(prevPos.y)) {
      onMove(2, round(player2Pos.x), round(player2Pos.y));
    }
  }

  PVector pos = player2Pos.copy().mult(UNIT);

  // draw 8 frames per second;
  int tile = (millis() / 125 + 4) % 8;
  if (isPlayer2Moving) {
    image(player2Running[player2Direction][tile], pos.x, pos.y, 16 * SCALE, 17 * SCALE);
  } else {
    image(player2Idle[player2Direction][tile], pos.x, pos.y, 16 * SCALE, 16 * SCALE);
  }

  rectMode(CORNER);
  noStroke();
  fill(BLACK);
  rect(pos.x, pos.y - 4 * SCALE, 16 * SCALE, 2 * SCALE);
  fill(GREEN);
  rect(pos.x, pos.y - 4 * SCALE, constrain(16 * SCALE * (player2Oxygen - millis()) / MAX_OXYGEN, 0, 16 * SCALE), 2 * SCALE);
}

void keyPressedPlayer2() {
  if (isPlayer2Moving) return;

  switch(keyCode) {
  case UP:
    player2Direction = 2;
    while (beforeMove(player2Dest.x, player2Dest.y - 1)) {
      player2Dest.y--;
    }
    break;
  case RIGHT:
    player2Direction = 1;
    while (beforeMove(player2Dest.x + 1, player2Dest.y)) {
      player2Dest.x++;
    }
    break;
  case DOWN:
    player2Direction = 0;
    while (beforeMove(player2Dest.x, player2Dest.y + 1)) {
      player2Dest.y++;
    }
    break;
  case LEFT:
    player2Direction = 3;
    while (beforeMove(player2Dest.x - 1, player2Dest.y)) {
      player2Dest.x--;
    }
    break;
  default:
    break;
  }
}

void player2Death() {
  if (!GODMODE && isPlayer2Alive) {
    audio_death.play();
    isPlayer2Alive = false;
  }
}

void player2Win() {
  if (isPlayer2Alive) {
    isPlayer2Alive = false;
    screen = SCREEN_WIN;
  }
}
