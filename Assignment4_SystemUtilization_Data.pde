//
// Assignemnt 4
// Harry Bhasin and Misael Santana
//

Table myTable;

class item {
  int year;
  int usage;

  item() {
    year = 0;
    usage = 0;
  }
  void update(int year, int usage) {
//    println(year + " put item usage " + usage);
    this.year = year;
    this.usage = usage;
  }
}
//ArrayList <Bucket> bucket1 = new ArrayList <Bucket>();
ArrayList <item> bucket1 = new ArrayList <item>();
ArrayList <item> bucket2 = new ArrayList <item>();
ArrayList <item> bucket3 = new ArrayList <item>();
ArrayList <item> bucket4 = new ArrayList <item>();
ArrayList <item> bucket5 = new ArrayList <item>();
ArrayList <item> bucket6 = new ArrayList <item>();
ArrayList <item> bucket7 = new ArrayList <item>();

// read the csv table
// format the date into yearly
// create yearly buckets starting from 1985 to current
// at an interval of 5 years
// check the date of the record and add the
// corresponding item to appropriate yearly bucket
//

void setup() {
  size(500, 500);
  loadDataset();
  
  
  noLoop();
}

void draw() {
  int i;
  int bktUsage = 0;
  float start = width/7;
  

  
  
  
  background(255);
  bktUsage = updateBucket(bucket1);
  // println("Bucket1 total usage " + bktUsage);
  fill(random(50, 255), random(50, 255), random(50, 255));
  rect(1*30+110,height-bktUsage/1000.0-30,30,bktUsage/1000.0);
  
  bktUsage = updateBucket(bucket2);
  // println("Bucket2 total usage " + bktUsage);
  fill(random(50, 255), random(50, 255), random(50, 255));
  rect(2*30+120,height-bktUsage/1000.0-30,30,bktUsage/1000.0);
  
  bktUsage = updateBucket(bucket3);
  // println("Bucket3 total usage " + bktUsage);
  fill(random(50, 255), random(50, 255), random(50, 255));
  rect(3*30+130,height-bktUsage/1000.0-30,30,bktUsage/1000.0);

  bktUsage = updateBucket(bucket4);
  // println("Bucket4 total usage " + bktUsage);
  fill(random(50, 255), random(50, 255), random(50, 255));
  rect(4*30+140,height-bktUsage/1000.0-30,30,bktUsage/1000.0);

  bktUsage = updateBucket(bucket5);
  // println("Bucket5 total usage " + bktUsage);
  fill(random(50, 255), random(50, 255), random(50, 255));
  rect(5*30+150,height-(bktUsage)/10000.0-30,30,bktUsage/10000.0);

  bktUsage = updateBucket(bucket6);
  // println("Bucket6 total usage " + bktUsage);
  fill(random(50, 255), random(50, 255), random(50, 255)); 
  rect(6*30+160,height-bktUsage/10000.0-30,30,bktUsage/10000.0);

  int xLabel = 155;
  fill(0);
  textSize(12);
  textAlign(CENTER);
  for(i = 1990; i < 2020; i += 5) {
    text(i, xLabel, 490);
    xLabel += 40;
  }

  textSize(18);
  textAlign(CENTER);
  text("Storage System Utilization Yearly", width/2, 20);

}


void loadDataset() {
  int year = 0;
  int usage = 0;
  String qdate = "";

  myTable = loadTable("partSales.csv", "header");

  // println(myTable.getRowCount() + " total rows in the dataset");

  for (TableRow row : myTable.rows()) {
    qdate = row.getString("quote_date");
//    println(qdate + " date");
//    println((qdate.length() - 4) + " len");
    year = int(qdate.substring((qdate.length() - 4)));
    usage = int(row.getInt("annual_usage"));
//    println(year + " year");

    if (year >= 1985 && year < 1990) {
//      println(year + " bucket 1");
      item it = new item();
      it.update(year, usage);
      bucket1.add(it);
    } else if (year >= 1990 && year < 1995) {
//      println(year + " bucket 2");
      item it = new item();
      it.update(year, usage);
      bucket2.add(it);
    } else if (year >= 1995 && year < 2000) {
//      println(year + " bucket 3");
      item it = new item();
      it.update(year, usage);
      bucket3.add(it);
    } else if (year >= 2000 && year < 2005) {
//      println(year + " bucket 4");
      item it = new item();
      it.update(year, usage);
      bucket4.add(it);
    } else if (year >= 2005 && year < 2010) {
//      println(year + " bucket 5");
      item it = new item();
      it.update(year, usage);
      bucket5.add(it);
    } else if (year >= 2010 && year < 2015) {
//      println(year + " bucket 6");
      item it = new item();
      it.update(year, usage);
      bucket6.add(it);
    } else if (year >= 2015 && year < 2020) {
//      println(year + " bucket 7 usage " + usage);
      item it = new item();
      it.update(year, usage);
      bucket7.add(it);
    }
  }
}

int updateBucket(ArrayList <item> bucket) {
  int totalUsage = 0;

  for (item bkt : bucket) {
    totalUsage += bkt.usage;
  }
  return (totalUsage);
}