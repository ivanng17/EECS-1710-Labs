float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

float faceSize = 300;
float lengthSecondHand = 110;
float lengthMinuteHand = 100;
float lengthHourHand = 50;

color outlineCol;
color secondCol;
color faceCol;
color intervalCol;

PImage morning;
PImage noon;
PImage night;
PImage sunrise;

void setup() {
  size(1250, 750, P2D); 
  strokeWeight(3);
  background(255, 255, 255);
  
  morning = loadImage("morning.png");
  morning.resize(width, height); 
  imageMode(CORNER);
  
  noon = loadImage("noon.png");
  noon.resize(width, height); 
  imageMode(CORNER);
  
  night = loadImage("night.png");
  night.resize(width, height); 
  imageMode(CORNER);
  
  sunrise = loadImage("sunrise.png");
  sunrise.resize(width, height); 
  imageMode(CORNER);
}
  
void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  if (s != lastSecond) {
    rotSeconds = ((float) s / 60) * TWO_PI;
    lastSecond = s;
  }
  
  if (m != lastMinute) {
    rotMinutes = ((float) m / 60) * TWO_PI; 
    lastMinute = m;
  }
  
  if (h != lastHour) {
    rotHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lastHour = h;
  }
  
  if (lastHour < 12 && lastHour > 6){
    println("Good morning");
    image(morning, 0, 0, width, height);
    outlineCol = color(0, 85, 175);
    secondCol = color(255, 245, 120);
    faceCol = color(0, 210, 255);
    intervalCol = color(0, 255, 240);
  }
  else if (lastHour < 6 && lastHour > 0){
    println("It's sunrise");
    image(sunrise, 0, 0, width, height);
    outlineCol = color(190, 0, 20);
    secondCol = color(255, 250, 120);
    faceCol = color(255, 160, 0);
    intervalCol = color(255, 100, 0);
  }
    else if (lastHour < 18 && lastHour > 12){
    println("It's sunset");
    image(noon, 0, 0, width, height);
    outlineCol = color(190, 0, 20);
    secondCol = color(255, 250, 120);
    faceCol = color(255, 160, 0);
    intervalCol = color(255, 100, 0);
  }
  else{
    println("Good night");
    image(night, 0, 0, width, height);
    outlineCol = color(0, 25, 80);
    secondCol = color(170, 170, 170);
    faceCol = color(100, 50, 140);
    intervalCol = color(60, 20, 150);
  }
  
  fill(faceCol);
  stroke(outlineCol);
  ellipse(width/2, height/2 + height/4, faceSize, faceSize);
  
  stroke(intervalCol);
  for(int i=0; i<12; i++) {
    float rot = ((float) i/12) * TWO_PI;
    pushMatrix();
    translate(width/2, height/2 + height/4);
    rotate(rot);
    line(0, faceSize/5, 0, faceSize/2);
    popMatrix();
  }
  
  pushMatrix();
  translate(width/2, height/2 + height/4);
  rotate(rotSeconds);
  fill(secondCol);
  stroke(secondCol);
  line(0, 0, 0, -lengthSecondHand);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2 + height/4);
  rotate(rotMinutes);
  fill(0);
  stroke(outlineCol);
  line(0, 0, 0, -lengthMinuteHand);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2 + height/4);
  rotate(rotHours);
  line(0, 0, 0, -lengthHourHand);
  popMatrix();
  
  fill(faceCol);
  ellipse(width/2, height/2 + height/4, 10, 10);
  

}
