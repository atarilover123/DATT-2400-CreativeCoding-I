void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  int rad = 400;

  //create variables for RGB color vales
  float r = random(255);
  float g = random(255);
  float b = random(255);

  for (int i = 0; i < 100; i++) {  
    //subtract each loop
    rad = rad-2;

    r-=1.1;
    g-=0.5;
    b-=1;

    stroke(r, g, b);
    noFill();
    ellipse(width/2, height/2, rad, rad);
  }
  noLoop();
}
