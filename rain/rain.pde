int BG_BRIGHTNESS = 255;
float MAX_RADIUS = 100;
int index = 0;
float SPEED = 2;
Drop drop;

void setup() {
  size(500, 500);
  noFill();
  background(BG_BRIGHTNESS, BG_BRIGHTNESS, BG_BRIGHTNESS);
  drop = new Drop(width / 2, height / 2);
}

class Drop {
  int x0, y0;
  float radius = 0;
  Drop(int x, int y) {
    x0 = x;
    y0 = y;
  }
  void update() {
    radius += SPEED;
    float alpha = 255 * (1 - radius / MAX_RADIUS);
    stroke(0, 0, 255, alpha);
    ellipse(x0, y0, radius, radius);
  }
}

void draw() {
  if (index < 1000) {
    background(BG_BRIGHTNESS, BG_BRIGHTNESS, BG_BRIGHTNESS);
    drop.update();
  } else {
    noLoop();
  }
}
