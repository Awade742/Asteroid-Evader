class Player {

  // variables
  int x;
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  
  int speed;
  
  
  // constructor
  Player(int startingX, int startingY, int startingW, int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    isMovingLeft = false;
    isMovingRight = false;
    
    speed = 15;
  }

  // functions
  void render(){
    rectMode(CENTER);
    noFill();
    noStroke();
    rect(x, y, w, h);
  }
  
  void move(){
    if (isMovingLeft == true){
      x -= speed;
    }
    
    if (isMovingRight == true){
      x += speed;
    }
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
  
  void checkBorder(){
    // left
    if (x <= 0 + w/2){
      isMovingLeft = false;
    }
  
    // right
    if (x >= width - w/2){
      isMovingRight = false;
    }
  }

}
