import processing.sound.*;

mysin[] sin;
int num = 24;
int step;

void setup() {
  size(450, 700);


  sin = new mysin[num];

  step = height/num;
  for (int i = 0; i < num; i++) {
    sin[i] = new mysin(width/2+1, (step/2)+i*step, 0.1+i*0.01, i);
  }
}

void draw() {

  background(0);

  //noStroke();
  for (int i = 0; i < num; i++) {
    sin[i].drawsin();
  }
  stroke(255);
  line(width/2, 0, width/2, height);
}

class mysin {

  float x;
  float y;

  float sp;

  boolean trig = false;
  color c;
  int index;

  //sound
  SinOsc so;
  Env env;

  // Times and levels for the ASR envelope
  float attackTime = 0.001;
  float sustainTime = 0.1;
  float sustainLevel = 0.2;
  float releaseTime = 0.2;

  int trigger = millis();
  int duration = 20;
  float pitch = random(2000);

  int offset = 2;

  mysin(float x, float y, float sp, int index) {
    this.x = x;
    this.y = y;
    this.sp = sp;

    this.index = index;

    c = 255;


    //issue instancing SinOsc in class
    //solved:
    //https://stackoverflow.com/questions/30882728/instantiating-a-soundfile-object-within-a-class-in-processing
    // Create sine wave and start it
    so = new SinOsc(sinmusic.this);

    // Create the envelope
    env = new Env(sinmusic.this);
  }

  void drawsin() {
    fill(c);
    noStroke();
    float sinval = sin(frameCount*(sp*0.05))*width/2;
    ellipse(x+sinval, y, step, step);

    if (x+sinval >= (width/2)-offset & x+sinval <= (width/2)+offset ) {
      c = color(random(255), random(255), random(255));
      noFill();
      stroke(255);
      ellipse(width/2, y, step*3, step*3);
      trig = true;
    } else {
      trig = false;
    }

    if (trig) {
      sinsound();
    }
  }

  void sinsound() {
    so.play(100+index*40, 0.1);

    // The envelope gets triggered with the oscillator as input and the times and
    // levels we defined earlier
    env.play(so, attackTime, sustainTime, sustainLevel, releaseTime);

    // Create the new trigger according to predefined duration
    trigger = millis() + duration;
  }
}
