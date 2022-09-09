//DATT 2400 Week 1. Example 1

//global variables -- Variables that are created outside of a function
//Global variables can be used both inside and outside of functions

// number of collumns and rows
int cols = 10;
int rows = 10;

//variables to hold grid grid spacing
int stepx;
int stepy;


//our setup function --

//setup reference: https://processing.org/reference/setup_.html

void setup() {

  //size of canvas in pixels
  size(500, 500);

  //calculation for the stepsize
  stepx = width / cols;
  stepy = height / rows;

  //set the framerate (in this case 2 frames per second)
  frameRate(2);

  //set ellipse mode to corner - go to the reference to check out the different modes
  ellipseMode(CORNER);
}

//our draw function

//draw reference: https://processing.org/reference/draw_.html

void draw() {

  //set a background color - updated every time the draw loop runs.
  //try removing the background to see what happens
  background(0);

  // create a nested for loop - nested means we have a for loop inside a for loop

  //reference for "for" loop: https://processing.org/reference/for.html

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      //variables that calculate the x,y position of each element of the grid

      //these variables are using floating point values rather than integers
      //whats the difference between float and int ?

      //have a think, we will discuss in next weeks lab

      float x = i*stepx;
      float y = j*stepy;

      //create a random number using the random function
      float randomvariable = random(10);

      // if statement to see if the random number is bigger than 5
      // if it is we'll draw a randomly colored rectangle
      if (randomvariable > 5) {
        fill(random(255), random(255), random(255));
        rect(x, y, stepx, stepy);
      }

      //if the number is smaller than 5 the else statement will be called
      // if it is we'll draw a randomly colored circle
      else {
        fill(random(255), random(255), random(255));
        ellipse(x, y, stepx, stepy);
      }
    }
  }
}
