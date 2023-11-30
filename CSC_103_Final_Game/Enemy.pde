class Enemy {

  // variables
  int x;
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;

  int speed;
  
  boolean shouldRemove;
  
  
  // constructor
  Enemy(int startingX, int startingY, int startingSpeed){
    x = startingX;
    y = startingY;
    w = 50;
    h = 50;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    speed = startingSpeed;
    
    shouldRemove = false;
  }

  // functions
  void render(){
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  
  void move(){
    y += speed;
      
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
  
  void collision(Player aPlayer){
    // if the enemy and player collide, both take damage
    if (top <= aPlayer.bottom &&
        bottom >= aPlayer.top &&
        left <= aPlayer.right &&
        right >= aPlayer.left){
          println("Player and Enemy collide");
          speed = 0; // queue explosion
          aPlayer.speed = 0;
          explode.play();
          state = 7;
    }
  }

}
