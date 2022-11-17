Dodge[] dodgeball;
//defines the number of objects we create
int num = 1;

boolean collide = false;


float time;

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



    if (collide == false) {

      if (frameCount%10 >= 9) {
        time++;
      }


      fill(0);
      rect(0, 0, 70, 50);
      fill(255);
      stroke(255);
      textSize(32);
      text(time, 30, 30);
    }




    if (collide) {
      background(0);
      fill(255);
      stroke(255);
      textSize(72);

      text("GAME OVER", width/2-170, height/2);
      textSize(32);
      text("you survived " + time + " counts", width/2-150, height/2+100);
    }
  }
}

void mousePressed() {
  time = 0;

  background(0);

  collide = false;

  dodgeball = new Dodge[num];


  for (int i = 0; i < num; i++) {
    dodgeball[i] = new Dodge();
  }
}
