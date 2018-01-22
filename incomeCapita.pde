class incomeCapita extends yearGdp{
  float regionCapita;
  
  incomeCapita() {
    regionCapita = 0;
  }
  incomeCapita(float x, float y, float s) {
   super(x, y, s); 
  }
  void update(float my) {
    this.regionCapita += my;
  }
  void display() {
    strokeWeight(1);
    stroke(255, 0, 0);
    pushMatrix();
    translate(x, y);
    angle += speed;
    rotate(angle);
    line(0, 0, 90, 0);
    popMatrix();
  }

}