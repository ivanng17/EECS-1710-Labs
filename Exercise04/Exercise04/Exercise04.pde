PImage a, b, c, d, e;
String input;

LetterGenerator lg1, lg2, lg3, lg4, lg5;

void setup() {
  size(800, 600, P2D);
  
  a = loadImage("a.png");
  b = loadImage("b.png");
  c = loadImage("c.png");
  d = loadImage("d.png");
  e = loadImage("e.png");
  
  lg1 = new LetterGenerator("a", width/2, height/2);
  lg2 = new LetterGenerator("b", width/2, height/2);
  lg3 = new LetterGenerator("c", width/2, height/2);
  lg4 = new LetterGenerator("d", width/2, height/2);
  lg5 = new LetterGenerator("e", width/2, height/2);
  
  textAlign(CENTER);
  textSize(48);
  text("type the letters a, b, c, d, e", width/2, height/2); 
}

void draw() {
}

void keyPressed(){
  if (key == 'a' || key == 'A'){
     background(127);
     lg1.draw();
  }
  else if (key == 'b' || key == 'B'){
     background(127);
     lg2.draw();
  }
  else if (key == 'c' || key == 'C'){
     background(127);
     lg3.draw();
  }
  else if (key == 'd' || key == 'D'){
     background(127);
     lg4.draw();
  }
  else if (key == 'e' || key == 'E'){
     background(127);
     lg5.draw();
  }
}
