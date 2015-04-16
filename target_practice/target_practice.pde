//Hudson McDaniel
/*
 * Global variables – accessible in any function below.
 */

float objectX = 0; // Horizontal position of object
float objectY = 0; // Vertical position of object
float objectYSpeed = 0;  // Vertical speed of object
float objectDiameter = 0;  // Size of target
float score = 0;       // Keeps track of score
float catcherX = 415; //horizontal position of the catcher
float catcherY = 400; // vertical pozition of the catcher
float catcherWidth = 60; //width of the catcher
float catcherHight = 20; //height of catcher


/*
 * This function runs once, unless explicitly invoked elsewhere.
 */
void setup() {

  // Create a canvas with white background
  size(400, 600);
  background(#00FF0A);

  // newTarget
  newTarget();
}

/*
 * This function runs repeatedly.
 */
void draw() {

  // Clear prior screen
  background(#00FF0A);
  text("score", 10, 50);
  text("objectX is: " + objectX, 50, 100);
  text("objectY is: " + objectY, 50, 200);
  text("catcherX is: " + catcherX, 50, 300);
  text("catcherY is: " + catcherY, 50, 400);
  
  // Update position of the catcher
  catcherX=mouseX;

  //draw catcher
  //rect(catcherX, catcherY, 20, 10);

  rect(mouseX, 415, catcherWidth, catcherHight);
  if (objectX >= catcherX && objectX <= catcherX + catcherWidth && objectY >= catcherY && objectY <= catcherY + catcherHight);
  {
    //newTarget();
  }
 
 
    //newTarget();
 


  // Update position of ball
  objectY = objectY + objectYSpeed;

  // Draw new position of ball
  rect(objectX, objectY, objectDiameter, objectDiameter);

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
  objectYSpeed = random(1, 10);     // Speed varies
  objectDiameter = random(25, 50);  // Diameter varies
  score = 0;                  // Score begins at zero
  fill(0);                    // Black fill for target

  // Show values to illustrate how game works
  println("Horizontal position is: " + objectX);
  println("Vertical position is: " + objectY);
  println("Vertical speed is: " + objectYSpeed);
  println("Size of target is: " + objectDiameter);
  println("Score is: " + score);

  //text("score", 100, 100);
} 
