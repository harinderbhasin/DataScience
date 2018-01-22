//
// Assignment 5
// Harry Bhasin and Misael Santana
//

PImage fromImage;
PImage toImage;

void setup() {
  size(1920, 1200);
  toImage = loadImage("TO.jpg");
  // image(toImage, 0, 0);
  fromImage = loadImage("FROM2.jpg");
  // image(fromImage, -100, -100);
}

void draw() {
  int x, y, fwstart, fwstop, fhstart, fhstop, ploc;
  float r, g, b, adjustBrightness;
  
  toImage.loadPixels();
  fromImage.loadPixels();
  
  fwstart = fromImage.width/2+130;
  fwstop = (fromImage.width/2) + (fromImage.width/4);
  fhstart = fromImage.height/2+250;
  fhstop = (fromImage.height/2) + (fromImage.height/4)-130;
  
  for (x = fwstart-200; x < fwstop; x++) {
    for (y = fhstart-300; y < fhstop; y++) {
        ploc = x + (y*fromImage.width);
        toImage.pixels[ploc-600] = fromImage.pixels[ploc];
        r = red   (toImage.pixels[ploc-600]);
        g = green (toImage.pixels[ploc-600]);
        b = blue  (toImage.pixels[ploc-600]);
        adjustBrightness = ((float) mouseX / fromImage.width) * 12.0;
        r *= adjustBrightness;
        g *= adjustBrightness;
        b *= adjustBrightness;
        // Constrain RGB to between 0-255
        r = constrain(r,0,255);
        g = constrain(g,0,255);
        b = constrain(b,0,255);
        // Make a new color and set pixel in the window
        color c = color(r,g,b);
        toImage.pixels[ploc-600] = c;
    }
  }
  toImage.updatePixels();
  image(toImage, -0, -0);
}