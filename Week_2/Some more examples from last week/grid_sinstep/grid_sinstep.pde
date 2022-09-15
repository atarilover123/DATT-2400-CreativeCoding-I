//click the canvas to see what happens

int cols = 100;
int rows = 30;

int stepx, stepy;

float rv = 0;

void setup() {
  fill(255);
  noStroke();

  size(600, 600);
  stepx = (width / cols);
  stepy = (height / rows);
}

void draw() {
  background(0);

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      stepx = int(stepx+(sin(y+rv)*10));

      rect(x * stepx, y*stepy, stepx/2, stepy/2);
    }
  }
}

void mousePressed() {
  rv = random(10);
}
