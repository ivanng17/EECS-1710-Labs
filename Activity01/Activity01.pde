int numSpheros = 1;
int numFoods = 1;

Sphero[] spheros = new Sphero[numSpheros]; //code referenced from: https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week04/Creature03
Food[] foods = new Food[numFoods];

void setup() { 
  size(800, 600);
  
  for (int i=0; i<spheros.length; i++) {
    spheros[i] = new Sphero(random(width), random(height));
  }
  
  for (int i=0; i<foods.length; i++) {
    foods[i] = new Food(mouseX, mouseY);
  }
}

void draw(){
  for (int i=0; i<spheros.length; i++) {
    spheros[i].run();
  }
  for (int i=0; i<foods.length; i++) {
    foods[i].run();
  }
}
