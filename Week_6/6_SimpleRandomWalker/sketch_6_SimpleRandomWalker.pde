//global variables for random walk 1
int x1;
int y1 ;

int speed1 = 4;

//global variables for random walk 2
int x2;
int y2 ;

int speed2 = 4;

//you can keep adding to make new random walkers
//int x3;
//int y3;
//int speed3 = 4;

void setup() {

  size(500, 500);
  background(255);

  //random starting positions
  x1 = int(random(width));
  y1 = int(random(height));

  x2 = int(random(width));
  y2 = int(random(height));
}

void draw() {

  //some styling
  strokeWeight(abs(sin(frameCount*0.1)*5));
  stroke(0, 50);
  ellipse(abs(x1), abs(y1), abs(sin(frameCount*0.1)*5), abs(sin(frameCount*0.1)*5));
  
  //random walker 1
  x1 = x1+int( random(-speed1, speed1) );
  y1 = y1+int( random(-speed1, speed1) );


  //random walker 2
  x2 = x2+int( random(-speed2, speed2) );
  y2 = y2+int( random(-speed2, speed2) );
  ellipse(x2, y2, 10, 10);
  
  //random walker 3
  //uncomment this and the code up top to add in a third walker
 // x3 = x3+int( random(-speed3, speed3) );
 // y3 = y3+int( random(-speed3, speed3) );
 // ellipse(x3, y3, 10, 10);
  
}
