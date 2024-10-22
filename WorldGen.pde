final int VOID = #000000;
final int PLAY_AREA = #FFFFFF;
final int PLAYER1_SPAWN = #0000FF;
final int PLAYER2_SPAWN = #00FF00;
final int COIN = #FFFF00;
final int BIG_COIN = #FF8800;
final int DEATH_TRAP = #FF0000;
final int OXYGEN = #00FFFF;
final int BUTTON = #FF00FF;
final int PORTAL = #FF0088;
final int GATE_LEFT = #000060;
final int GATE_RIGHT = #000068;

int[][] loadMap(String file) {
  PImage minimap = loadImage(file);
  String treasurePercentage = treasureCount[treasureCountIndex].replace("%", "");

  int[][] grid = new int[minimap.height][minimap.width];
  for (int i = 0; i < minimap.pixels.length; i++) {
    int x = i % minimap.width;
    int y = i / minimap.width;

    int pixel = minimap.pixels[i];
    switch(pixel) {
    case PLAY_AREA:
      grid[y][x] = 0;
      break;
    case VOID:
      grid[y][x] = 14;
      break;
    case PLAYER1_SPAWN:
      grid[y][x] = 0;
      player1Pos = new PVector(x, y);
      break;
    case PLAYER2_SPAWN:
      grid[y][x] = 0;
      player2Pos = new PVector(x, y);
      break;
    case COIN:
      if (random(100) < int(treasurePercentage)) {
        grid[y][x] = 100;
      } else {
        grid[y][x] = 0;
      }
      break;
    case BIG_COIN:
      if (random(100) < int(treasurePercentage)) {
        grid[y][x] = 200;
      } else {
        grid[y][x] = 0;
      }
      break;
    case DEATH_TRAP:
      grid[y][x] = 500;
      break;
    case OXYGEN:
      grid[y][x] = 400;
      break;
    case BUTTON:
      grid[y][x] = 300;
      break;
    case PORTAL:
      grid[y][x] = 600;
      break;
    case GATE_LEFT:
      grid[y][x] = 799;
      break;
    case GATE_RIGHT:
      grid[y][x] = 899;
      break;
    default:
      // Trick from https://processing.org/reference/rightshift.html
      int r = (pixel & 0xFF0000) >> 16;
      int g = (pixel & 0x00FF00) >> 8;
      int b = pixel & 0x0000FF;

      //Check if pixel is grayscale
      if (r == g && g == b) {
        //divide by 8 to get the correct tile index
        grid[y][x] = b / 8;
      }
      break;
    }
  }

  // grid[20][6] = 900;

  return grid;
}
