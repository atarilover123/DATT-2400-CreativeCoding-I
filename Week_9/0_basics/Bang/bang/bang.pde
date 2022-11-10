//bang it

boolean bang;
int bangval;
void setup() {
  // frameRate(2); 
  size(400, 400);
}
void draw() {
  background(0);

  int r = frameCount%(int(3)*10); //set time 

  if (r == 10) {
    bang = !bang ;
  }

  if (r == 20 ) {
    bang = !bang;
  }

  if (bang == true) {
    bangval = 255;
    fill(bangval);

    ellipse(width/2, height/2, 400, 400);
   // println("bang");
  } else {
    
  }

}

