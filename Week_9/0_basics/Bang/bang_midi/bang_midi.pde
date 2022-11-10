//bang it

boolean bang;

import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus

int channel = 0;
int pitch;
int velocity = 127;


void setup() {
  myBus = new MidiBus(this, 0, 2);
  size(400, 400);
  stroke(255);
}
void draw() {
  background(0);

  int r = frameCount%(40); //set time

  if (r == 10) {
    bang = !bang ;
  }

  if (r == 11 ) {
    bang = !bang;
  }

  if (bang == true) {

    channel = 0;
    pitch = 50;
    velocity = 127;

    myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  }

  if (r >= 10 & r <= 15) {
    fill(255);

    ellipse(width/2, height/2, 400, 400);
  } else {
    fill(0);

    ellipse(width/2, height/2, 400, 400);
  }

  if (r == 0 ) {
    myBus.sendNoteOff(channel, pitch, velocity);
  }
}
