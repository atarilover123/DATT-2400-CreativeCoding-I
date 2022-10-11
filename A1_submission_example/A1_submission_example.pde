//Dan Tapper
//A1 submission
//this code work creates images from randomly placed rectangles.
//a custom function has been created. This function places rectangles within the outer rectangle
//sizing, number of rectangles and step size are parameters of the function

void setup() {
  size(800, 800);
  background(0);
  rectMode(CENTER);
}

void draw() {
  background(0);

  int offset = 200;  

  for (int rects = 0; rects < 10; rects++) {
    strokeWeight(random(2));
    myrect(random(width/2-offset, width/2+offset), random(height/2-offset, height/2+offset), random(100, 400), random(255), random(2));
  }
  noLoop();

  //saveFrame("####_out.png");
}

//what do we want to control
//position x, position y, size, number of concentric circles, circle step

void myrect(float x, float y, float size, float cnum, float cstep) {

  float rad = size;

  float r = random(255);
  float g = random(255);
  float b = random(255);

  float rot = TWO_PI;

  //strokeWeight(cstep/1.5);

  for (int i = 0; i < cnum; i++) {  
    rad = rad-cstep;

    r-=1;
    g-=0.5;
    b-=0.7;

    stroke(r, g, b);
    noFill();

    rect(x, y, rad, rad);
  }
}

void mousePressed() {
  // saveFrame("####_out.png");
  redraw();
}
