import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

  Table myTable; 
  PeasyCam cam;

  MyCylinder cy;

  float count=1960;
  float spdcount = 1;
  float year,le,fert,pop,gdp;

  String country="";



void setup(){
  size(1000,900,P3D);
  cam = new PeasyCam(this, 1200);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(2000);

  myTable = loadTable("wbdata.csv", "header");

  cy = new MyCylinder();
  
  noStroke();
  
  fill(250, 30, 60);
  

}

void draw(){
  background(204);
  
  translate(-width/2, -height/2, 150);
 
//  pointLight(255,255,255,500,500,500);
  pointLight(126, 200, 226, mouseX, mouseY, 255);

  strokeWeight(9);
  stroke(255, 0, 0);
  line(0, 0, 0, 1000, 0, 0);
  
  fill(0);
  textSize(32);
  text("Life Expectancy", 600, -20);
  text("GDP", -36, -60);

//Horizontal axis and scale  
   textSize(19);

   line(100, 0,100,20);
   text("10",90, 42);
      
   line(200, 0,200, 20); 
   text("20",190, 42);   
   
   line(300,0,300, 20);  
   text("30", 290, 42);  
   
   line(400,0,400,20);  
   text("40", 390, 42); 
   
   line(500,0,500,20);  
   text("50", 490, 42); 
  
   line(600,0,600,20);  
   text("60", 590, 42);

   line(700,0,700,20);  
   text("70", 690, 42);
   
   line(800,0,800,20);  
   text("80", 790, 42);
   

//Vertical axis and scale   
  stroke(0,255,0);
  line(0,0,0,0,1000,0);
  
  fill(0);
  textSize(32);
 // rotate(PI/2.0);
  text("Fertility",25,height);
  
  fill(0, 102, 153);
  text("YEAR=", 750,height);
  text(int(count), 850,height);
  fill(0);
 
  textSize(19);
  line(-20,100,10,100);
  text("1",-30,100);
  
  line(-20,200,10,200);
  text("2",-30,200);
  
  line(-20,300,10,300);
  text("3",-30,300);

  line(-20,400,10,400);
  text("4",-30,400);  

  line(-20,500,10,500);
  text("5",-30,500);
  
  line(-20,600,10,600);
  text("6",-30,600);
  
  line(-20,700,10,700);
  text("7",-30,700);

  line(-20,800,10,800);
  text("8",-30,800);  
  
  stroke(0,0,255);
  line(0,0,0,0,0,500);
  noStroke();
  fill(150,0,0);
    
  

    for (TableRow row : myTable.rows()) {
    year = int(row.getString("year"));
    if (year==count){
      country = row.getString("country");
      le = 10*row.getFloat("Life Expectancy");
      fert = 100*row.getFloat("Fertility");
      pop= row.getFloat("Total population")/10000000;
      gdp= row.getFloat("GDP")/1000000000;
      gdp=gdp/100;
      if (pop<5){ pop=5;}
 //     println(year + " year", country + " country", le + " le", fert + " fert");
      
      fill(le, fert,year/10);
      ellipse(le+30,fert,pop,pop);
      cy.drawMyCylinder(pop,pop,gdp,200,le,fert);
      
      //drawMyCylinder(float bottom, float top, float h, int sides, float xp, float yp)
      if(pop>10){
        fill(0);
        textSize(16);
        text(country,le+30,fert, gdp);
        text(pop*10,le+130,fert,gdp);
      }
      

    }
   
 
    
  }
  
}  






void keyPressed() {
  switch(key) {
  case 'c':
    count=count+1;
    if (count>2015) {count=2015;}
    break;
  case 'v':
    count=count-1;
     if (count<1960) {count=1960;}
    break;

  }
}