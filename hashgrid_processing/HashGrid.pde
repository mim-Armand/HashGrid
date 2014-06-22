public class HashGrid {
  float bucketSize;
  int gridWidth, gridHeight, bucketLength, numberOfRows, numberOfCols;
  Buckets[] buckets;

  HashGrid(float bucketSize_, int gridWidth_, int gridHeight_, int bucketLength_) {
    bucketSize = bucketSize_;
    gridWidth = gridWidth_;
    gridHeight = gridHeight_;
    bucketLength = bucketLength_; //    bucketLength = ceil(10 * (numOfElements / ((gridWidth * gridHeight)/ bucketSize)));
    if (numberOfRows == 0) numberOfRows = ceil(gridWidth/bucketSize);
    if (numberOfCols == 0) numberOfCols = ceil(gridHeight/bucketSize);
    buckets = new Buckets[numberOfRows * numberOfCols];
    for (int i = 0; i < buckets.length; i++) {
      buckets[i]=new Buckets();
    }
  }
  void set(Points point_) { //TODO: it is better probably to use an interface instead of hardcoding it but for now! ...
    int x_ = floor(point_.location.x/bucketSize);
    int y_ = floor(point_.location.y/bucketSize);
    int arrayPosition_ = x_ + (y_ * numberOfRows);//    println(arrayPosition_ + " ---> " +buckets[arrayPosition_].arrayPointer);
    buckets[arrayPosition_].bucket[(buckets[arrayPosition_].arrayPointer)] = point_;
    strokeWeight(.6);
    fill(255);
    rect(2 + (buckets[arrayPosition_].arrayPointer * 4) + bucketSize * x_, 2 + bucketSize * y_, 4, 4);
    buckets[arrayPosition_].arrayPointer++;
  }
  Points[] get(PVector location_) {
    int posInArray_ = floor(location_.x / bucketSize) + (floor(location_.y / bucketSize) * numberOfRows);
    int answerLength = buckets[posInArray_].arrayPointer;
    Points[] answer = new Points[answerLength];
    for(int i = 0; i < answerLength; i++){
      answer[i] = buckets[posInArray_].bucket[i];
    }
    
//    println(answer);
    return answer;
  }
  void drawGrid() {
    for (float i = 0; i < gridWidth; i += bucketSize) {
      for ( float h = 0; h < gridHeight; h +=bucketSize) {
        fill(i, h, 0, 66);
        strokeWeight(.1);
        rect(i, h, bucketSize, bucketSize);
      }
    }
  }
  public class Buckets {
    Points [] bucket = new Points[bucketLength];//TODO: use an interface instead!
    int arrayPointer;
  }
}

