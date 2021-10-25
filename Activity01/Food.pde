class Food {
  
  PVector position; //code referenced from: https://github.com/eecs17xx/eecs1710-2021f/tree/xeek04/Cry03
  PImage food;
  boolean alive = true;


  Food(float mouseX, float mouseY) {
    position = new PVector(mouseX, mouseY);
  }
  
  void draw() {
    if (alive) {
      imageMode(CENTER);
      food = loadImage("food.png");
      image(food, mouseX, mouseY, 40, 40);
    }
  }
  
  void mouseMoved(){
  position.x = mouseX;
  position.y = mouseY;
  }

  void run() {
    draw();
  }
}
