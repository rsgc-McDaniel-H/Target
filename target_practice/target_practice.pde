//Hudson McDaniel //<>// //<>//
/*
 * Global variables – accessible in any function below.
 */
boolean start = true; //
boolean play = true; //
boolean reset = true; //
boolean scoreChanger = true;
boolean speedChanger = true;
float objectX = 390; // Horizontal position of object
float objectY = 0; // Vertical position of object
float objectYSpeed = 0;  // Vertical speed of object
float objectDiameter = 0;  // Size of target
float score = 0;       // Keeps track of score
float miss = -1;        // keeps track of misses
float catcherX = 415; //horizontal position of the catcher
float catcherY = 550; // vertical pozition of the catcher
float catcherWidth = 80; //width of the catcher
float catcherHight = 40; //height of catcher
PImage Catcher; //Image of the catcher
PImage WaterM; //Image of the object
PImage bgImage; // Background image
PImage heartImage; //image of the live heart
PImage Hamburger; //object hamburger
PImage pizzaSl; //Image of Pizza
PImage gameOver; //image of game over
PImage startGame;
PImage blackBox;
int backG1 = 1;
int backG2 = 2;
PImage background1 = bgImage;
PImage background2 = startGame;
float chooser = 0; //this iteam dropped
PImage basketImage2;

/*
 * This function runs once, unless explicitly invoked elsewhere.
 */
void setup() {


  // Create a canvas with white background
  size(450, 600);

  // newTarget
  newTarget();

  Catcher = loadImage("Catcher.png"); //load the image of the catcher
  WaterM = loadImage("WaterM.png");// lode the image of the object
  bgImage = loadImage("BackgroundImage.png"); //load image
  //heartImage = loadImage("Heart.png"); // loade image of the heart
  Hamburger = loadImage("Hamburger.png"); // load image of the hamburger
  pizzaSl = loadImage("Pizza.png"); //load The image of the Pizza
  gameOver = loadImage("GameOver.png");//load the image of game over
  startGame = loadImage("StartGame.png");
  blackBox = loadImage("Black Box");
  basketImage2 = loadImage("Basket2.png");
}


/*
 * This function runs repeatedly.
 */
void draw() {




  //noCursor();

  //void keyReleased(){
  //if(background == startGame) {
  //background = bgImage;
  //} else {
  //  background = startGame;
  //}
  //}


  //if (miss > 4)
  //textSize (100);
  //fill(100, 100, 100);
  //text("GAME OVER", 300, 300);

  // Clear prior screen
  //imageMode(CENTER);
  //image(test, x, y)
  //if(play == true) {
  background(bgImage);
  //}
  if (start == true) {
    background(startGame);
  }
  text("Score:", 50, 30);//Shows the writting of score on the screen
  text(int(score), 100, 30); //adds the score when object has been catched
  text("Miss:", 50, 50);//position of the miss on the screen
  text(int(miss), 100, 50); //miss variable conting misses


  //imageMode(CENTER); //Center the image of the basket on the screen
  if (start == false) {

    image(WaterM, objectX, objectY, objectDiameter, objectDiameter); 
  }
    //image(Hamburger, objectX, objectY, objectDiameter, objectDiameter);
    //image(pizzaSl, objectX, objectY, objectDiameter, objectDiameter);
  
  //image(heartImage, 400, 50);
  if (start == false) {
    image(basketImage2, mouseX, 550, catcherWidth, catcherHight); // have the catcher on the screen
  }
  //text("objectX is: " + objectX, 50, 100);
  //text("objectY is: " + objectY, 50, 200);
  //text("catcherX is: " + catcherX, 50, 300);
  //text("catcherY is: " + catcherY, 50, 400);

  // Update position of the catcher
  catcherX=mouseX;

  //draw catcher
  //rect(catcherX, catcherY, 20, 10);

  //rect(mouseX, 415, catcherWidth, catcherHight); //object catceher
  if (start == false) {
    if (objectX >= catcherX && objectX <= catcherX + catcherWidth && objectY >= catcherY && objectY <= catcherY + catcherHight) {
      newTarget();
      score = score + 1;
      println("hit");
    } else {

      println("no hit");
    }
  }


  //newTarget();



  // Update position of ball
  objectY = objectY + objectYSpeed;

  // Draw new position of ball

  //rect(objectX, objectY, objectDiameter, objectDiameter);


  // check for hit
  float a = mouseX - objectX; 
  float b = mouseY - objectY;
  float c = sqrt( a*a + b*b ); 
  if ( c <= objectDiameter/2 && mousePressed) {
    newTarget();
  }

  //create new ball when it hits the bottom of the screen
  if (start == false) {
    if (objectY+objectDiameter/2 > height) {
      //newTarget();
      newTarget();
      miss += 1;
    }
  }
}


// newTarget
//
// purpose: put a new target at the top of the screen

void newTarget() {
  // choose what Image appears
  chooser = random(0, 3);

  // (int) casts, or forces, non-integer results to become integers 
  objectX = random(0, width);       // Horizontal position changes
  objectY = 0 - objectDiameter / 2;       // Target starts just off of top of screen
  objectYSpeed = random(5, 10);     // Speed varies
  objectDiameter = random(25, 50);  // Diameter varies
  fill(0);                    // Black fill for target


  // Show values to illustrate how game works
  //println("Horizontal position is: " + objectX);
  //println("Vertical position is: " + objectY);
  //println("Vertical speed is: " + objectYSpeed);
  //println("Size of target is: " + objectDiameter);



  if (score >= 10) {
    objectYSpeed = random(10, 15);  //Increses speed when score reacehs a certain number Level 1
    //image(WaterM, objectX, objectY, objectDiameter, objectDiameter);
  }

  if (score >= 20) {
    objectYSpeed = random(10, 20);  //Increses speed when score reacehs a certain number Level 2
    //image(Hamburger, objectX, objectY, objectDiameter, objectDiameter);
  }
  if (score >= 30) {
    objectYSpeed = random(20, 25);  //Increses speed when score reacehs a certain number Level 3
  }

  if (score >= 50) {
    objectYSpeed = random(25, 30);  //Increses speed when score reacehs a certain number Level 4
  }

  if (miss >= 5) {
    objectYSpeed = random(0, 0); 
    //background(gameOver);
  }


  //if(key == 'a'){
  // miss = 0;

  //}
}



void keyReleased() {

  if (key == 's') { //changes back ground from game to start
    start = false;
  } else {
 // fill(#FF0000);
    //text("Press S to Start", 400, 200);
   //objectYSpeed = random(0, 0);
  }
}
  
  void keyPressed() {
  
  if(key == 'p') {
    play = false; // the game will paus itself
    objectYSpeed = random(0, 0);
  } else {
     play = true; //the game will resume itslef
     objectYSpeed = random(10, 15);
  } 
  
  if(key == 'r') {
    reset = false; //
    miss = 0;
    score = 0;
   
  }
  
  if(key == '=') {
    scoreChanger = false;
    miss = 0;
    
  }
  
  } 
