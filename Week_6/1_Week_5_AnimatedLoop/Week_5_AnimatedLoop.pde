void setup() {
  size(500, 500);
  rectMode(CENTER);
  noFill();
  stroke(255);
}

float rsize = 150;

float rt = 0;

int num = 10;

float sv ;

void draw() {
  background(0);

  for (int i = 0; i < num; i++) {
    sv = sin(rt*0.01);
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(rt+(i*sv)*15));
    rect(0, 0, rsize-(i*10), rsize-(i*10));
    popMatrix();
  }


  rt+=2;

  if (radians(rt) >= TWO_PI & sv >= 0) {
    noLoop();
  }
  //uncomment to save frames
 // saveFrame("####_out.png");
}
