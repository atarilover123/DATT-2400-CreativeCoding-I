import processing.video.*;

Capture video;

PImage slit;

int step = 1;
int pos;

void setup() {
  size(600, 600);
  pos = height;
  video = new Capture(this, width, height);

  video.start();
}


void draw() {

  if (video.available()) {
    video.read();
  }

  pos-=step;
  if (pos <= 0) {
    pos = height;
  }

  slit = video.get(0, pos, width, step);
  image(slit, 0, pos);
}
