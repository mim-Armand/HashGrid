HashGrid test;
float scaleFactor = 1;
void setup(){
  size(500, 500);
  test = new HashGrid(50, width, height, 30);

  test.drawGrid();
  for(int i = 0; i < pointsNumber; i++){
    pointsArray[i] = new Points();
    test.set(pointsArray[i]);
    for(int h =0; h < test.get(pointsArray[i].location).length - 1; h++){
      float x1_ = test.get(pointsArray[i].location)[h].location.x;
      float y1_ = test.get(pointsArray[i].location)[h].location.y;
      float x2_ = test.get(pointsArray[i].location)[h+1].location.x;
      float y2_ = test.get(pointsArray[i].location)[h+1].location.y;
      line(x1_, y1_ ,x2_ ,y2_ );
    }
  }
PVector testPos = new PVector (180, 180);
fill(255,0,0);
rect(testPos.x, testPos.y , 6, 6);
  println(test.get(testPos).length);
}

void draw(){
}
