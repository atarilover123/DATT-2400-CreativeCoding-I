import processing.video.*;

Capture video;

PImage filter;

void setup() {
  size(600, 600);

  filter = createImage(width, height, RGB);

  video = new Capture(this, width, height);

  video.start();
}

int inc;
void draw() {

  if (video.available()) {
    video.read();

    //image(video,0,0);

    filter.loadPixels();

    for (int i = 0; i < width*height; i++) {
      if (saturation(video.pixels[i]) > 90) {
        filter.pixels[i] = video.pixels[i];
      }
    }


    filter.updatePixels();
  }

image(filter,0,0);
}

void mousePressed() {
  filter = createImage(width, height, RGB);
}
