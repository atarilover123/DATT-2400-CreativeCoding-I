mysin[] sin;
int num = 24;
int step;

void setup() {
  size(450, 700);

  sin = new mysin[num];

  step = height/num;
  for (int i = 0; i < num; i++) {
    sin[i] = new mysin(width/2+1, (step/2)+i*step, 0.1+i*0.01, i);
  }
}

void draw() {

  background(0);

  //noStroke();
  for (int i = 0; i < num; i++) {
    sin[i].drawsin();
  }
  stroke(255);
  line(width/2, 0, width/2, height);
}

class mysin {

  float x;
  float y;

  float sp;

  boolean trig = false;
  color c;
  int index;

  int offset = 2;

  mysin(float x, float y, float sp, int index) {
    this.x = x;
    this.y = y;
    this.sp = sp;

    this.index = index;

    c = 255;
  }

  void drawsin() {
    fill(c);
    noStroke();
    float sinval = sin(frameCount*(sp*0.05))*width/2;
    ellipse(x+sinval, y, step, step);

    if (x+sinval >= (width/2)-offset & x+sinval <= (width/2)+offset ) {
      c = color(random(255), random(255), random(255));
      noFill();
      stroke(255);
      ellipse(width/2, y, step*3, step*3);
      trig = true;
    } else {
      trig = false;
    }
  }
}
