PImage img; 

float omx;
float omy;
void setup() {
 
  imageMode(CENTER);
  background(0);
  //image(img,width/2,height/2);
  //img = get();

}

void settings(){
   img = loadImage("nz.png");
  size(img.width,img.height, P2D);}

void draw() {
  
  background(0);
 
  int tilesX = 10;
  int tilesY = 10;

  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);
  
  if(mousePressed == true){
    float mx = mouseX;
    float my = mouseY; 
    
    float xl = lerp(omx,mx, 0.04);
    float yl = lerp(omy,my, 0.03);
    
    omx = xl;
    omy = yl;
    
  }
  
  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {

      int wave = int(sin(((frameCount+omx)/2) * 0.03 + ( x * y ) * 0.08) * 100);
       int wave2 = int(cos(((frameCount+omy)/2) * 0.03 + ( x * y ) * 0.07) * 100);
      // SOURCE
      int sx = x*tileW+wave;
      int sy = y*tileH+wave2;
      int sw = x+tileW;
      int sh = y+tileH;

      // DESTINATION
      int dx = x*tileW;
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;

      copy(img, sx, sy, sw, sh, dx, dy, dw, dh);


    }
  }
 
 
}
