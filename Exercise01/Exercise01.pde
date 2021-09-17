color bgColor = color(0, 0, 0);


void setup(){
  size(800, 800, P2D);
  background(bgColor);
}

void draw(){
  rectMode(CENTER);
  ellipseMode(CENTER);
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  
  if (mousePressed){
    line(pmouseX, pmouseY, mouseX, mouseY);
    float randomizer = random(1);
      if (randomizer > 0.5){
        rect(mouseX, mouseY, random(50), random(50));
      }
      else{
        ellipse(mouseX, mouseY, random(50), random(50));
      }
  }
}
