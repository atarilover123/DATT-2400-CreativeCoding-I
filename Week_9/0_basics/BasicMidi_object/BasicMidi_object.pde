import themidibus.*; //Import the library
Midi[] mymidi; 

MidiBus myBus; // The MidiBus

void setup() {
  size(400, 400);
  background(0);

  MidiBus.list(); // List all available Midi devices 

  myBus = new MidiBus(this, 0, 2); // Create a new MidiBus using the device index to select the Midi input and output devices 

  mymidi = new Midi[3];

  for (int i = 0; i < 3; i++) {
    mymidi[i] = new Midi(i);
  }
}

void draw() {

  if (mousePressed == true) {
    for (int i = 0; i < 3; i++) {
      mymidi[i].play();
    }
  }
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time+10) Thread.yield();
}

class Midi {

  int midichannel;

  Midi(int mc) {
    midichannel = mc;
  }

  void play() {
    int channel = midichannel;
    int pitch = int(random(127));
    int velocity = 127;

    myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
    delay(100);
    myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff
  }
}
