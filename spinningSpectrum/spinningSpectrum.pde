int FRAMES = 360;
int LINES = 180;
int BASE_LEN = 240;
int BG_BRIGHTNESS = 100;
int index = 0;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  strokeCap(ROUND);
  strokeWeight(3.0);
}

void drawCircle(int theta) {
  background(0, 0, BG_BRIGHTNESS);
  for (int l = 0; l < 360; l += 5) {
    float angle = (l + theta) % 360;
    float len = BASE_LEN * sin(rad(l));
    drawSpoke(len, angle);
  }
}

void drawSpoke(float len, float degrees) {
  if (len < 0) {
    return;
  }
  float wZero = width / 2;
  float hZero = height / 2;
  float theta = rad(degrees);
  stroke(degrees, 100, 100);
  line(wZero, hZero, wZero +  len * sin(theta), hZero + len * cos(theta));
}

void draw() {
  if (index < FRAMES) {

    drawCircle(index);
    index = index + 5;
  } else {
    noLoop();
  }
  saveFrame("../.out/image-###.gif");
}

float rad(float deg) {
  return deg * TWO_PI / 360;
}

float deg(float rad) {
  return rad * 360 / TWO_PI;
}
