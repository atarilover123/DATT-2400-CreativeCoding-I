void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  background(0);

  int offset = 200;  

  //instead of copying the text of our function we can place it in a loop.
  //it will run as many times as we state in the loop - in this example 10 times
  for (int circles = 0; circles < 10; circles++) {
    strokeWeight(random(2));
    mycircle(random(width/2-offset, width/2+offset), random(height/2-offset, height/2+offset), random(100, 400), random(255), random(2));
  }
  noLoop();
  
  //we can save an image like this
  //saveFrame("####_out.png");
}

//what do we want to control
//position x, position y, size, number of concentric circles, circle step

void mycircle(float x, float y, float size, float cnum, float cstep) {

  float rad = size;

  float r = random(255);
  float g = random(255);
  float b = random(255);

  for (int i = 0; i < cnum; i++) {  
    rad = rad-cstep;

    r-=1;
    //g-=0.5;
    //b-=0.7;

    stroke(r, g, b);
    noFill();
    ellipse(x, y, rad, rad);
  }
}

//redraw runs our code again.
void mousePressed() {

  redraw();
}
