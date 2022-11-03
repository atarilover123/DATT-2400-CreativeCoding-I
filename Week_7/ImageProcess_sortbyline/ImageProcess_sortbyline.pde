PImage img;
color[] c;

void setup() {

  //imageMode(CENTER);
}

void settings() {

  img = loadImage("DALLE_OUT.jpg");
  size(img.width, img.height);

  c = new color[img.width];
}

int inc = 0;
;
void draw() {

  img.loadPixels();
  for (int i = 0; i < img.width*img.height; i++) {
    c[i%width] = img.pixels[i];
    c = sort(c);

    //add in a sorting condition
    //if (hue(img.pixels[i]) >= 100) {

      img.pixels[i] = color(c[i%width]);
    //}
  }
  inc++;
  inc = inc%height;

  img.updatePixels();

  image(img, 0, 0);

  noLoop();
}
