ArrayList<PVector> drips;         // Create drips array

int dripsLength;

float startPosY;
int particleSize;

FloatList acceleration;
FloatList gravity;

void setup() {
  size(600, 600);                    // Create application window

  dripsLength  = 10;               // Number of drips to fall
  particleSize = 10;                // Particle size
  startPosY    = -particleSize*0.5; // Drips start position on y coordinate

  drips        = new ArrayList<PVector>(); 
  acceleration = new FloatList();
  gravity      = new FloatList();
  
  for (int i = 0; i < dripsLength; i++) {
    gravity.append(random(0.01, 0.2));
    acceleration.append(0.0);
    drips.add(new PVector(random(particleSize*0.5, width - particleSize*0.5), startPosY));
  }
}

void draw() {
  background(255);      // Set bg color

  for (int i = 0; i < dripsLength; i++) {
    drips.get(i).y = drips.get(i).y + acceleration.get(i);
    
    acceleration.set(i,acceleration.get(i) + gravity.get(i));
    
    fill(0);             // Set fill color to black
    ellipse(drips.get(i).x, drips.get(i).y, particleSize, particleSize); 
    
    if (drips.get(i).y > height + particleSize*0.5) {  //condition if Vertical is greater than 600 then perform action below
      acceleration.set(i, acceleration.get(i) * 0);    //-.085 is an arbitrary number that took some experimenting with
      drips.get(i).y = startPosY;                      // Move it to top and set random x position
      drips.get(i).x = random(particleSize*0.5, width - particleSize*0.5); 
    }
  }
}
