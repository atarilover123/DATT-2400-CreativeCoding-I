PImage img;

void setup() {

}

void settings() {

  img = loadImage("DALLE_OUT.jpg");
  size(img.width, img.height);
}


void draw() {

  img.loadPixels();
  for (int i = 0; i < img.width*img.height; i++) {

    img.pixels[i] = img.pixels[i]+10;
  }
  
  img.updatePixels();
  
  image(img,0,0);
}
