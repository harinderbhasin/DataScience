class MyCylinder {
  float bottom;
  float top;
  float h;
  int sides;
  float xp; //for translation
  float yp; //for translation
//  float z; //for translation
  
  MyCylinder() {
   this.bottom=0.0;
   this.top=0.0;
   this.h=0.0;
   this.sides=0;
   this.xp=0.0; //for translation
   this.yp=0.0; //for translation
//   this.z=0.0; //for translation
  
  }
  
  
  void drawMyCylinder(float bottom, float top, float h, int sides, float xp, float yp)
{
  pushMatrix();
  
  translate(xp,yp,h/2);
  
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
  
  float[] x2 = new float[sides+1];
  float[] z2 = new float[sides+1];
 
  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * bottom;
    z[i] = cos(angle) * bottom;
  }
  
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x2[i] = sin(angle) * top;
    z2[i] = cos(angle) * top;
  }
 
  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN);
 
 // vertex(0,   -h/2,    0);
   vertex(0,   0,    -h/2);
  for(int i=0; i < x.length; i++){
    vertex(x[i], z[i], -h/2);
  }
 
  endShape();
 
  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 
 
  for(int i=0; i < x.length; i++){
    //vertex(x[i], -h/2, z[i]);
    //vertex(x2[i], h/2, z2[i]);
    vertex(x[i], z[i], -h/2);
    vertex(x2[i], z2[i], h/2);  
    
  }
 
  endShape();
 
  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN); 
 
  vertex(0,   0,    h/2);
 
  for(int i=0; i < x.length; i++){
 //   vertex(x2[i], h/2, z2[i]);
    vertex(x2[i], z2[i], h/2);
  }
 
  endShape();
  
  popMatrix();
}

}//end of the class