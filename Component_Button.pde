final int BUTTON_X = 0;
final int BUTTON_Y = 1;
final int BUTTON_WIDTH = 2;
final int BUTTON_HEIGHT = 3;

void drawButton(String text, float[] buttonProps) {
  float x = buttonProps[BUTTON_X];
  float y = buttonProps[BUTTON_Y];
  float buttonWidth = buttonProps[BUTTON_WIDTH];
  float buttonHeight = buttonProps[BUTTON_HEIGHT];

  rectMode(CENTER);
  rect(x, y, buttonWidth, buttonHeight);
  fill(WHITE);
  textAlign(CENTER, CENTER);
  text(text, x+2, y);
}

boolean isMouseOver(float[] buttonProps) {
  float buttonWidth = buttonProps[BUTTON_WIDTH];
  float buttonHeight = buttonProps[BUTTON_HEIGHT];

  float x = buttonProps[BUTTON_X] - buttonWidth / 2;
  float y = buttonProps[BUTTON_Y] - buttonHeight / 2;

  boolean hover = (mouseX >= x && mouseX <= x + buttonWidth
    && mouseY >= y && mouseY <= y + buttonHeight);
  return hover;
}

int drawButtonBar(float x, float y, String[] labels, int active) {
  for (int i = 0; i < labels.length; i++) {
    String label = labels[i];
    float[] buttonProps = {(x - (100 * labels.length / 2)) + 50 + i * 100, y, 100, 60};
    fill(PRIMARY_600);
    if (isMouseOver(buttonProps)) {
      fill(PRIMARY_700);
    }
    if (i == active) {
      fill(SECONDARY_500);
    }
    drawButton(label, buttonProps);
    if (isMouseOver(buttonProps) && mousePressed) {
      active = i;
    }
  }

  return active;
}

int handleButtonBarClicked(String[] labels, int active) {
  for (int i = 0; i < labels.length; i++) {
    float[] buttonProps = {100 + i * 100, 100, 100, 60};
    if (isMouseOver(buttonProps)) {
      return i;
    }
  }
  return active;
}

void drawBackButton(float[] buttonProps) {
  textSize(32);
  textAlign(CENTER, CENTER);
  buttonProps[BUTTON_X] = 60;
  buttonProps[BUTTON_Y] = height - 60;
  buttonProps[BUTTON_WIDTH] = 40;
  buttonProps[BUTTON_HEIGHT] = 40;

  fill(#22FFFFFF);
  if (isMouseOver(buttonProps)) {
    fill(#55FFFFFF);
  }
  drawButton("<", buttonProps);
}