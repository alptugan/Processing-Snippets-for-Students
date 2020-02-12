class controlPoint {
  int x, y;
  color cl;
  float rad;
  boolean isDown;

  controlPoint(int x, int y) {
    this.x = x;
    this.y = y;

    rad = 6;
    cl = color(255, 100, 0);
    isDown = false;
  }

  void display() {
    pushStyle();
    noStroke();
    fill(cl);
    circle(this.x, this.y, rad);
    popStyle();

    if (dist(mouseX, mouseY, this.x, this.y) < rad) {
      cl = color(100, 255, 0);

      if (mousePressed) {
        isDown = true;
      }
    } else {
      cl = color(255, 100, 0);
    }
    
    
    if(!mousePressed) {
      isDown = false;
    }

    if (isDown) {
      cl = color(100, 255, 0);
      this.x = mouseX;
      this.y = mouseY;
    }
  }
}
