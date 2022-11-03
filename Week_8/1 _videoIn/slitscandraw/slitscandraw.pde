//slitscan draw

PImage img; 
PImage imget; 

void settings() {

  img = loadImage("HJ.jpg");
  size(img.width*2, img.height);
}

void setup() {
}

int step = 80; 

void draw() {

  int gridsize = height/step;

  image(img, 0, 0, img.width, img.height);

 // float bx = map(mouseX, 0, width, 0, width/2);
  float bx = constrain(mouseX, 0, width/2-(step+4));
  float by = map(mouseY, 0, height, 0, step);
  
  noFill();
 // rectMode(CENT);
 stroke(255);
  rect(bx, int(by)*gridsize, step, step);

if(mousePressed == true){
  slitdraw(bx, by*gridsize, 1);}
}

int inc = 0; 
int row = 0;
void slitdraw(float x, float y, float isize) {

  inc+=isize; 
  if (inc >= width/2) {
    inc = 0;
    row+=step;
  }
  
   if (row >= height-1) {
    inc = 0;
    row=0;
  }

  imget = img.get(int(x), int(y), step, step);

  image(imget, width/2+inc, row, isize+3, step);
}
