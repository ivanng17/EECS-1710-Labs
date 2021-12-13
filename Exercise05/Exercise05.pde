float maxThreshold = 0.1;
float minThreshold = 0.01;
float counter = 0; 

void setup() {
  size(800, 600, P2D);  
  setupSound();
}

void draw() {
  updateSound();
  
  float amp = getAmp();
  
  if ((amp > maxThreshold) && (counter < 500)) {
    background(0,255,0);
    counter += 1;
    textSize(48);
    textAlign(CENTER);
    text(counter, width/2, height/2);
    text("Make enough noise to reach 500!", width/2, height/2 + height/4);
  } else if ((amp < minThreshold) && (counter < 500)) {
    background(255,0,0);
    counter -= 1;
    textSize(48);
    textAlign(CENTER);
    text(counter, width/2, height/2);
    text("Make enough noise to reach 500!", width/2, height/2 + height/4);
  }
  
  if (counter >= 500){
    background(0,0,255);
    textSize(48);
    textAlign(CENTER);
    text("YOU WIN!", width/2, height/2);
  }
}
