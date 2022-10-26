//I need a grid
//randomised cross object
//rotation 
//exit clause - 1 full rotation
// 1 full rotation for all.


DC[] decross;

int cols = 10;
int rows = 10;

int num = cols*rows;

int stepx, stepy;

void setup() {

  noFill();
  stroke(255);
  rectMode(CENTER);


  size(600, 600);
  stepx = (width / cols);
  stepy = (height / rows);



  decross = new DC[num];

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
  for (int i = 0; i < num; i++) {


    decross[i].crossdraw();
  }
  popMatrix();
  
  //saveFrame("/Users/dantapper/Documents/Processing/Grid_obj/output/###_out.png");
}

class DC {

  float x;
  float y;

  int sel = int(random(3));

  float rot = random(0.035, 0.075);
  float sr = 0;

  float sw = random(1, 5);




  DC(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void crossdraw() {

    strokeWeight(sw);
    if (sr < TWO_PI) {
      sr+=rot;
    }

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
