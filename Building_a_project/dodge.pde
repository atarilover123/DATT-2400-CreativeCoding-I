class Dodge {

  PVector loc;
  PVector vel;
  PVector acc;

  float limit;

  PVector mouse;
  
  

  Dodge() {

    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    limit = random(5, 25);
  }

  void drawball() {

    mouse = new PVector(mouseX, mouseY);
    PVector acc = PVector.sub(mouse, loc);

    // Set magnitude of acceleration
    //acc.setMag(0.02);

    acc.normalize();
    acc.mult(0.4);

    // Velocity changes according to acceleration
    vel.add(acc);
    // Limit the velocity by limit
    vel.limit(limit);
    // Location changes by velocity
    loc.add(vel);

    if ( (loc.x > width) || (loc.x < 0)) {
      vel.x = vel.x * -1;
    }

    //check to see if pos.y is contained within the screen width
    if ( (loc.y > width) || (loc.y < 0)) {

      vel.y = vel.y * -1;
    }


    float x = (loc.x);
    float y = (loc.y);
    fill(255);
    noStroke();
    ellipse(x, y, 35, 35);
  }
}


