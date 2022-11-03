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

    video.loadPixels();

    for (int i = 0; i < width*height; i++) {
     // float v =  saturation( video.pixels[i]);

      float r = red( video.pixels[i])+(sin(frameCount*0.1)*100);
      float g = green( video.pixels[i])+(sin(frameCount*0.05)*100);
      float b = blue( video.pixels[i])+(sin(frameCount*0.02)*100);

      video.pixels[i] = color(r, g, b);
    }
    
    updatePixels();


    image(video, 0, 0);
  }
}
