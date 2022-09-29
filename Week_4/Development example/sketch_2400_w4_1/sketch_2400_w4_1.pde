//we create a form

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  int rad = 300;

  for (int i = 0; i < 30; i++) {  
    //subtracting from rad each time our loop runs reduces the size of each circle
    rad = rad-10;
    noFill();
    ellipse(width/2, height/2, rad, rad);
  }
  noLoop();
}
