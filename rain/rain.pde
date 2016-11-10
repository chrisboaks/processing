int BG_BRIGHTNESS = 255;
int FRAMES = 1000;
float MAX_RADIUS = 100;
int TOTAL_DROPS = 100;
float SPREAD_SPEED = 2;
float AFTERDROP_INTENSITY = 0.3;
int frame = 0;


int SIZE = 500;
int PADDING = 5;
int LOWER_BOUND = PADDING;
int UPPER_BOUND = SIZE - PADDING;
ArrayList<Drop> drops = new ArrayList<Drop>();
Drop drop;

void setup() {
  size(500, 500); // can't use size() with variables
  noFill();
  background(BG_BRIGHTNESS, BG_BRIGHTNESS, BG_BRIGHTNESS);
  // drop = new Drop(width / 2, height / 2);
  for (int i = 0; i < TOTAL_DROPS; i++) {
    drops.add(new Drop());
  }
}

// void initializeDrops() {
//   for (int i = 0; i < TOTAL_DROPS; i++) {
//     int randX =


//     drops.add(new Drop())
//   }
// }

class Drop {
  int x, y, entranceFrame;
  float radius;
  Drop() {
    x = int(random(LOWER_BOUND, UPPER_BOUND));
    y = int(random(LOWER_BOUND, UPPER_BOUND));
    entranceFrame = int(random(FRAMES));
  }

  void update() {
    radius = (frame - entranceFrame) * SPREAD_SPEED;
    if (0 < radius && radius < MAX_RADIUS) {
      draw();
    }
  }

  void draw() {
    _setColor(radius, 1);
    ellipse(x, y, radius, radius);

    float afterdropRadius = radius - 10 * SPREAD_SPEED;
    if (afterdropRadius > 0) {
      _setColor(afterdropRadius, AFTERDROP_INTENSITY);
      ellipse(x, y, afterdropRadius, afterdropRadius);
    }
  }

  void _setColor(float radius, float intensity) {
    float alpha = 255 * intensity * (1 - radius / MAX_RADIUS);
    stroke(0, 0, 255, alpha);
  }

}


void draw() {
  if (frame < FRAMES) {
    frame++;
    background(BG_BRIGHTNESS, BG_BRIGHTNESS, BG_BRIGHTNESS);
    for (Drop d : drops) {
      d.update();
    }
    //drop.update();
  } else {
    noLoop();
  }
}
