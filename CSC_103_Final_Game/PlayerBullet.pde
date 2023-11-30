class PlayerBullet {

  // variables
  int x;
  int y;
  int d;
  int speed;
  
  boolean shouldRemove;
  
  int left;
  int right;
  int top;
  int bottom;
  
  // constructor
  PlayerBullet(int startingX, int startingY){
    x = startingX;
    y = startingY;
    
    d = 10;
    
    speed = 10;
    
    shouldRemove = false;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  
  void render(){
    circle(x, y, d);
  }
  
  void move(){
    y -= speed;
    
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }
  
  void checkRemove(){
    if (y < 0) {
      shouldRemove = true;
    }
  }
  
  void shootEnemy(Enemy anEnemy){
    // if the bullet hits the enemy, then flag the enemy to be removed/take damage
    if (top <= anEnemy.bottom &&
        bottom >= anEnemy.top &&
        left <= anEnemy.right &&
        right >= anEnemy.left){
          println("Enemy hit");
          shouldRemove = true;
          anEnemy.shouldRemove = true;
          score += 1;
          explode.play();
    }
  }
  
}
