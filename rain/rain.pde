int FRAMES = 100;
int TOTAL_DROPS = 30;

float SPREAD_SPEED = 2;
int BG_BRIGHTNESS = 255;
float MAX_RADIUS = 100;
float AFTERDROP_INTENSITY = 0.3;

int SIZE = 500;
int PADDING = 5;
int LOWER_BOUND = PADDING;
int UPPER_BOUND = SIZE - PADDING;

int frame = 0;
ArrayList<Drop> drops = new ArrayList<Drop>();


float mod(float n, float d) {
  return ((n % d) + d) % d;
}


void setup() {
  size(500, 500); // can't use size() with variables
  noFill();
  print(mod(3 - 997, FRAMES));
  background(BG_BRIGHTNESS, BG_BRIGHTNESS, BG_BRIGHTNESS);
  for (int i = 0; i < TOTAL_DROPS; i++) {
    int x = int(random(LOWER_BOUND, UPPER_BOUND));
    int y = int(random(LOWER_BOUND, UPPER_BOUND));
    int entranceFrame = int(random(FRAMES));
    drops.add(new Drop(x, y, entranceFrame, 1.0));
    drops.add(new Drop(x, y, entranceFrame + 10, 0.8));
  }
}


class Drop {
  int x, y, entranceFrame;
  float intensity;
  Drop(int x0, int y0, int entrance, float inten) {
    x = x0;
    y = y0;
    entranceFrame = entrance;
    intensity = inten;
  }

  float getRadius() {
    int lifetime = mod((frame - entranceFrame), FRAMES)
    return lifetime * SPREAD_SPEED;
  }

  void update() {
    float radius = getRadius();
    if (0 < radius && radius < MAX_RADIUS) {
      drawDrop(radius);
    }
  }

  void _setColor(float radius, float intensity) {
    float alpha = 255 * intensity * (1 - radius / MAX_RADIUS);
    stroke(0, 0, 255, alpha);
  }

  void drawDrop(float radius) {
    _setColor(radius, intensity);
    ellipse(x, y, radius, radius);
  }
}

void draw() {
  if (frame < FRAMES) {
    frame++;
    background(BG_BRIGHTNESS, BG_BRIGHTNESS, BG_BRIGHTNESS);
    for (Drop d : drops) {
      d.update();
    }
  } else {
    noLoop();
  }
  saveFrame("../.out/image-####.gif");
}
