import processing.video.*;

Capture video;

PImage filter;

PShader sharp;
PShader blur;

void setup() {
  size(600, 600);

  sharp = loadShader("edges.glsl");
  blur = loadShader("blur.glsl");

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
      if (hue(video.pixels[i]) >= 5 & hue(video.pixels[i]) <= 102) {
        filter.pixels[i] = video.pixels[i];
      }
    }


    filter.updatePixels();
  }

  image(filter, 0, 0, width, height+5);
  shader(sharp);

  filter = get();
}

void mousePressed() {
  filter = createImage(width, height, RGB);
}
