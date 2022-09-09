//DATT 2400 Week 1. Example 2

//how many collumns and rows in my grid
int cols = 10;
int rows = 10;

//variables to hold stepsize (spacing in the grid)
int stepx, stepy;

//setup the size of my canvas
void setup() {
  size(500, 500);

  //value of stepsizes
  stepx = (width / cols);
  stepy = (height / rows);

  //set the fill color to 0 - effects the ellipse fill
  fill(0);

  noLoop();
}

//variables for column and row position
int col = 0;
int row = 0;

//drawing loop -- keeps the sketch running in realtime
void draw() {
  background(255);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //variables for our x and y positions
      float x = i*stepx;
      float y = j*stepy;

      //variable for our linesize
      int linesize = stepy;

      //draw an ellipse 5*5 pixels wide at each xy coordinate.
      ellipse(x, y, 5, 5);

      int dice = int(random(4));

      strokeWeight (random(4));

      //we use switch as a more convenient if else structure
      //we feed switch a variable, in this case our dice variables.
      //if the dice rolls a 0 we select "case 0", if it rolls a 1 "case 1" etc...
      //rolls generate simple line drawings -- up, down, left, right

      //take a look at the switch reference here: https://processing.org/reference/switch.html
      switch(dice) {
      case 0:
        //line goes right
        //color = red
        stroke(255, 8, 37);
        line(x, y, x+linesize, y);
        break;
      case 1:
        //line goes down
        //color = blue
        stroke(8, 216, 255);
        line(x, y, x, y+linesize);
        break;
      case 2:
        //line goes left
        //color = pink
        stroke(255, 8, 227);
        line(x, y, x-linesize, y);
        break;
      case 3:
        //line goes up
        //color = yellow
        stroke(247, 223, 0);
        line(x, y, x, y-linesize);
        break;
      }
    }
  }
}

//in setup we use noLoop() to make the code only run once
//we can use the mousePressed function to redraw() -- run the code in draw again
void mousePressed() {
  redraw();
}
