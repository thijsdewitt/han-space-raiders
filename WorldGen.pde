final int PIXEL_VOID = #000000;
final int PIXEL_PLAY_AREA = #FFFFFF;
final int PIXEL_PLAYER1_SPAWN = #0000FF;
final int PIXEL_PLAYER2_SPAWN = #00FF00;
final int PIXEL_COIN = #FFFF00;
final int PIXEL_BIG_COIN = #FF8800;
final int PIXEL_DEATH_TRAP = #FF0000;
final int PIXEL_OXYGEN = #00FFFF;
final int PIXEL_BUTTON = #FF00FF;
final int PIXEL_PORTAL = #FF0088;
final int PIXEL_GATE_LEFT = #000060;
final int PIXEL_GATE_RIGHT = #000068;
final int PIXEL_BAD_RAIDER = #B00000;

int[][] loadMap(String file) {
  PImage minimap = loadImage(file);
  String treasurePercentage = treasureCount[treasureCountIndex].replace("%", "");

  int[][] grid = new int[minimap.height][minimap.width];
  for (int pixelIndex = 0; pixelIndex < minimap.pixels.length; pixelIndex++) {
    int x = pixelIndex % minimap.width;
    int y = pixelIndex / minimap.width;

    int pixel = minimap.pixels[pixelIndex];
    switch(pixel) {
    case PIXEL_PLAY_AREA:
      grid[y][x] = 0;
      break;
    case PIXEL_VOID:
      grid[y][x] = 14;
      break;
    case PIXEL_PLAYER1_SPAWN:
      grid[y][x] = 0;
      player1Pos = new PVector(x, y);
      break;
    case PIXEL_PLAYER2_SPAWN:
      grid[y][x] = 0;
      player2Pos = new PVector(x, y);
      break;
    case PIXEL_COIN:
      if (random(100) < int(treasurePercentage)) {
        grid[y][x] = 100;
      } else {
        grid[y][x] = 0;
      }
      break;
    case PIXEL_BIG_COIN:
      if (random(100) < int(treasurePercentage)) {
        grid[y][x] = 200;
      } else {
        grid[y][x] = 0;
      }
      break;
    case PIXEL_DEATH_TRAP:
      grid[y][x] = 500;
      break;
    case PIXEL_OXYGEN:
      grid[y][x] = 400;
      break;
    case PIXEL_BUTTON:
      grid[y][x] = 300;
      break;
    case PIXEL_PORTAL:
      grid[y][x] = 600;
      break;
    case PIXEL_GATE_LEFT:
      grid[y][x] = 799;
      break;
    case PIXEL_GATE_RIGHT:
      grid[y][x] = 899;
      break;
    case PIXEL_BAD_RAIDER:
      grid[y][x] = 900;
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
