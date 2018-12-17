/*
a jumping action

HIT Space to simulate jumping action
 */

float ballX = 100;
float ballY = 0;
float h = 50;

//create a variable for speed
float speedY = 2;
int direction = 1;
int jumpDist = 100;

void setup() {
  size(600, 600);
  smooth();
  noStroke();

  // change the mode we draw circles so they are
  // aligned in the top left
  ellipseMode(CORNER);

  // Put the charater to ground
  ballY = height - h;
}

void draw() {
  //clear the background and set the fill colour
  background(255);
  fill(20);

  
  if ( direction == 1) {
    //add a little gravity to the speed
    speedY = speedY + 0.5;  

    //add speed to the ball's
    ballY = ballY + speedY; 


    if (ballY > height - h) {
      // set the position to be on the floor
      ballY = height - h;
      // and make the y speed 0 to keep character on the ground
      speedY = 0;
    }
  }
  
  if ( direction == -1) {
    //add a little gravity to the speed
    speedY = speedY + 30;  

    //add speed to the ball's
    ballY = height - h - speedY; 


    if (ballY <= jumpDist) {
       direction = 1;
       speedY = 2;
    }
  }
  
  //draw the circle in it's current position
  ellipse(ballX, ballY, h, h);

}

void keyPressed() {

  // if the key is SPACE and ball is on the ground still then jump
  if (key == ' ' && ballY == height - h) {
    ballY = jumpDist;
    direction = -1;
  }
}
