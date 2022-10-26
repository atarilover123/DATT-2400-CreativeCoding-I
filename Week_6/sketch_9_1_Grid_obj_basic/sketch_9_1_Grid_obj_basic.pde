//I need a grid
//randomised cross object
//rotation
//exit clause - 1 full rotation
// 1 full rotation for all.

//create an empty array of cross
DC[] decross;

int cols = 10;
int rows = 10;

int num = cols*rows;

int stepx, stepy;

void setup() {

  stroke(255);

  size(600, 600);
  stepx = (width / cols);
  stepy = (height / rows);
  
  //populate array
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

  //position
  float x;
  float y;

  //which cross to draw
  int sel = int(random(3));


  //rotation - rotation value chosen at random
  float rot = random(0.035, 0.075);
  //rotation variable -- will increment
  float sr = 0;

  //randomised stroke
  //leave for now
  //float sw = random(1, 5);
  float sw = 1;


  //input position
  //constructor
  DC(float x, float y) {
    this.x = x;
    this.y = y;
  }

//function to draw and rotate
  void crossdraw() {

    //set a stroke weight
    strokeWeight(sw);
    
    //stop if bigger thanTWO_PI - one rotation - leave for now
    
    /*
    if (sr < TWO_PI) {
      sr+=rot;
    }
    */
    
    sr+=rot; //replace later with stop 


    //if statements to select which cross
    //draw crosses in other sketch
    
    //talk about pipeline -- draw loop, custom function, object 
    
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
