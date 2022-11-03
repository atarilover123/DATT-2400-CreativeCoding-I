void setup() {
  size(700, 700);

  background(0);
}


void draw() {

  if (mousePressed) {
    background(0);
    fill(255);
    circ(width/2, height/2, 300);

    //noFill();
    //stroke(255);
    //circ2(width/2,height/2, 500, 20);
  }
}

void circ(float x, float y, int cs) {

  ellipse(x, y, cs, cs);
}
