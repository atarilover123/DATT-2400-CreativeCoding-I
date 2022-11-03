float x;
float y ;

float lx;
float ly;

void setup() {

  size(600, 600);
  x = width/2;
  y = height/2;
  lx = width/2;
  ly = height/2;
  background(0);
  strokeWeight(1);
}

int step = 10;
int num = 180;

int cinc = 0;

float growth;

int inc = 0;

void draw() {
  background(0);
  noFill();

  beginShape();
  growth = (frameCount%400);

  for (int i = 0; i <num; i++) {

    noStroke();
    stroke(100, 200, 30);
    fill(100, 200, 130,120);


    x = width/2+sin(i*TWO_PI/num)*(growth*0.7+(noise((y*0.03)*sin(frameCount*0.005)*0.5)*step*12));
    y = height/2+cos(i*TWO_PI/num)*(growth*0.7+(noise((x*0.03)*sin(frameCount*0.005)*0.5)*step*12));
    
    curveVertex(x, y);
    
    ellipse(x,y,4,4);
  }
  endShape(CLOSE);
}
