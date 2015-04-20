//Hudson McDaniel
/*
 * Global variables – accessible in any function below.
 */

float objectX = 0; // Horizontal position of object
float objectY = 0; // Vertical position of object
float objectYSpeed = 0;  // Vertical speed of object
float objectDiameter = 0;  // Size of target
float score = 0;       // Keeps track of score
float miss = 0;
float catcherX = 415; //horizontal position of the catcher
float catcherY = 550; // vertical pozition of the catcher
float catcherWidth = 80; //width of the catcher
float catcherHight = 40; //height of catcher
PImage Catcher; //Image of the catcher
PImage WaterM; //Image of the object
PImage bgImage; // Background image




/*
 * This function runs once, unless explicitly invoked elsewhere.
 */
void setup() {

  // Create a canvas with white background
  size(600, 700);

  // newTarget
  newTarget();

  Catcher = loadImage("Catcher.png"); //load the image of the catcher
  WaterM = loadImage("WaterM.png");// lode the image of the object
  bgImage = loadImage("BackgroundImage.png"); //load image
}

/*
 * This function runs repeatedly.
 */
void draw() {
noCursor();
  
  // Clear prior screen
  //imageMode(CENTER);
  //image(test, x, y)
  background(bgImage);
  text("Score:", 50, 50);//Shows the writting of score on the screen
  text(int(score), 100, 50); //adds the score when object has been catched
  text("Miss:", 50, 70);
  text(int(miss), 100, 70); 


  //imageMode(CENTER); //Center the image of the basket on the screen
  image(Catcher, mouseX, 550, catcherWidth, catcherHight); // have the catcher on the screen
  image(WaterM, objectX, objectY, objectDiameter, objectDiameter); 

  //text("objectX is: " + objectX, 50, 100);
  //text("objectY is: " + objectY, 50, 200);
  //text("catcherX is: " + catcherX, 50, 300);
  //text("catcherY is: " + catcherY, 50, 400);

  // Update position of the catcher
  catcherX=mouseX;

  //draw catcher
  //rect(catcherX, catcherY, 20, 10);

  //rect(mouseX, 415, catcherWidth, catcherHight); //object catceher
  if (objectX >= catcherX && objectX <= catcherX + catcherWidth && objectY >= catcherY && objectY <= catcherY + catcherHight) {
    newTarget();
    score = score + 1;
    println("hit");
  } else {
    
    println("no hit");
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
  if (objectY+objectDiameter/2 > height) {
    //newTarget();
    newTarget();
    miss += 1;
  }
}


// newTarget
//
// purpose: put a new target at the top of the screen

void newTarget() {
  // Set game initial values
  // (int) casts, or forces, non-integer results to become integers 
  objectX = random(0, width);       // Horizontal position changes
  objectY = 0 - objectDiameter / 2;       // Target starts just off of top of screen
  objectYSpeed = random(15, 20);     // Speed varies
  objectDiameter = random(25, 50);  // Diameter varies
  fill(0);                    // Black fill for target

  // Show values to illustrate how game works
  println("Horizontal position is: " + objectX);
  println("Vertical position is: " + objectY);
  println("Vertical speed is: " + objectYSpeed);
  println("Size of target is: " + objectDiameter);


} 
