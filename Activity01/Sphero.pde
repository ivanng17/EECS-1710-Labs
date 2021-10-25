class Sphero {
  
  PVector position, target; //code referenced from: https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week04/Creature03
  PImage faceNeutral;
  PImage faceAngry;
  PImage faceSmirk;
  PImage faceHappy;
  PImage faceSad;
  PImage faceDead;
  PImage faceCurrent;
  PImage bgImage;

  float margin = 40;
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  float botheredSpread = 5;
  
  float triggerDistance1 = 125;
  float triggerDistance2 = 25;
  float movementSpeed = 0.05;

  Sphero(float x, float y) {
    position = new PVector(x, y);
    pickEscapeTarget();
  
    faceNeutral = loadImage("faceNeutral.png");
    faceAngry = loadImage("faceAngry.png");
    faceSmirk = loadImage("faceSmirk.png");
    faceSad = loadImage("faceSad.png");
    faceHappy = loadImage("faceHappy.png");
    faceDead = loadImage("faceDead.png");
    faceCurrent = faceHappy;
 
    bgImage = loadImage("background.png");

  }
  void update() {
    PVector mousePos = new PVector(mouseX, mouseY);
    isBothered = position.dist(mousePos) < triggerDistance1;
    botheredMarkTime = millis();
    
    if (isBothered && botheredMarkTime < 6000){
      faceCurrent = faceHappy;
    }
    else if (isBothered && botheredMarkTime >= 6000 && botheredMarkTime < 8999) {
      faceCurrent = faceSmirk;
    }
    else if (isBothered && botheredMarkTime >= 9000 && botheredMarkTime < 11999) {
     faceCurrent = faceNeutral;
    }
    else if (isBothered && botheredMarkTime >= 12000 && botheredMarkTime < 14999) {
     faceCurrent = faceSad;
    }  
    else if (isBothered && botheredMarkTime >= 15000 && botheredMarkTime < 17999){
     faceCurrent = faceAngry; 
    }
    else if (isBothered && botheredMarkTime >= 18000 && botheredMarkTime < 20999){
     faceCurrent = faceDead;
    }
    else if (isBothered && botheredMarkTime >= 21000){
     exit();
    }
    if (isBothered && botheredMarkTime < 17999) {
      position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
    }  
    if (position.dist(target) < triggerDistance2 && botheredMarkTime < 17999) {
      pickEscapeTarget();
    }
   }
 
  
  void draw(){
    background(bgImage);

    imageMode(CENTER);
    image(faceCurrent, position.x, position.y, 100, 100);
  }

  void run() {
    update();
    draw();
  }
  
  void pickEscapeTarget() {
    target = new PVector(random(margin, width-margin), random(margin, height-margin)); 
  }
}
