//DATT 2040
//creating our own functions
void setup(){
  size(500,500);
   
}

//what is a function?
// https://www.youtube.com/watch?v=zBo2D3Myo6Q

//in processing we can create functions.
//we can think of these as blocks of code that we create outside the main setup and draw.
//these functions can perform specific tasks when called


void draw(){
  background(0);
  
  //for example.
  //we can use this simple function to draw a rotating rentangle
  
  //rotate_rect paramaters are x pos, y pos, rectangle size and rotation value
  rotate_rect(width/2,height/2,50,45);
  
  //uncomment the below code to see what happens
  //rotate_rect(150,height/2,50,frameCount);
  
  // we can also use functions to create more complex shapes 
  // this can be very helpful if we want to reuse a piece of code but don't want to repeatedly 
  //copy, paste and find the right parameters to change 
  
  //with a function we can copy it as many times as we like
  //uncomment the line of code below and see what happens

  
  //star(width/2,height/2,width/2,height/3,int(map(mouseY,0,width,7,30)));
  
  //try copying the above line of code a few times and add different parameters
    
  
}

//rotate_rect function
void rotate_rect(int x, int y, float size, float rot){
  rectMode(CENTER);
  pushMatrix();
  translate(x,y);
  rotate(radians(rot));
  rect(0,0,size,size);
  
  popMatrix();
  
  
}

//star function
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
