int FRAMES = 300;
int SPOKE_COUNT = 9;
int WEIGHT = 40;
int WHITE = 255;
int LINE_LENGTH = 400;
int frame = 0;
Spoke s = new Spoke(0.0, 3.0);
ArrayList<Spoke> spokes = new ArrayList<Spoke>();


void setup() {
  size(500, 500);
  background(WHITE);
  stroke(WHITE);
  frameRate(12);
  strokeWeight(WEIGHT);
  blendMode(DIFFERENCE);
  for (int i = 0; i < SPOKE_COUNT; i++) {
    spokes.add(new Spoke(0, (i + 1) * 0.5));
  }

}

class Spoke {
  float angle;
  float turns;
  float dTheta;
  Spoke(float _angle, float _turns) {
    angle = _angle;
    //turns = _turns;
    dTheta = _turns * TWO_PI / FRAMES;
    //print(dTheta);
  }
  
  void draw() {
    pushMatrix();
    translate(width / 2, height / 2);
    
    float x = (LINE_LENGTH / 2) * sin(angle);
    float y = (LINE_LENGTH / 2) * cos(angle);
    line(x, y, -x, -y);
    
    
    popMatrix();
  }
  
  void update() {
    angle = angle + dTheta;
    //print(dTheta);
  }
  
  
}

void draw() {
  if (frame < FRAMES) {
    frame++;
    background(WHITE);
    for (Spoke s : spokes) {
      s.update();
      s.draw();
    }
  } else {
    noLoop();
  }
  //background(WHITE);
  //s.update();
  ////s.update();
  //s.draw();
}