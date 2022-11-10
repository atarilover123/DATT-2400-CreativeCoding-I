//trigger

// The trigger is an integer number in milliseconds so we can schedule new events in the draw loop
int trigger;

void setup() {
  // Create a trigger
  trigger = millis();
}

void draw() {

  // If the determined trigger moment in time matches up with the computer clock events get triggered.
  if (millis() > trigger) {
    print(trigger, "");
    trigger = millis() + 500;
    print("next trigger", trigger, "");
    println();
  }
  //println();
}
