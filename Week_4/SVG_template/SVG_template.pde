//SVG template 
//from https://processing.org/reference/libraries/svg/index.html

import processing.svg.*;

boolean record;

void setup() {
  size(400, 400);
}

void draw() {
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(SVG, "frame-####.svg");
  }

  //Put your drawing code between here:

  background(0);
  ellipse(width/2, height/2, 40, 40);

  //and here

  if (record) {
    endRecord();
    record = false;
  }
}

// Use a keypress so thousands of files aren't created
void mousePressed() {
  record = true;
}
