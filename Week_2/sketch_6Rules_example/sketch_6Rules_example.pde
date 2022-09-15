//DATT 2400. Dan Tapper
/* an example of how the dice rolls from week 1 can be turned into
a piece of creative code

please note this is just for reference. We will cover how to make proejcts like this
but aren't quite ready for this yet.

To achieve this effect I have created an array of objects.

See array: https://processing.org/reference/Array.html
See object: https://processing.org/tutorials/objects

don't worry if this seems like a lot of code rn

Within the object I have created functions that contain drawing instructions
for circles, triangles, lines etc...

Throguh using a random value and switch I am able to randomly select a 
different drawing rule and draw it to each position in the grid*/

/*
The rules:
1 = Draw a circle
2 = Bounce the circle in a square
3 = Draw a spinning star
4 = Draw a triangle
5 = Move the triangle left and right
6 = Draw a line that moves up and down
*/

//the code

//rows and cols
int col = 10;
int row = col;

int num = col*row;

// create an array of objects to hold our rules
//don't worry too much about what objects are yet
//if you do want to learn more: https://processing.org/tutorials/objects
GR[] gridrules;

void setup() {

  background(0);
  size(700, 700);

  gridrules = new GR[num];

  int stepx = width/col;
  int stepy = height/row;

  for (int i = 0; i < num; i++) {

    int x = i%num%col;
    int y = i%num/row;

    //create [num] number of objects with x,y positions and stepx, stepy values
    gridrules[i] = new GR(x, y, stepx, stepy);
  }
}


void draw() {
  background(0);

  //a for loop to run through the object array and call the ruledraw function
  for (int i = 0; i < num; i++) {
    gridrules[i].ruledraw();
  }
}

//mousePressed contains mostly the same code as setup()
//when we press the mouse we populate our object array with a series of new values
void mousePressed() {

  background(0);

  gridrules = new GR[num];

  int stepx = width/col;
  int stepy = height/row;

  for (int i = 0; i < num; i++) {

    int x = i%num%col;
    int y = i%num/row;

    gridrules[i] = new GR(x, y, stepx, stepy);
  }
}


//object class
class GR {

  //object variables
  int x;
  int y;
  int sizex;
  int sizey;

  // random select value (changes what rule we see)
  int rswitch = int(random(5));

  int cstep = int(random(20, 360));

  int csize;

  int npoints = int(random(3, 18));

  int linerot = int(40);
  int lspeed = int(random(3, 20));

  //constructor
  GR(int xpos, int ypos, int sx, int sy) {

    x = xpos;
    y = ypos;
    sizex = sx;
    sizey = sy;

    csize = int(random(2, sizex/3));
  }

  //switch to change rules based on input from ruledraw
  void ruledraw() {

    switch(rswitch) {

    case 0:
      //draw a circle
      fill(255);
      stroke(255);
      strokeWeight(1);
      drawcircle();
      break;

    case 1:
      //bounce a circle
      fill(255);
      stroke(255);
      strokeWeight(1);
      bouncecircle();
      break;

    case 2:
      //draw a triangle
      fill(255);
      stroke(255);
      strokeWeight(1);
      spintriangle();
      break;

    case 3:
      //spin a star
      fill(255);
      stroke(255);
      strokeWeight(1);
      spinstar();
      break;


    case 4:
      //draw a line
      fill(255);
      stroke(255);
      strokeWeight(3);
      linedraw();
      break;
    }
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(x*sizex, y*sizey, sizex, sizey);
  }

  //object functions
  void drawcircle() {

    int cx = x*sizex;
    int cy = y*sizey;
    int rad = sizex/2;

    int i = frameCount;

    float csin = (cx+sizex/2) + sin(i*TWO_PI/(cstep)) * (rad-csize-(csize/2));
    float ccos = (cy+sizey/2) + cos(i*TWO_PI/(cstep)) * (rad-csize-(csize/2));
    noFill();
    stroke(255);

    ellipse((cx+sizex/2), (cy+sizey/2), sizex-(csize*2), sizex-(csize*2));
    ellipse((cx+sizex/2), (cy+sizey/2), sizex, sizex);
    strokeWeight(1);
    fill(255);
    ellipse(csin, ccos, csize, csize);
  }

  void bouncecircle() {

    ellipse((x*sizex)+sizex/2, (y*sizex+sizey/2)+(sin(frameCount*(map(cstep, 20, 360, 0, 0.1)))*((sizex-csize)/2)), csize, csize);
  }

  void spintriangle() {

    int xp1 = (x*sizex)+sizex/2;
    int yp1 = (y*sizex);

    int xp2 = (x*sizex);
    int yp2 = (y*sizex)+sizex;

    int xp3 = (x*sizex)+sizex;
    int yp3 = (y*sizex)+sizex;

    float sin_move =-sizex/2+(sin(frameCount*(map(cstep, 20, 360, 0, 0.1)))*sizex/2);
    float cos_move =-sizex/2+(cos(frameCount*(map(cstep, 20, 360, 0, 0.1)))*sizex/2);

    triangle(xp1, yp1, xp2-sin_move, yp2, xp3+cos_move, yp3);
  }

  void spinstar() {

    pushMatrix();


    noStroke();
    translate(x*sizex+sizex/2, y*sizex+sizey/2);
    rotate(frameCount*map(cstep, 20, 360, 0, 0.1));

    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = 0 + cos(a) * sizex/30;
      float sy = 0 + sin(a) * sizey/20;
      vertex(sx, sy);
      sx =0 + cos(a+halfAngle) * sizex/2;
      sy = 0 + sin(a+halfAngle) * sizey/2;
      vertex(sx, sy);
    }
    endShape(CLOSE);

    popMatrix();
  }

  void linedraw() {
    pushMatrix();
    translate(x*sizex+sizex/2, y*sizey+sizex/2);
    if (frameCount%lspeed >= lspeed-1) {
      linerot = linerot+=90;
      linerot = linerot%360;
      linerot = int(degrees(linerot));
    }
    rotate(linerot);
    translate(-sizex/4+abs(sin(frameCount*(map(cstep, 20, 360, 0, 0.1)))*sizex/4), 0);
    line(0, 0, sizex/2, 0);
    popMatrix();
  }
}
