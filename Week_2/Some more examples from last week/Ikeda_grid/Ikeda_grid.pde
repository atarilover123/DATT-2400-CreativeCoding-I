//caution contains flashing lights

int cols = 150;
int rows = 100;

float stepx, stepy;

void setup() {
  fill(255);

  size(600, 600);
  stepx = (width / cols);
  stepy = (height / rows);
  
  //remove stroke otline
  //noStroke();
  
}

void draw() {
  background(0);

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {

      //addition assignment - the value of the variable + the right hand value. Incremented each time the loop is run
      stepx += y*0.0001;

      //here we use a modulo - https://www.computerhope.com/jargon/m/modulo.htm

      /*
      Modulo is a math operation that finds the remainder
       when one integer is divided by another.
       In writing, it is frequently abbreviated as mod,
       or represented by the symbol %.
       */

      stepx = stepx%100;


      //create a change in color by checking if a random number is larger than a threshold
      if (random(1) > 0.5) {
        //fill is black
        fill(0);
      } else {
        //fill is white
        fill(255);
      }

      rect(x * stepx, y*stepy, stepx, stepy);
    }
  }
}
