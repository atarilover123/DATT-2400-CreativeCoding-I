Dodge[] dodgeball;
//defines the number of objects we create
int num = 2;

void setup() {

  dodgeball = new Dodge[num];
  
  
  for(int i = 0; i < num; i++){
    dodgeball[i] = new Dodge();  
  }

  size(500, 500);
  background(0);
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  
    for(int i = 0; i < num; i++){
    dodgeball[i].drawball();  
    
    if(PVector.dist(dodgeball[i].loc,dodgeball[i].mouse) <= dodgeball[i].rad){
    noLoop();
    }
    
  }
  
}

void mousePressed() {

}

