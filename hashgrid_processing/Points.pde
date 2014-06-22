int pointsNumber = 300;
Points[] pointsArray = new Points[pointsNumber];

class Points {
  PVector location;
  float circleSize;
  float gravity;
  float lineWeight;
  color strokeColor;
  int docHeight = height;
  int docWidth = width;
  float circleSizeMin = 3;
  float circleSizeMax = 15;
  int minDistance = 33;
  int maxDistance = 72;
  float lineWeightMin = 1;
  float lineWeightMax = 3;
  Points() {
    //    location = new PVector (random(-100, width+ 100), random(-100, height+100));
    //    circleSize = random( 3, 15);
    this.update();
  }
  PVector getLocation(){
    return this.location;
  }
  void update() {
    location = new PVector (scaleFactor * random(0, docWidth), scaleFactor * random(0, docHeight));
    circleSize = random( scaleFactor * circleSizeMin, scaleFactor * circleSizeMax);
    gravity = scaleFactor * random(minDistance, maxDistance);
    lineWeight = random(scaleFactor *lineWeightMin, scaleFactor *lineWeightMax);
    strokeColor = color((lineWeight*66)/scaleFactor);
//    stroke(strokeColor);
    strokeWeight(lineWeight/2);
    noFill();
    ellipse(location.x, location.y, circleSize,circleSize);
  }
  void update(PVector location_, float circleSize_, float gravity_, float lineWeight_, color strokeColor_) {
    location = location_;
    circleSize = scaleFactor * circleSize_;
    gravity = scaleFactor * gravity_;
    lineWeight = scaleFactor * lineWeight_;
    strokeColor = strokeColor_;
  }
}
