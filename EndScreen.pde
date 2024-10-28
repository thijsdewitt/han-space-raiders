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
}

void mouseClickedEndScreen() {
}
