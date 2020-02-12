// Bezier points
controlPoint cp1;
controlPoint cp2;

// Curve Points
controlPoint bp1;
controlPoint bp2;



void setup() {

  size(600, 600);

  // Set window position on screen
  surface.setLocation(0, 0);

  // Init interactive control point 1
  cp1 = new controlPoint(10, 10);

  // Init interactive control point 2
  cp2 = new controlPoint(90, 90);

  // Init interactive bezier curve point 1
  bp1 = new controlPoint(85, 20);

  // Init interactive bezier curve point 2
  bp2 = new controlPoint(15, 80);
}


void draw() {


  background(255);

  noFill();
  stroke(255, 102, 0);
  line(bp1.x, bp1.y, cp1.x, cp1.y);
  line(cp2.x, cp2.y, bp2.x, bp2.y);
  stroke(0, 0, 0);
  bezier(bp1.x, bp1.y, cp1.x, cp1.y, cp2.x, cp2.y, bp2.x, bp2.y);

  // Draw cp1
  cp1.display();

  // Draw cp2
  cp2.display();

  // Draw bp1
  bp1.display();

  // Draw bp2
  bp2.display();
  
  // draw info on canvas
  pushStyle();
  fill(50);
  text("bezier(", 40, height - 40);
  fill(255, 100, 0);
  text(bp1.x + ", " + bp1.y + ", " + cp1.x + ", " + cp1.y + ", " + cp2.x + ", " + cp2.y + ", " + bp2.x + ", " + bp2.y, 40 + textWidth("bezier("), height - 40);
  fill(50);
  text(");", 40 + textWidth("bezier(") + textWidth(bp1.x + ", " + bp1.y + ", " + cp1.x + ", " + cp1.y + ", " + cp2.x + ", " + cp2.y + ", " + bp2.x + ", " + bp2.y), height - 40);
  popStyle();
}
