void draw() {
  background(0);

  float cycle = map(sin(frameCount*0.1), -1, 1, 0, width);
  /*
  float cycle2 = map(sin(frameCount*0.099), -1, 1, 0, width);
  float cycle3 = map(sin(frameCount*0.098), -1, 1, 0, width);
  float cycle4 = map(sin(frameCount*0.097), -1, 1, 0, width);
  */


  ellipse(cycle, 20, 10, 10);
 /*
  ellipse(cycle2, 40, 10, 10);
  ellipse(cycle3, 60, 10, 10);
  ellipse(cycle4, 80, 10, 10);
  */
}
