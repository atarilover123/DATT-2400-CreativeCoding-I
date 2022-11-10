import processing.sound.*;

SoundFile[] file;

// Define the number of samples
int numsounds = 15;

// duration before triggering new note
int duration = 100;

float pitch = 1;

// This variable stores the point in time when the next note should be triggered
int trigger = millis();

int note = 1;
//turn off repeat note triggering
boolean triggered = false;

void setup() {

  // Create an array of empty soundfiles
  file = new SoundFile[numsounds];

  // Load 5 soundfiles from a folder in a for loop. By naming the files 1., 2., 3., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, "drums/"+(i+1) + ".aif");
  }
}

void draw() {

  if (mousePressed & triggered == false) {
    if (millis() > trigger) {

      file[note].play(pitch, 1.0);

      triggered = true;
      trigger = millis() + duration;
    }
  }
}

void mouseReleased() {

  note = int(random(numsounds-2));
  pitch = random(2);
  triggered = false;
}

void keyPressed() {
  if (key == '1') {
    file[numsounds-2].play(1, 1.0);
  }

  if (key == '2') {
    file[numsounds-1].play(1, 1.0);
  }
}
