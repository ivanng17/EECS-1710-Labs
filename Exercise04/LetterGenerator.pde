class LetterGenerator {
  
  String input;
  PVector position;
  PImage img;

  
  LetterGenerator(String _input, float x, float y) {
    input = _input;
    position = new PVector(x, y);

    switch(input) {
      case "a":
        img = a;
        break;
      case "b":
        img = b;
        break;
      case "c":
        img = c;
        break;
      case "d":
        img = d;
        break;
      case "e":
        img = e;
        break;
    }
  }
  
  
  void draw() {
    imageMode(CENTER);
    image(img, position.x, position.y);
    noTint();
  }

}
