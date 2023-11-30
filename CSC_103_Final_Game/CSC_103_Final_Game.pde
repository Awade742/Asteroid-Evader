import processing.sound.*;

// declaring my vars
Player p1;

// font
PFont font;

// sound
SoundFile bgMusic;
SoundFile bulletNoise;
SoundFile explode;

// declaring pictures and animations
Animation player1Animation;
PImage[] player1Images = new PImage[2]; // player sprite
Animation rockAnimation;
PImage[] rockImages = new PImage[2]; // enemy sprite
PImage bulletImg; // bullet sprite
PImage spaceBkg; // background image

ArrayList<PlayerBullet> playerBulletList;
ArrayList<Enemy> enemyList;

// timer vars
int startTime;
int currentTime;
int interval = 2000;
int spawnInterval = 2000;
int lastSpawn;

// state var
int state = 0;

// score var
int score;

void setup() {
  size(800, 600);
  font = loadFont("BerlinSansFB-Reg-48.vlw");
  textFont(font, 50);
  textAlign(CENTER);
  imageMode(CENTER);

  // initialize my vars
  p1 = new Player(width/2, height - 50, 50, 50);
  
  // sound
  bgMusic = new SoundFile(this, "bgMusic.mp3");
  bulletNoise = new SoundFile(this, "Pew.wav");
  explode = new SoundFile(this, "Explode.wav");
  bgMusic.amp(0.25);
  explode.amp(0.50);
  
  // initializing pics and animation
  bulletImg = loadImage("bullet.png");
  bulletImg.resize(10, 20);
  spaceBkg = loadImage("space.jpg");
  spaceBkg.resize(800, 600);
  
  for (int i = 1; i < 3; i++){
    player1Images[i-1] = loadImage("Player1" + i + ".png");
  }
  player1Animation = new Animation(player1Images, 0.1, 1);
  
  for (int i = 0; i < 2; i++){
    rockImages[i] = loadImage("Rock1" + i + ".png");
  }
  rockAnimation = new Animation(rockImages, 0.1, 1);

  playerBulletList = new ArrayList<PlayerBullet>();
  enemyList = new ArrayList<Enemy>();

  startTime = millis();
  lastSpawn = millis();
  
  score = 0;
}


