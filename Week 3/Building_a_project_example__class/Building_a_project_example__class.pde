//global variables

//cols and rows
int cols = 40;
int rows = 40;

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


//try experimenting with this code. You can:
//. try different colours for each arc quadrant
//. try changing value
//. create your own equation for rand_switch - can you add in a method using noise() ?
//. try randomizing which method is called, you can replace with int method = int((frameCount*0.05)%3);
//. try changing sin to cos or tan

void draw() {
  background(0);

  //nested loop for grid
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {

      //x and y position
      float xp = x*stepx;
      float yp = y*stepy;

      //create an offset to better place the centre of each arc geometry
      int offset = stepx/2;

      //we have created 3 different ways of randomizing arc quadrants
      //change the method value - 0, 1 and 2 show each method we tried
      int method = 2;

      switch (method) {
      case 0:

        //method 1 - full random
        rand_switch = int(random(4));
        break;

      case 1:

        //method 2 - using sin and map
        rand_switch = int(map (sin((x+offset)+(y+offset)*frameCount*0.001), -1, 1, 0, 4));
        break;

      case 2:

        //method 3 - using distance and map
        float distance = dist(width/2, height/2, xp, yp) + sin(frameCount*0.05)*200;

        rand_switch = int(map(distance, 0, width/2+(offset), 0, 3)) ;
        break;
      }


      //we use the value stored in rand_switch to select different if statements
      if (rand_switch == 0) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(0), radians(90));
      }

      if (rand_switch == 1) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(90), radians(180));
      }

      if (rand_switch == 2) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(180), radians(270));
      }
      if (rand_switch == 3) {
        arc(offset+xp, offset+yp, stepx, stepy, radians(270), radians(360));
      }
    }
  }
}
