void setup() {
  size(800, 400);
}

float lx = -999, ly = -999;

void draw() {
  background(255);

  for (int i = 0; i < width; i++) {

    float wlen1 = 0.01;
    float w1 = sin(i*wlen1)*50;

    float wlen2 = 0.05;
    float w2 = 1+sin(frameCount*0.0002*i+wlen2)*10;

    float waveadd = (w1*w2)/2;

    // point(i,height/2+w1);
    //point(i,height/2+w2);
    point(i, height/2+waveadd);

    //keeps line nice
    if (lx < (width)-1) {
      line(i, height/2+waveadd, lx, ly);
      lx = i;
      ly = height/2+waveadd;
    } else {
      lx = 0;
      ly = height/2;
    }
  }
}
