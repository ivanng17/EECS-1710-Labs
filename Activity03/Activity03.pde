PImage img;
PImage red, green, blue;
int c1, c2, c3;

void setup() {
  size(640, 480, P2D);  
  img = loadImage("tree.png"); // https://openclipart.org/detail/80/tree-by-peterm // 
  imageMode(CENTER);
  image(img, width/2, height/2);
  img.resize(width, height);

  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    if ((red(img.pixels[i]) > 127) || (blue(img.pixels[i]) > 127) || (green(img.pixels[i]) > 127)) {
      img.pixels[i] = color(255);
    }
    else{
      img.pixels[i] = color(0);
    }
  }
  img.updatePixels();
  
  background(img);
  
  red = loadImage("red.png");
  green = loadImage("green.png");
  blue = loadImage("blue.png");
    
  imageMode(CENTER);
  image(red, width/2 - width/4, height/2 + height/4 + height/8, 100, 100);
  
  imageMode(CENTER);
  image(green, width/2, height/2 + height/4 + height/8, 100, 100);

  imageMode(CENTER);
  image(blue, width/2 + width/4, height/2 + height/4 + height/8, 100, 100);
}

void draw() { 
  
  if (mousePressed){
  ellipse(mouseX, mouseY, 20, 20);
  ellipseMode(CENTER);
  noStroke(); 
  fill(c1, c2, c3, 255);
  
  if ((mouseX <= width/2 - width/4 + 50 && mouseX >= width/2 - width/4 - 50) && (mouseY <= height/2 + height/4 + height/8 + 50 && mouseY >= height/2 + height/4 + height/8 - 50)){  //code based off of https://stackoverflow.com/questions/28744180/make-a-clickable-button-from-an-image//
    c1 = 255;
    c2 = 0;
    c3 = 0;
  }
  
  if ((mouseX <= width/2 + 50 && mouseX >= width/2 - 50) && (mouseY <= height/2 + height/4 + height/8 + 50 && mouseY >= height/2 + height/4 + height/8 - 50)){ 
    c1 = 0;
    c2 = 255;
    c3 = 0;
  }
  if ((mouseX <= width/2 + width/4 + 50 && mouseX >= width/2 + width/4 - 50) && (mouseY <= height/2 + height/4 + height/8 + 50 && mouseY >= height/2 + height/4 + height/8 - 50)){ 
    c1 = 0;
    c2 = 0;
    c3 = 255;
  }
  }
}
