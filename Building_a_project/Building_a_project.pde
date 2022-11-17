Dodge[] dodgeball;
//defines the number of objects we create
int num = 5;

boolean collide = false;


void setup() {

  dodgeball = new Dodge[num];


  for (int i = 0; i < num; i++) {
    dodgeball[i] = new Dodge();
  }

  size(500, 500);
  background(0);
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);

  for (int i = 0; i < num; i++) {
    dodgeball[i].drawball();

    if (PVector.dist(dodgeball[i].loc, dodgeball[i].mouse) <= dodgeball[i].rad) {
      collide = true;
    }


    if (collide) {
      background(0);
      fill(255);
      stroke(255);
      textSize(72);

      text("GAME OVER", width/2-170, height/2);
    }
  }
}

void mousePressed() {
  background(0);
  
  collide = false; 
  
  dodgeball = new Dodge[num];


  for (int i = 0; i < num; i++) {
    dodgeball[i] = new Dodge();
  }
  
  
}
