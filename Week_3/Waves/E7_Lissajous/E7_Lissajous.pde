//Obtuse_Nature_011116_Dan_Tapper
//2016

float incrementA = 206;
float incrementB = 230;
float scale = 0.5;
int i = 0;

void setup() {
  size(600, 600);

  background(0);
  smooth();
}

void draw() {

  for (int run = 0; run < 100; run++) {
    
    i+=1;


    float x = width/2 * cos (i * scale/incrementA);
    float y = height/2 *sin (i * scale/incrementB);
    
    stroke(255);
    strokeWeight(2);
    point(width/2+x, height/2+y);
  }
  
}
