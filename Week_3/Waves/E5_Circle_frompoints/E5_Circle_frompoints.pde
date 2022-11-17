int cx;
int cy;
int num = 60;

void setup() {
  size(600, 600);
  cx = width/2;
  cy = height/2;
  strokeWeight(2);
}

int rad = 200;

void draw() {

  for (int angle = 0; angle < 360; angle++) {

    //basic circle
    float x = cx + (rad * cos(angle));
    float y = cy + (rad * sin(angle));

    //evenly spaced
    //float x = cx + (rad * cos(angle * TWO_PI/num));
    //float y = cy + (rad * sin(angle * TWO_PI/num));
    point(x, y);
  }
  noLoop();
}
