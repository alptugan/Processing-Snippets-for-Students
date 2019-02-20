import processing.video.*;      // Import built-in Video library

String vidSrc;                  // Specifiy video file path
Movie myMovie;                  // Declare video player

Boolean mLoop;                  // video loop enable/disable

void setup() {
  // Set window size
  size(320, 240);

  // You should write your video file name in your sketch folder
  vidSrc = "/Users/alptugan/oF/assets/fingers.mov";

  // initialize video player
  myMovie = new Movie(this, vidSrc);
  
  // Set video loop to false
  mLoop = false;
}

// Read movie frames
void movieEvent(Movie m) {
  m.read();
}

void draw() {
  // set background color
  background(0);
  
  // draw video player frames to window
  image(myMovie, 0, 0, width, height);
  
  // info text
  text("Press p to play\nPress s to stop\nPress r to re-play\nPress l to on/off loop mode", 20, 20);  
}

void keyPressed() {
  // press "p" on the keyboard to play movie
  // press "s" on the keyboard to stop movie
  // press "r" on the keyboard to replay movie
  // press "l" on the keyboard to switch loop mode on/off
  if (key == 'p') {
    myMovie.play();
  } else if (key == 's') {
    myMovie.stop();
  } else if (key == 'r') {
    myMovie.stop();
    myMovie.play();
  }else if (key == 'l') {
    mLoop = !mLoop;
    if(mLoop == true) {
       myMovie.loop(); 
    }else{
      myMovie.noLoop();
    }
  }
}
