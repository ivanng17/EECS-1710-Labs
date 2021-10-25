PImage backImg;
PImage pencil;
PImage[] grades = new PImage[6];
PImage typer5;
PImage typer10;
PImage typer25;
PImage gameover;

int clickAmount = 1;
int cost5 = 10;
int cost10 = 50;
int cost25 = 100;
int counter;
PFont clickFont;
PFont subtitleFont;

void setup(){
  size(800,600);
  frameRate(60);
  
  clickFont = createFont("Arial", 24, true);
  subtitleFont = createFont("Arial", 16, true);
  
  
  grades[0] = loadImage("F.png");
  grades[1] = loadImage("D.png");
  grades[2] = loadImage("C.png");
  grades[3] = loadImage("B.png");
  grades[4] = loadImage("A.png");
  grades[5] = loadImage("APlus.png");

  typer5 = loadImage("typer5.png");
  typer10 = loadImage("typer10.png");
  typer25 = loadImage("typer25.png");
  
  gameover = loadImage("gameover.png");
  
  backImg = loadImage("paper.png");
  background(backImg);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(cost5, width/2 - width/4,  height/2 + height/4 + height/7);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(cost10, width/2,  height/2 + height/4 + height/7);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(cost25, width/2 + width/4,  height/2 + height/4 + height/7);
  
}

void draw(){
 
 
  
  pencil = loadImage("pencil.png");
  
  imageMode(CENTER);
  image(pencil, width/2, height/2, 300, 300);
  
  
  textFont(clickFont);
  fill(0, 0, 0);
  textAlign(LEFT);
  text("The Pencil Game", 50, 55);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(LEFT);
  text("Press the pencil 10,000 times to get an A+!", 50, 65, 200, 100);
  
  textFont(clickFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(counter + " points", width/2, 55);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(LEFT);
  text("Purchase more points per click, costs are on the bottom", 50, 410, 200, 100);
  
  imageMode(CENTER);
  image(typer5, width/2 - width/4, height/2 + height/4 + height/8, 100, 100);
   
  imageMode(CENTER);
  image(typer10, width/2, height/2 + height/4 + height/8, 100, 100);
  
  imageMode(CENTER);
  image(typer25, width/2 + width/4, height/2 + height/4 + height/8, 100, 100);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(cost5, width/2 - width/4, height/2 + height/4 + height/5);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(cost10, width/2,  height/2 + height/4 + height/5);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(cost25, width/2 + width/4,  height/2 + height/4 + height/5);
  
  textFont(subtitleFont);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(clickAmount + " points per click", 50, 310, 200, 100);
}

void mousePressed(){
  if ((mouseX <= width/2 + 150 && mouseX >= width/2 - 150) && (mouseY <= height/2 + 150 && mouseY >= height/2 - 150)){ //code referenced from https://stackoverflow.com/questions/19373880/how-to-know-if-the-mouse-click-is-over-a-graphics-image-java
    backImg = loadImage("paper.png");
    background(backImg);

    image(pencil, width/2, height/2, 250, 250);
    counter += clickAmount;
  }
  
  
  if ((mouseX <= width/2 - width/4 + 50 && mouseX >= width/2 - width/4 - 50) && (mouseY <= height/2 + height/4 + height/8 + 50 && mouseY >= height/2 + height/4 + height/8 - 50)){ 
    if (counter >= cost5){
    clickAmount += 5;
    counter -= cost5;
    backImg = loadImage("paper.png");
    background(backImg);
    cost5 *= 2;
    }
  }
  if ((mouseX <= width/2 + 50 && mouseX >= width/2 - 50) && (mouseY <= height/2 + height/4 + height/8 + 50 && mouseY >= height/2 + height/4 + height/8 - 50)){ 
    if (counter >= cost10){
    clickAmount += 10;
    counter -= cost10;
    backImg = loadImage("paper.png");
    background(backImg);
    cost10 *= 3;
    }
  }
  if ((mouseX <= width/2 + width/4 + 50 && mouseX >= width/2 + width/4 - 50) && (mouseY <= height/2 + height/4 + height/8 + 50 && mouseY >= height/2 + height/4 + height/8 - 50)){ 
    if (counter >= cost25){
    clickAmount += 25;
    counter -= cost25;
    backImg = loadImage("paper.png");
    background(backImg);
    cost25 *= 4;
    }
  }
  
  if (counter == 0){
  imageMode(CENTER);
  image(grades[0], (width/2 + 300), (width/2 - 300));
  }
  else if (counter <= 1000 && counter > 0){
  imageMode(CENTER);
  image(grades[0], (width/2 + 300), (width/2 - 300));
  }
  else if (counter <= 2000 && counter > 1000){
  imageMode(CENTER);
  image(grades[1], (width/2 + 300), (width/2 - 300));
  }
  else if (counter <= 3000 && counter > 2000){
  imageMode(CENTER);
  image(grades[2], (width/2 + 300), (width/2 - 300));
  }
  else if (counter <= 6000 && counter > 3000){
  imageMode(CENTER);
  image(grades[3], (width/2 + 300), (width/2 - 300));
  }
  else if (counter <= 9999 && counter > 6000){
  imageMode(CENTER);
  image(grades[4], (width/2 + 300), (width/2 - 300));
  }
  else if (counter >= 10000){
  imageMode(CENTER);
  image(grades[5], (width/2 + 300), (width/2 - 300));
  imageMode(CENTER);
  image(gameover, width/2 + 300, height/2, 200, 150);
  }
  
  
} 
