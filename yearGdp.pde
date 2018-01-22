class yearGdp {
  float grandPopulation;
  float fertility;
  float x, y, speed;
  float angle = 0.0;
  
  yearGdp() {
    grandPopulation = 0;
    fertility = 0;
  }
  yearGdp(float xpos, float ypos, float s) {
    x = xpos;
    y = ypos;
    speed = s;
  }

  void updateGrandPopulation(float region) {
    this.grandPopulation += region;
  }
  void updatefertility(float region) {
    this.fertility += region;
  }

}