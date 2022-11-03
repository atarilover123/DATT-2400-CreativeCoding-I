import processing.video.*;

Capture video;

void setup() {
  size(600, 600);
  video = new Capture(this, width, height);
  //colorMode(HSB, 255);
  video.start();
}


void draw() {

  if (video.available()) {
    video.read();


    float v = mouseX;

    video.loadPixels();

    for (int i = 0; i < width*height; i++) {
      // float v =  saturation( video.pixels[i]);

      float r = red( video.pixels[i])+v;
      float g = green( video.pixels[i])+v;
      float b = blue( video.pixels[i])+v;

      video.pixels[i] = color(r, g, b);
    }

    updatePixels();


    image(video, 0, 0);
  }
}
