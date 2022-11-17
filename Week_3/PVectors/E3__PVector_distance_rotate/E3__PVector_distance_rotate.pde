PVector[] sp;
PVector[] acc;
int num = 300;

void setup() {
  size(800, 800);
  sp = new PVector[num];
  acc = new PVector[num];
  for (int i = 0; i < num; i++) {
    sp[i] = new PVector(random(width), random(height), random(40));
    acc[i] = new PVector(random(-2, 2), random(-2, 2), 0);
  }
  stroke(255);
  noFill();
  background(0);
}

void draw() {
  background(0);
  for (int j = 0; j < num; j++) {
    sp[j].add(acc[j]);

    if ((sp[j].x > width) || (sp[j].x < 0)) {
      acc[j].x = acc[j].x * -1;
    }

    if ((sp[j].y > height) || (sp[j].y < 0)) {
      acc[j].y = acc[j].y * -1;
    }

//distance and rotation
    for (int i = 0; i < num; i++) {
      float d = PVector.dist(sp[j], sp[i]);
      if (d <= ((sp[j].z+sp[i].z)/2)) {

        stroke(255);

        float a = PVector.angleBetween(sp[j], sp[i]);
        // acc[i].mult(1.002);
        acc[i].rotate(a*PI);

        strokeWeight(1.5);
        line(sp[i].x, sp[i].y, sp[j].x, sp[j].y);
      } else {
        noStroke();
      }
      strokeWeight(0.5);
      ellipse(sp[i].x, sp[i].y, sp[i].z, sp[i].z);
    }
    
    
  }
}

void mousePressed() {
  size(800, 800);
  sp = new PVector[num];
  acc = new PVector[num];
  for (int i = 0; i < num; i++) {
    sp[i] = new PVector(random(width), random(height), random(40));
    acc[i] = new PVector(random(-2, 2), random(-2, 2), 0);
  }
  stroke(255);
  noFill();
  background(0);
}
