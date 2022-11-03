PImage img;


void setup() {
  size(700, 700, P3D);

  img = loadImage("DALLE_OUT.jpg");
 
  strokeWeight(res);
}
int res = 2;

void draw() {
  background(0);

pushMatrix();

//translate(width/2,height/2);

//rotateX(frameCount*0.01);
//rotateY(frameCount*0.02);
//rotateZ(frameCount*0.03);

//translate(-width/2,-height/2);

  for (int i = 0; i < img.width; i+=res) {
    for (int j = 0; j < img.height; j+=res) {

      int loc = i+j*img.width;


      stroke(color(img.pixels[loc]));
      float z = (red(img.pixels[loc])+green(img.pixels[loc])+blue(img.pixels[loc]))/3;

      point(i, j, z);
    }
  }
  
  popMatrix();
}
