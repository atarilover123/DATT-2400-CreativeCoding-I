PImage[] imgs;
String[] imname = {"nasa.jpg", "salt.png", "monet.jpg", "yellowstone.png"};

int samps = 4;
int v = 0;

int step;

void setup() {

  size(600, 200);

  step = width/samps;

  imgs = new PImage[4];

  for (int i = 0; i < imgs.length; i++) {
    imgs[i] = loadImage(imname[i]);
  }
  println(imname[v]);
}



void draw() {
  noStroke();
  for (int i = 0; i < samps; i++) {
    int x = int(random(imgs[v].width));
    int y = int(random(imgs[v].height));

    int loc = x+y*imgs[v].width;

    fill(color(imgs[v].pixels[loc]));
    rect(i*step, 0, step, height);
  }
  noLoop();
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == '1') {
    v = 0;
  }

  if (key == '2') {
    v = 1;
  }

  if (key == '3') {
    v = 2;
  }

  if (key == '4') {
    v = 3;
  }

  redraw();
  println(imname[v]);
}
