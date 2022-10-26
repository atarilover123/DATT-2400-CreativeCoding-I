RW randwalk;
RW randwalk2;

void setup() {
  size(600,600);

  randwalk = new RW(random(width),random(height), random(6));
  randwalk2 = new RW(random(width),random(height), random(6));
}

void draw() {
  randwalk.randwalk();
  randwalk2.randwalk();
}


class RW {

  float x;
  float y;
  float rstep;

  RW(float x, float y, float rstep) {
    this.x = x;
    this.y = y;
    this.rstep = rstep;
  }

  void randwalk() {

    x = x+random(-rstep, rstep);
    y = y+random(-rstep, rstep);
   point(x,y);
  }
}
