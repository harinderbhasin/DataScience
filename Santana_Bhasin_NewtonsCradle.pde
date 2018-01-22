// Assignment 3 - Newton's Cradle
// Misael Santana and Harry Bhasin
// Note: chapter 3 of the book was reviewed to help draw the circle using vertex

// save the image for texture
PImage bImage;

// angle of movements of steel balls
float teta = 45;
float teta2 = -10;
float teta3 = -45;
//float teta4 = 5;

void setup(){

  size(700, 400, P2D);
  // we load the steel ball image here for the texture
  bImage = loadImage("steelball.png");
  // image(bImage, 0, 0);
}

// this is where a string and the circle is implemented
void pendulum(float x, float y, float rad, float angle){
  float teta;
  float dx;
  float dy;
  int units = 36; // use 36 to draw a proper circle
  float radius = 40; // radius of the circle

  // calculate the diameter
  teta = (angle*PI)/180.0;
  
  dx = (10*rad)*sin(teta);
  dy = (10*rad)*cos(teta);

  strokeWeight(3);
  line(x, y, x+dx, y+dy);

  circlewithTexture(x+dx, y+dy, units, radius);

}

// using vertex to draw circle as texture had to be fit in
void circlewithTexture(float xPos, float yPos, int units, float radius) {
    float theta = 0;
    float x, y, tx, ty;
    int i;
    
    strokeWeight(0);
    beginShape();
    texture(bImage);
    // draw as many units
    for (i = 0; i < units; i++) {
      x = xPos + (cos(theta) * radius);
      y = yPos + (sin(theta) * radius);
      // map to the texture 80, 80 is the centre of the steel ball
      tx = 80 + (cos(theta) * 40);
      ty = 80 + (sin(theta) * 40);
      // point(u, v);
      vertex(x, y, tx, ty);
      // the angle/theta changes as the movement goes clockwise
      theta += TWO_PI/units;
    }
    endShape(CLOSE); // end the shape and close it
}

float count;
void draw(){
  float unit = 20; // individual block
  float angle;
  
  background(214, 162, 76);
  angle = teta;
  // only x value will change as all the balls
  // are aligned in straight line
  pendulum(26*unit, unit, unit, angle);
  // commenting out the loop as the movement slows down
  // int i;
  // for(i = 22; i <=10; i -= 4) {
  //   pendulum(i*unit,20,20,0);
  // }
  angle = 0;
  pendulum(22*unit, unit, unit, 0);
  pendulum(18*unit, unit, unit, 0);
  pendulum(14*unit, unit, unit, 0);  
  pendulum(10*unit, unit, unit, 0);
  if (teta> 0) {
    teta = teta - 2;
  } else {
    // here the motion of last 2 balls
    background(214, 162, 76);
    pendulum(26*unit, unit, unit, 0);
    pendulum(22*unit, unit, unit, 0); 
    pendulum(18*unit, unit, unit, 0);
    pendulum(14*unit, unit, unit, teta2);  
    pendulum(10*unit, unit, unit, teta3);   
    if (teta3 < 0) {
      // gradual movement
      teta2 = teta2 + 2;
      teta3 = teta3 + 2;
      if (teta2>0) { teta2=0; } 
    } 
    
    count=count+1;
    if (count>45) {
      count=0;
      teta = 45;
      teta2 = -10;
      teta3 = -45;
    }

  } 
  
 
  
  
}