void draw() {
  background(spaceBkg);
  if (bgMusic.isPlaying() == false){
    bgMusic.play();
  }

  // different states
  switch(state) {
  // starting screen
  case 0:
    emptyEnemyArrayList();
    p1 = new Player(width/2, height - 50, 50, 50);
    background(spaceBkg);
    textSize(50);
    text("Asteroid Evader", width/2, height/2 - 35);
    textSize(25);
    text("press r to start", width/2, height/2);
    text("press i for instructions", 130, 30);
    score = 0;
    currentTime = millis();
    startTime = millis();
    break;

  // level 1
  case 1:
    background(spaceBkg);
    textSize(25);
    text(score, 25, 25);
    p1.render();
    p1.move();
    p1.checkBorder();
    
    player1Animation.display(p1.x, p1.y);
    player1Animation.isAnimating = true;

    for (Enemy anEnemy : enemyList) {
      if (!anEnemy.shouldRemove) {
        anEnemy.render();
        rockAnimation.display(anEnemy.x, anEnemy.y);
        rockAnimation.isAnimating = true;
        anEnemy.move();
        anEnemy.collision(p1);
      }
    }

    // timer code for enemy bullets and enemies

    currentTime = millis();

    if (currentTime - lastSpawn > spawnInterval) {
      // add enemy to list
      enemyList.add(new Enemy(int(random(0, width)), 0, 1));
      // set spawnInterval to random number
      spawnInterval = int(random(1000, 3000));

      if (currentTime - startTime >= 15000) {
        state = 2;
        startTime = millis();
      }

      lastSpawn = millis();
    }
    break;

  // level 2 intro
  case 2:
    emptyEnemyArrayList();
    p1 = new Player(width/2, height - 50, 50, 50);
    background(spaceBkg);
    textSize(50);
    text("Level 2", width/2, height/2 - 35);
    textSize(25);
    text("Press 2 to continue", width/2, height/2);
    break;

  // level 2
  case 3:
    background(spaceBkg);
    textSize(25);
    text(score, 25, 25);
    p1.render();
    p1.move();
    p1.checkBorder();

    player1Animation.display(p1.x, p1.y);
    player1Animation.isAnimating = true;

    for (Enemy anEnemy : enemyList) {
      if (!anEnemy.shouldRemove) {
        anEnemy.render();
        rockAnimation.display(anEnemy.x, anEnemy.y);
        rockAnimation.isAnimating = true;
        anEnemy.move();
        anEnemy.collision(p1);
      }
    }

    // timer code for enemy bullets and enemies

    currentTime = millis();

    if (currentTime - lastSpawn > spawnInterval) {
      // add enemy to list
      enemyList.add(new Enemy(int(random(0, width)), 0, 5));
      // set spawnInterval to random number
      spawnInterval = int(random(1000, 5000));

      if (currentTime - startTime >= 20000) {
        state = 4;
        startTime = millis();
      }

      lastSpawn = millis();
    }
    break;

  // level 3 Intro
  case 4:
    emptyEnemyArrayList();
    p1 = new Player(width/2, height - 50, 50, 50);
    background(spaceBkg);
    textSize(50);
    text("Level 3", width/2, height/2 - 35);
    textSize(25);
    text("Press 3 to continue", width/2, height/2);
    break;

  // level 3
  case 5:
    background(spaceBkg);
    textSize(25);
    text(score, 25, 25);
    p1.render();
    p1.move();
    p1.checkBorder();

    player1Animation.display(p1.x, p1.y);
    player1Animation.isAnimating = true;

    for (Enemy anEnemy : enemyList) {
      if (!anEnemy.shouldRemove) {
        anEnemy.render();
        rockAnimation.display(anEnemy.x, anEnemy.y);
        rockAnimation.isAnimating = true;
        anEnemy.move();
        anEnemy.collision(p1);
      }
    }

    // timer code for enemy bullets and enemies

    currentTime = millis();

    if (currentTime - lastSpawn > spawnInterval) {
      // add enemy to list
      enemyList.add(new Enemy(int(random(0, width)), 0, 10));
      // set spawnInterval to random number
      spawnInterval = int(random(1000, 5000));

      if (currentTime - startTime >= 20000) {
        state = 6;
        startTime = millis();
      }

      lastSpawn = millis();
    }
    break;

  // win screen
  case 6:
    background(spaceBkg);
    textSize(50);
    text("You have safely", width/2, height/2 - 80);
    text("navigated the asteroid belt!", width/2, height/2 - 35);
    textSize(25);
    text("Press 1 to return to menu", width/2, height/2 + 100);
    break;

  // lose screen
  case 7:
    background(spaceBkg);
    textSize(50);
    text("Your ship has been destroyed!", width/2, height/2 - 35);
    textSize(25);
    text("Press 1 to return to menu", width/2, height/2);
    break;
    
  // instructions  
  case 8:
    background(spaceBkg);
    textSize(50);
    text("Instructions", width/2, 100);
    textSize(25);
    text("You are a spaceship trying to safely pass through an asteroid belt.", width/2, 200);
    text("Use the A and D keys to avoid the asteroids.", width/2, 250);
    text("Press spacebar to shoot bullets and destroy the asteroids.", width/2, 300);
    text("Good Luck!", width/2, 350);
    text("Press 1 to return to Main Menu", width/2, height - 30);
    break;
  }


  // for loop that goes through all player bullets
  for (PlayerBullet aPlayerBullet : playerBulletList) {
    aPlayerBullet.render();
    image(bulletImg, aPlayerBullet.x, aPlayerBullet.y);
    aPlayerBullet.move();
    aPlayerBullet.checkRemove();
    for (Enemy anEnemy : enemyList) {
      aPlayerBullet.shootEnemy(anEnemy);
    }
  }

  // for loop that removes unwanted player bullets
  for (int i = playerBulletList.size() - 1; i >= 0; i -= 1) {
    PlayerBullet aPlayerBullet = playerBulletList.get(i);

    if (aPlayerBullet.shouldRemove == true) {
      playerBulletList.remove(aPlayerBullet);
    }
  }
}

// player controls
void keyPressed() {
  if (key == 'a') {
    p1.isMovingLeft = true;
  }

  if (key == 'd') {
    p1.isMovingRight = true;
  }

  if (key == ' ') {
    playerBulletList.add(new PlayerBullet(p1.x, p1.y));
    bulletNoise.play();
  }

  if (key == 'r') {
    state = 1;
  }
  
  if (key == '1') {
    state = 0;
  }

  if (key == '2') {
    state = 3;
  }

  if (key == '3') {
    state = 5;
  }
  
  if (key == 'i') {
    state = 8;
  }
}

void keyReleased() {
  if (key == 'a') {
    p1.isMovingLeft = false;
  }

  if (key == 'd') {
    p1.isMovingRight = false;
  }
}

void emptyEnemyArrayList(){
  for (int i = enemyList.size() - 1; i >= 0; i--){
    enemyList.remove(0);
  }
}
