void setup() {
  size(600, 600);
  noFill();
  stroke(255);
  strokeWeight(2);
  //ellipseMode(CENTER);
}

void draw() {
  background(0);

  float m = map(sin(frameCount*0.005), -1, 1, 0.1, 0.99);

  pushMatrix();

  translate(width/2, height/2);
  scale(0.15);
  fractal(width, m);
  popMatrix();
}

void fractal(float s, float cutoff) {

  s *= cutoff;
  if (s > 1) {

    pushMatrix();
    rotate(radians(s));
    ellipse(s, s, s*4, s*4);
    line(0, 0, 0, s*3);
    popMatrix();

    fractal(s, cutoff);
  }
}
