// F(t) = a * sin((omega * t) + phi)

void setup() {
  size(720, 360);
}

float f;
float amp = 140;
float omega = 1;
float phi = 0;


float tx = -999, ty = -999;

void draw() {
  background(254);
  for (int t = 0; t < 360*2; t++) {
    phi-=0.01;
    //  offset +  amplitude  * sin of omega * t(ime) + phi(phase)
    f = 180    +  amp        * sin(radians(t*(omega/2)+phi));
    //f = 180 + t*(omega*0.1) * sin(radians(t*(omega/2)+phi));

    //keeps the line nice
    if (tx < (360*2)-1) {
      line(t, f, tx, ty);
      tx = t;
      ty = f;
    } else {
      tx = 0;
      ty = 0;
    }

    ellipse(t, f, 2, 2);
  }
  noLoop();
}
