import processing.sound.*;

// The trigger is an integer number in milliseconds so we can schedule new events in the draw loop
int trigger;

//sound
SinOsc sine;
Env env;

// Times and levels for the ASR envelope
float attackTime = 0.001;
float sustainTime = 0.1;
float sustainLevel = 0.2;
float releaseTime = 0.2;

void setup() {
  // Create a trigger
  trigger = millis();


  sine = new SinOsc(this);

  // Create the envelope
  env = new Env(this);
}

void draw() {

  // If the determined trigger moment in time matches up with the computer clock events get triggered.
  if (mousePressed & millis() > trigger) {
    int pitch = int(random(20, 1000));
    trigger = millis() + 500;

    sine.play(pitch, 0.5);

    // The envelope gets triggered with the oscillator as input and the times and
    // levels we defined earlier
    env.play(sine, attackTime, sustainTime, sustainLevel, releaseTime);
  }
}
