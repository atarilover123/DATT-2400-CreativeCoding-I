float[] ysin;

void setup() {
  size(800, 800);
  ysin = new float[width];
  noFill();
  ellipseMode(CENTER);
  for (int s = 0; s < width; s++) { 
    ysin[s] = height/2;
  }
}

int diam = 400;
int rad = diam/2;
int num = 240;

void draw() {
  background(255);
  int sx = rad;
  int sy = height/2;
  
  float i = frameCount;

  float lsx = sx+rad*cos(i*TWO_PI/float(num));
  float lsy = sy+rad*sin(i*TWO_PI/float(num));
  strokeWeight(1);
  ellipse(sx, sy, diam, diam);
  line(sx, sy, lsx, lsy);
  ellipse(lsx, lsy, 10, 10);

  line(lsx, lsy, i%width, lsy);

  ysin[int(i)%width] = lsy;
  beginShape();
  for (int s = 0; s < width; s++) { 
    if (ysin[s] != width/2) {
      strokeWeight(3);
      //point(s, ysin[s]);
      vertex(s, ysin[s]);
    }
  }
  endShape();
}
