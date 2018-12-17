int hImg = 100;                    // height of the image
int wImg = 20;                     // width of the image
float gunRotationLimitMax = 90;    // set rotation limit
float gunRotationLimitMin = -90;

PVector rotBasePoint;
PVector rotPoint;
float rotAngle;

Boolean DEBUG = true;

void setup() {
  size(600,600);      // Set window size
  background(255);    // set background color
  frameRate(60);      // set bg frame renew to 60 in 1 second
  
   rotBasePoint = new PVector(width*0.5, height);
   rotPoint     = new PVector();
}


void draw() {
  background(255);    // set bg to white on every frame
  
  // calculate rotation angle according to mouseX position
  rotBasePoint.set(width*0.5, height);
  rotPoint.set(mouseX, mouseY);
  rotAngle = -PI/2 + atan2(PVector.sub(rotBasePoint,rotPoint).y,PVector.sub(rotBasePoint,rotPoint).x);
  
  if(DEBUG == true) {
    pushStyle();
    fill(200,0,0);
    text(degrees(rotAngle) + " degrees\n" + rotAngle + " radians" , 20, 20);
    noFill();
    stroke(200,0,0);
    line(rotBasePoint.x, rotBasePoint.y, rotPoint.x, rotPoint.y);
    popStyle();
  }
  
  pushMatrix();                     // Save current coordinate system
    translate(width*0.5, height);   // translate position of the rect to bottom
    rotate(rotAngle);               // rotate to desired agnle
    translate(-wImg*0.5, -hImg);    // set the pivot point for rotation
    rect(0,0, wImg, hImg);          // draw rectangle to the bottom
  popMatrix();                      // load coordinate system to its old state
  
}
