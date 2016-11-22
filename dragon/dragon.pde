int ITERATIONS = 14;
int LEN = 2;
int NORTH = 0;
int EAST = 1;
int SOUTH = 2;
int WEST = 3;
int X_INIT = 500;
int Y_INIT = 450;
int STEPS = 100;
int BG = 230;
int frame = 0;
Dragon dragon = new Dragon();

void setup() {
  size(700, 700);
  stroke(0);
  for (int i = 0; i < ITERATIONS; i++) {
    dragon.iterate();
  }
}

class Dragon {
  IntList turns = new IntList();
  int dir = NORTH;
  int x = X_INIT;
  int y = Y_INIT;
  int stepNum = 0;

  Dragon() {
    turns.append(1);
  }

  void takeStep() {
    if (stepNum == turns.size()) {
      return;
    }
    int turn = turns.get(stepNum);
    dir = mod(dir + turn, 4);
    stepNum++;

    if (dir == NORTH) {
      goNorth();
    } else if (dir == EAST) {
      goEast();
    } else if (dir == SOUTH) {
      goSouth();
    } else {
      goWest();
    }
  }

  void go(int dx, int dy) {
    int newX = x + dx;
    int newY = y + dy;
    line(x, y, newX, newY);
    x = newX;
    y = newY;
  }

  void goNorth() { go(0, -LEN); }

  void goSouth() { go(0, LEN); }

  void goEast()  { go(LEN, 0); }

  void goWest()  { go(-LEN, 0); }

  void iterate() {
    IntList reversed = turns.copy();
    reversed.reverse();
    turns.append(1);
    for (int turn : reversed) {
      turns.append(turn * -1);
    }
  }
}

void draw() {
  if (dragon.stepNum < dragon.turns.size()) {
    for (int j = 0; j < STEPS; j++) {
      dragon.takeStep();
    }
    saveFrame("../.out/image-#####.gif");
  } else if (frame < dragon.turns.size() / STEPS + 50) {
    saveFrame("../.out/image-#####.gif");
  } else {
    noLoop();
  }
  frame++;
}