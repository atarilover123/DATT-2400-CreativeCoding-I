int cols = 50;
int rows = 30;

int stepx, stepy;

void setup() {
  fill(255);

  size(600, 600);
  stepx = (width / cols);
  stepy = (height / rows);
}

void draw() {
  background(0);

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {

      rect(x * stepx, y*stepy, stepx, stepy);
    }
  }
}
