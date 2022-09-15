//DATT 2040. Dan Tapper

//create position and acceleration PVectors
PVector pos;
PVector acc;

void setup() {

  size(500, 500);

  //populate with x,y and z values
  pos = new PVector(random(width), random(height), random(40, 70));
  acc = new PVector(random(-10, 10), random(-10, 10), 0.0);

  stroke(255);
  noFill();
  background(0);
}

void draw() {

  background(0);

  //add acceleration to position
  pos.add(acc);

  //the acc PVector above contains 3 values.
  //Try adding 3 numbers in pos.add below
  //remember to uncomment the below pos.add (remove // ) and comment the pos.add(acc) above (add // in front of pos.add(acc);)

  //pos.add(0,0,0);

  //check to see if pos.x is contained within the screen width
  if ( (pos.x > width) || (pos.x < 0)) {

    //multiply the accelearation.x by -1
    // we can think of this as a switch between positive and negative values for acceleration
    acc.x = acc.x * -1;
  }

  //check to see if pos.y is contained within the screen width
  if ( (pos.y > width) || (pos.y < 0)) {

    //multiply the acceleration.y by -1
    acc.y = acc.y * -1;
  }

  ellipse(pos.x, pos.y, pos.z, pos.z);
}
