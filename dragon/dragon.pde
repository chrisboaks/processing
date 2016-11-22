int ITERATIONS = 14;
int LEN = 2;
int NORTH = 0;
int EAST = 1;
int SOUTH = 2;
int WEST = 3;
int X_INIT = 500;
int Y_INIT = 450;
int BG = 230;
int i = 0;
Dragon dragon = new Dragon();

void setup() {
  size(700, 700);
  stroke(0);
  //noLoop();
}

class Dragon {
  IntList turns = new IntList();
  int dir = NORTH;
  int x = X_INIT;
  int y = Y_INIT;
  
  void reset() {
    background(BG, BG, BG);
    x = X_INIT;
    y = Y_INIT;
    dir = NORTH;
  }
  
  Dragon() {
    turns.append(1);
  }
  
  void step(int turn) {
    dir = mod(dir + turn, 4);
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
  
  void goNorth() {
    go(0, -LEN); 
  }
  
  void goSouth() {
    go(0, LEN);
  }
  
  void goEast() {
    go(LEN, 0);
  }
  
  void goWest() {
    go(-LEN, 0);
  }
  
  void iterate() {
    IntList reversed = turns.copy();
    reversed.reverse();
    turns.append(1);
    for (int turn : reversed) {
      turns.append(turn * -1);
    }
  }
  
  void draw() {
    reset();
    for (int turn : turns) {
      step(turn);
    }
  }
}

void draw() {
  
  if (i < ITERATIONS) {
    dragon.iterate();
    dragon.draw();
    println(i, dragon.x, dragon.y);
    saveFrame("../.out/image-####.gif");
    i++;
  } else {
    noLoop();
  }
  
  //dragon.draw();
  
  
}