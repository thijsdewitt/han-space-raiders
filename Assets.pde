SoundFile audio_background;
SoundFile audio_death;
SoundFile audio_pickup_coin;
SoundFile audio_pickup_important;
SoundFile audio_pickup_oxygen;
SoundFile audio_switch;
SoundFile audio_portal;
SoundFile audio_steal_coins;

PFont tiny5;

PImage[] tiles = {};
PImage[] overlayTiles = new PImage[10];

Gif coin;
Gif blue_coin;
Gif button;
Gif oxygen;
Gif spikes;
Gif portal;
Gif gate_left;
Gif gate_right;

void setupAssets() {
  audio_background = new SoundFile(this, "assets/audio/background.wav");
  audio_death = new SoundFile(this, "assets/audio/death.wav");
  audio_pickup_coin = new SoundFile(this, "assets/audio/pickup_coin.wav");
  audio_pickup_important = new SoundFile(this, "assets/audio/pickup_important.wav");
  audio_pickup_oxygen = new SoundFile(this, "assets/audio/pickup_oxygen.wav");
  audio_switch = new SoundFile(this, "assets/audio/switch.wav");
  audio_portal = new SoundFile(this, "assets/audio/portal.wav");
  audio_steal_coins = new SoundFile(this, "assets/audio/steal_coins.wav");

  tiny5 = createFont("assets/fonts/Tiny5-Regular.ttf", 128, false);

  PImage tileset = loadImage("assets/images/tileset.png");
  PImage blank = loadImage("assets/images/background.png");

  tiles = (PImage[]) append(tiles, blank);
  tiles = (PImage[]) concat(tiles, generateTiles(tileset, 6, 4, 32));

  coin = new Gif (this, "assets/images/coin.gif");
  blue_coin = new Gif (this, "assets/images/blue_coin.gif");
  button = new Gif (this, "assets/images/button.gif");
  oxygen = new Gif (this, "assets/images/oxygen.gif");
  spikes = new Gif (this, "assets/images/spikes.gif");
  portal = new Gif (this, "assets/images/portal.gif");
  gate_left = new Gif (this, "assets/images/gate_left.gif");
  gate_right = new Gif (this, "assets/images/gate_right.gif");
  coin.play();
  blue_coin.play();
  button.ignoreRepeat();
  oxygen.play();
  spikes.play();
  portal.play();
  gate_left.ignoreRepeat();
  gate_right.ignoreRepeat();

  overlayTiles[0] = null; // no overlay
  overlayTiles[1] = coin;
  overlayTiles[2] = blue_coin;
  overlayTiles[3] = button;
  overlayTiles[4] = oxygen;
  overlayTiles[5] = spikes;
  overlayTiles[6] = portal;
  overlayTiles[7] = gate_left;
  overlayTiles[8] = gate_right;
  overlayTiles[9] = loadImage("assets/images/bad_raider.png").get(0, 0, 16, 17);
}

PImage[] generateTiles(PImage tileset, int xCount, int yCount, int UNIT) {
  PImage[] tiles = new PImage[xCount * yCount];
  for (int y = 0; y < yCount; y++) {
    for (int x = 0; x < xCount; x++) {
      tiles[x + y * xCount] = tileset.get(x * UNIT, y * UNIT, UNIT, UNIT);
    }
  }

  return tiles;
}

PImage[][] getPlayerImages(PImage spritesheet, int playerWidth, int playerHeight) {
  PImage[][] images = new PImage[4][8];
  for (int y = 0; y < 4; y++) {
    for (int x = 0; x < 8; x++) {
      images[y][x] = spritesheet.get(x * playerWidth, y * playerHeight, playerWidth, playerHeight);
    }
  }

  return images;
}
