//Hudson McDaniel
/*
 * Global variables – accessible in any function below.
 */
 
float x = 0; // Horizontal position of target
float y = 0; // Vertical position of target
float ySpeed = 0;  // Vertical speed of target
float diameter = 0;  // Size of target
float score = 0;       // Keeps track of score
float xObj = 400; //oject
float xCatcher = diameter; //object catcher

/*
 * This function runs once, unless explicitly invoked elsewhere.
 */
void setup() {

  // Create a canvas with white background
  size(400, 600);
  background(255);

// newTarget
  newTarget();
  
}

/*
 * This function runs repeatedly.
 */
void draw() {

  // Clear prior screen
  background(255);
  
  //catch
  rect(mouseX, 400, 60, 20);
  //rect(mouseX,415, 20, 10);
  if(xObj >= xCatcher && xObj <= xCatcher +25);
  {
    newTarget();
  }
  


  // Update position of ball
  y = y + ySpeed;

  // Draw new position of ball
  rect(x, y, diameter, diameter);
  
  // check for hit
  float a = mouseX - x; 
  float b = mouseY - y;
  float c = sqrt( a*a + b*b ); 
  if ( c <= diameter/2 && mousePressed) {
   newTarget(); 
  }
  
  //create new ball
  if(y+diameter/2 > height) {
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
  x = random(0, width);       // Horizontal position changes
  y = 0 - diameter / 2;       // Target starts just off of top of screen
  ySpeed = random(1, 10);     // Speed varies
  diameter = random(25, 50);  // Diameter varies
  score = 0;                  // Score begins at zero
  fill(0);                    // Black fill for target
  
  // Show values to illustrate how game works
  println("Horizontal position is: " + x);
  println("Vertical position is: " + y);
  println("Vertical speed is: " + ySpeed);
  println("Size of target is: " + diameter);
  println("Score is: " + score);
}
