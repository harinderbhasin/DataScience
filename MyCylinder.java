//
// Final Project - 3D Visualization of GDP and the Life Expectancy
// Name: Harry Bhasin and Misael Santana
//
import processing.core.PApplet;

public class MyCylinder {
	  float bottom;
	  float top;
	  float h;
	  int sides;
	  float xp; //for translation
	  float yp; //for translation
	  PApplet pA; // for the processing
	  
	  // the constructor is passed with the processing object
	  MyCylinder(PApplet p) {
	   this.bottom = 0.0f;
	   this.top = 0.0f;
	   this.h = 0.0f;
	   this.sides = 0;
	   this.xp = 0.0f; //for translation
	   this.yp = 0.0f; //for translation
       // here we set up the processing object
	   this.pA = p;
	  }
	  
	  
	  public void drawMyCylinder(float bottom, float top, float h, int sides, float xp, float yp) {
	    pA.pushMatrix();
	  
	    pA.translate(xp,yp,h/2);
	  
	    float angle = 0f;
	    float[] x = new float[sides+1];
	    float[] z = new float[sides+1];
	  
	    float[] x2 = new float[sides+1];
	    float[] z2 = new float[sides+1];
	 
	  //get the x and z position on a circle for all the sides
  	    for(int i=0; i < x.length; i++){
	      angle = pA.TWO_PI / (sides) * i;
	      x[i] = pA.sin(angle) * bottom;
	      z[i] = pA.cos(angle) * bottom;
	    }
	  
	  for(int i=0; i < x.length; i++){
	    angle = pA.TWO_PI / (sides) * i;
	    x2[i] = pA.sin(angle) * top;
	    z2[i] = pA.cos(angle) * top;
	  }
	 
	  //draw the bottom of the cylinder
	  pA.beginShape(pA.TRIANGLE_FAN);
	 
	 // vertex(0,   -h/2,    0);
	  pA.vertex(0,   0,    -h/2);
	  for(int i=0; i < x.length; i++){
	    pA.vertex(x[i], z[i], -h/2);
	  }
	 
	  pA.endShape();
	 
	  //draw the center of the cylinder
	  pA.beginShape(pA.QUAD_STRIP); 
	 
	  for(int i=0; i < x.length; i++){
	    //vertex(x[i], -h/2, z[i]);
	    //vertex(x2[i], h/2, z2[i]);
	    pA.vertex(x[i], z[i], -h/2);
	    pA.vertex(x2[i], z2[i], h/2);  
	    
	  }
	 
	  pA.endShape();
	 
	  //draw the top of the cylinder
	  pA.beginShape(pA.TRIANGLE_FAN); 
	 
	  pA.vertex(0,   0,    h/2);
	 
	  for(int i=0; i < x.length; i++){
	 //   vertex(x2[i], h/2, z2[i]);
	    pA.vertex(x2[i], z2[i], h/2);
	  }
	 
	  pA.endShape();
	  
	  pA.popMatrix();
	}

} //end of the class
