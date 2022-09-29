//global variables

//cols and rows
int cols = 30;
int rows = 30;

//variables for step
int stepx, stepy;

//random switch
int rand_switch = 0;

void setup() {

  size(600, 600);

  //define step size
  stepx = (width/cols);
  stepy = (height/cols);
}

void draw() {
  background(0);

  //nested loop for grid
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {

      fill(255, 100, 200);
      noStroke();

      //x and y position
      float xp = x*stepx;
      float yp = y*stepy;

      //create an offset to better place the centre of each arc geometry
      int offset = stepx/2;


      //using tan and map
      rand_switch = int(map (tan((x+offset)+(y+offset)*frameCount*0.001), -1, 1, 0, 2));

      //we use the value stored in rand_switch to select different if statements
      //each if statement calls a different quadrant of the arc

      if (rand_switch == 0) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(0), radians(90));
      }

      if (rand_switch == 1) {

        arc(xp, yp, stepx, stepy, radians(90), radians(180));
      }

      if (rand_switch == 2) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(180), radians(270));
      }
      if (rand_switch == 3) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(270), radians(360));
      }
    }
  }

  //added visual style - a rotating black rectangle acting as a frame
  fill(200);
  noFill();
  strokeWeight(150);
  stroke(0);
  rectMode(CENTER);
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*0.01);
  rect(0, 0, width, height);
  popMatrix();

  //added visual style - a pulsing blue outline of a circle
  stroke(82, 179, 255);
  strokeWeight(abs(15+sin(frameCount*0.03)*10));
  ellipse(width/2, height/2, 200, 200);
}

void mousePressed() {
  noLoop();
}
