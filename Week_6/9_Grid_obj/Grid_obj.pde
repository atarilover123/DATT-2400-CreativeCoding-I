//I need a grid
//randomised cross object
//rotation
//exit clause - 1 full rotation
// 1 full rotation for all.

//create an Array of objects
DC[] decross;

int cols = 10;
int rows = 10;

int num = cols*rows;

int stepx, stepy;

void setup() {

  noFill();
  stroke(255);
  rectMode(CENTER);

  //size and gridstep
  size(600, 600);
  stepx = (width / cols);
  stepy = (height / rows);

  //how many objects in my array
  decross = new DC[num];

  //populate grid x,y positions.
  //these values are fed to the constructor
  for (int i = 0; i < num; i++) {

    float x = i%num%cols;
    float y = i%num/cols;

    decross[i] = new DC(x*stepx, y*stepy);
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(stepx/2, stepy/2);

  //draw objects at each index of array
  for (int i = 0; i < num; i++) {

    decross[i].crossdraw();
  }
  popMatrix();

  //saveFrame("/Users/dantapper/Documents/Processing/Grid_obj/output/###_out.png");
}

class DC {

  //variables to hold xy pos
  float x;
  float y;

  //random to select from 3 different cross drawings
  int sel = int(random(3));

  //amount of rotation. How much does the cross rotate each time we draw it
  float rot = random(0.035, 0.075);

  //starting rotation - all start from 0
  float sr = 0;

  //randomised strokeweight
  float sw = random(1, 5);

  //constructor
  DC(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void crossdraw() {

    //only rotate if the angle is below 2*pi == one 360 rotation
    strokeWeight(sw);
    if (sr < TWO_PI) {
      sr+=rot;
    }

    //different cross configurations
    if (sel == 0) {

      pushMatrix();
      translate(x, y);


      rotate(sr);
      //rect(0, 0, stepx, stepx);
      line(0, 0, 0, stepy/2);
      line(0, 0, stepx/2, 0);
      line(0, 0, -stepx/2, 0);

      popMatrix();
    }

    if (sel == 1) {

      pushMatrix();
      translate(x, y);

      rotate(sr);
      //rect(0, 0, stepx, stepx);
      line(0, 0, 0, -stepy/2);
      line(0, 0, -stepx/2, 0);
      line(0, 0, stepx/2, 0);

      popMatrix();
    }

    if (sel == 2) {

      pushMatrix();
      translate(x, y);

      rotate(sr);
      // rect(0, 0, stepx, stepx);
      line(0, 0, 0, stepy/2);
      line(0, 0, 0, -stepy/2);
      line(0, 0, stepx/2, 0);
      line(0, 0, -stepx/2, 0);

      popMatrix();
    }
  }
}
