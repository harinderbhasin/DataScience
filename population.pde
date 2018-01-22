class population extends yearGdp {
  float regionPopulation;

  population() {
    regionPopulation = 0;
  }
  population(float x, float y, float s) {
   super(x, y, s); 
  }
  void update(float my) {
    this.regionPopulation += my;
  }
  void display() {
    strokeWeight(1);
    stroke(0, 0, 255);
    pushMatrix();
    translate(x, y);
    angle += speed;
    rotate(angle);
    line(0, 0, 45, 0);
    popMatrix();
  }

}