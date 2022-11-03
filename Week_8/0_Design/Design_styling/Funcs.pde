void circ2(float x, float y, int cs, int num ) {

  for (int i = cs; i > 0; i-=num) {

    //strokeWeight(map(i,cs,0,0,6));
    //strokeWeight(map(sin((i*0.01)+frameCount*0.1), -1, 1, 0, 4));
    
    //stroke(map(sin((i*0.01)+frameCount*0.1),-1,1,0,255),map(x,0,width,0,255),map(y,0,height,0,255));

    ellipse(x, y, cs-i, cs-i);
  }
}
