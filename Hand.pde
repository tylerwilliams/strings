class Hand {
  float threshold = 2.0;
  float rSpdAvg = 0.4;
  float rSpd = 0.4;
  
  PVector location = new PVector(0,0);
  PVector prevLocation = new PVector(0,0);
  int stillCount = 0;
  // timer variables
  float t0 = millis();
  float t1 = t0;
  boolean isDead = false;
  
  void updateLocation(int x, int y){
    prevLocation.x = location.x;
    prevLocation.y = location.y;
    
    // how much time has elapsed since last update?
    float elap = (t1-t0)/1000;
    // change in position
//    float dx = xp1-xp0; 
//    float dy = yp1-yp0;
    // distance traveled
    float dist = dist(x, y, prevLocation.x, prevLocation.y);
    // current speed - pixels per second
    spd = dist/elap;
    // normalize it from 0 to 1
    rSpd = lim((spd-spdMin)/(spdMax-spdMin), 0, 1);
    // get average speed as ratio
    rSpdAvg = (rSpdAvg*(fAvg-1)/fAvg) + (rSpd*(1/fAvg));

    location.x = x;
    location.y = y;
    
    if (isStationary()){
      stillCount += 1;
    } else {
      stillCount = 0;
    }
  };
  
  boolean isStationary(){
    float d = dist(prevLocation.x, prevLocation.y, location.x, location.y);
    return (d < threshold);
  }
  
  boolean atOrigin(){
    return (location.x == 0 && location.y == 0);
  }
  
//  void updPos() {
//  // set hand pos

//  // store previous position
//  xp0 = xp1; yp0 = yp1;
//  }
}
