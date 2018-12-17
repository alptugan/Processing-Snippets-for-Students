int hImg = 100;
int wImg = 20;
float gunRotationLimitMax = 90;
float gunRotationLimitMin = -90;

void setup() {
  size(600,600);      // Set window size
  background(255);    // set background color
  frameRate(60);      // set bg frame renew to 60 in 1 second
}


void draw() {
  background(255);    // set bg to white on every frame
  
  // calculate rotation angle according to mouseX position
  float centerM = map(mouseX,0,width,gunRotationLimitMin,gunRotationLimitMax);
  pushMatrix();                   // Save current coordinate system
  translate(width*0.5, height);   // translate position of the rect to bottom
  rotate(radians(centerM));       // rotate to desired agnle
  translate(-wImg*0.5, -hImg);    // set the pivot point for rotation
  rect(0,0, wImg, hImg);          // draw rectangle to the bottom
  popMatrix();                    // load coordinate system to its old state
  
}
