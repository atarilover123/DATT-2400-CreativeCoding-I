PImage img;

void setup() {
  image(img, 0, 0);
}

void settings() {

  img = loadImage("DALLE_OUT.jpg");
  size(img.width, img.height);
}


void draw() {
  //img.resize(400, 400);
  //image(img, 0, 0);
}
