class gDp extends yearGdp {
  float regionGdp;
  float population;
  int initDone;
  
  gDp() {
    regionGdp = 0;
    population = 0;
    initDone = 1;
  }
  gDp(float x, float y, float s) {
   super(x, y, s); 
  }
  int isInitDone() {
    if (this.initDone == 1)
      return (1);
    else
      return (0);
  }
  void updatePopulation(float my) {
    this.population += my;
  }
  void updateGdp(float my) {
    this.regionGdp += my;
  }
  void display() {
    strokeWeight(1);
    stroke(0, 255, 0);
    pushMatrix();
    translate(x, y);
    angle += speed;
    rotate(angle);
    line(0, 0, 185, 0);
    popMatrix();
  }
}