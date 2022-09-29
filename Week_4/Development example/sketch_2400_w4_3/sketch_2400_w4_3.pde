//create a function 
//this makes it easy to call our circle drawing instruction in different ways
void setup() {
  size(800, 800);
  background(0);
}

void draw() {
int offset = 200;  
mycircle(random(width/2-offset,width/2+offset),random(height/2-offset,height/2+offset),random(100,400),random(200),random(1));
mycircle(random(width/2-offset,width/2+offset),random(height/2-offset,height/2+offset),random(100,400),random(200),random(1));
mycircle(random(width/2-offset,width/2+offset),random(height/2-offset,height/2+offset),random(100,400),random(200),random(1));

  noLoop();
}

//what do we want to control - we need to define in our function
//position x, position y, size, number of concentric circles, circle step

void mycircle(float x, float y, float size, float cnum, float cstep) {

  float rad = size;

  float r = random(255);
  float g = random(255);
  float b = random(255);

  for (int i = 0; i < cnum; i++) {  
    rad = rad-cstep;

    r-=1.1;
    g-=0.5;
    b-=1;

    stroke(r, g, b);
    noFill();
    ellipse(x, y, rad, rad);
  }
}
