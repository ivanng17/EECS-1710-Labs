PImage background;
PImage runner;
PImage runner2;
PImage runner3;
PImage runner4;
PImage tree;
PImage cloud;
float counterTree;
float counterCloud;
float counterRunner;
float speedX = 5;
float posX, posY;
float x,y;
float pauseTree;
float pauseCloud;

void setup(){
  
  size(900, 900, P2D);
  background = loadImage("background.png");
  background.resize(width*4, height);
  imageMode(CENTER);
  
  runner = loadImage("runner.png");
  runner.resize(width/4, height/4);
  imageMode(CENTER);
  
  runner2 = loadImage("runner2.png");
  runner2.resize(width/4, height/4);
  imageMode(CENTER);
  
  runner3 = loadImage("runner3.png");
  runner3.resize(width/4, height/4);
  imageMode(CENTER);
  
  runner4 = loadImage("runner4.png");
  runner4.resize(width/4, height/4);
  imageMode(CENTER);
  
  tree = loadImage("tree.png");
  tree.resize(width/4, height/4);
  imageMode(CENTER);
  
  cloud = loadImage("cloud.png");
  cloud.resize(width/4, height/8);
  imageMode(CENTER);
  
  posX = width/2;
  posY = height/2;
  x = posX;
  y = posY;
  counterTree = width;
  counterCloud = width;
}

void draw(){
  image(background, posX, posY);
  
  posX -= speedX;
  counterTree -=1; 
  counterCloud -=2;
  counterRunner += 1;
  pauseTree = random(100);
  pauseCloud = random(100);
  
  if (posX < 0 || posX > width){
  posX = width;
  }
  

  
  image(tree, (counterTree + (tree.width/2)), posY + posY/4);

  if (counterTree <= (0 - tree.width) && pauseTree < 1){
    counterTree = width;
    image(tree, (counterTree + tree.width), posY + posY/4);
  }
  
  image(cloud, (counterCloud + (cloud.width/2)), posY - posY/2);
  
  if (counterCloud <= (0 - cloud.width) && pauseCloud > 99){
    counterCloud = width;
    image(cloud, (counterCloud + cloud.width), posY - posY/2);
  }
  
  if (counterRunner >= 0 && counterRunner < 25){
  image(runner, x, y+y/3);
  }
  else if (counterRunner >= 25 && counterRunner < 50){
  image(runner2, x, y+y/3+y/64);
  }
  else if (counterRunner >= 50 && counterRunner < 75){
  image(runner3, x, y+y/3);
  }
  else if (counterRunner >= 75 && counterRunner < 100){
  image(runner4, x, y+y/3+y/64);
  }
  else if(counterRunner >= 100){
  counterRunner = 0;
  image(runner, x, y+y/3);
  }
  
  if (mousePressed){
  counterTree -= 2; 
  counterCloud -= 4;
  counterRunner += 2;
  }
}
