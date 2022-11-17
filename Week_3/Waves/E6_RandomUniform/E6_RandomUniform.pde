//random uniform distribution

//https://stackoverflow.com/questions/5837572/generate-a-random-point-within-a-circle-uniformly

size(600, 600);
strokeWeight(2);
int rad = 250;
for (int i = 0; i < 1050; i++) {
  float r = rad*sqrt(random(1));
  float theta = random(1) * 2 * PI;

  float x = width/2+r*cos(theta);
  float y = height/2+r*sin(theta);

  point(x, y);
}
