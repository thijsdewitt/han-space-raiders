void drawEndScreen() {
  background(BLACK);
  
  fill(WHITE);
  textSize(48);
  textAlign(CENTER, CENTER);
  
  text("GAME OVER", width / 2, height / 2 - 100);
  text("SCORE: " + player1Score, width / 2, height / 2);
}

void mouseClickedEndScreen() {
}
