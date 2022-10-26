//a recursive function

void setup() {
  recur1(100);
  //recur2(100, 0, 1000);
}

//subtract
void recur1(int r) {
  //exit criteria
  if (r > 0) {
    //perform operation
    r = r-1;
    println(r);

    //call recursion
    recur1(r);
  }
}

//how many tries to generate input number using random
void recur2(int r, int i, int mv ) {

  float rnum = random(mv);

  if (int(rnum) == r) {

    print(r, "matched in", i, "tries");
  } else {
    i = i+1;
    recur2(r, i, mv);
  }
}
