void Worm (){
  float cx, cy, c2x, c2y;
  PgWorm.beginDraw();
    PgWorm.background(255);
    
    // Worm
    PgWorm.stroke(0);
    PgWorm.strokeWeight(4);
    PgWorm.fill(cs1);
    
    PgWorm.beginShape();
      PgWorm.curveVertex(100 + 80*cos(radians(100)), 150 - 80*sin(radians(100)));
      cx = 100; cy = 150;
      for(int angle=100; angle>=-40; angle-=10){
        PgWorm.curveVertex(cx + 80*cos(radians(angle)), cy - 80*sin(radians(angle)));
      }
      c2x = cx + cos(radians(30))*(150+80);
      c2y = cy + sin(radians(30))*(150+80);
      for(int angle=170; angle<=400; angle+=10){
        PgWorm.curveVertex(c2x + 150*cos(radians(angle)), c2y - 150*sin(radians(angle)));
      }PgWorm.curveVertex(350, 20);
      for(int angle=400; angle>=160; angle-=10){
        PgWorm.curveVertex(c2x + 200*cos(radians(angle)), c2y - 200*sin(radians(angle)));
      }
      cx = 100; cy = 150;
      for(int angle=-40; angle<=110; angle+=10){
        PgWorm.curveVertex(cx + 30*cos(radians(angle)), cy - 30*sin(radians(angle)));
      }
      PgWorm.curveVertex(40, 110);
      PgWorm.curveVertex(40, 90);
      PgWorm.curveVertex(100 + 80*cos(radians(100)), 150 - 80*sin(radians(100)));
      PgWorm.curveVertex(100 + 80*cos(radians(100)), 150 - 80*sin(radians(100)));
    PgWorm.endShape();
    
    // Segmentation
    PgWorm.strokeWeight(1);
    PgWorm.fill(cs2);
    
    PgWorm.beginShape(QUAD_STRIP);
      PgWorm.vertex(70, 77);
      PgWorm.vertex(77, 117);
      PgWorm.vertex(47, 86);
      PgWorm.vertex(53, 115);
    PgWorm.endShape();
    for(int angle = 100; angle >= -40; angle-=30){
      PgWorm.beginShape(QUAD_STRIP);
        PgWorm.vertex(cx + 80*cos(radians(angle)), cy - 80*sin(radians(angle)));
        PgWorm.vertex(cx + 30*cos(radians(angle)), cy - 30*sin(radians(angle)));
        PgWorm.vertex(cx + 80*cos(radians(angle-15)), cy - 80*sin(radians(angle-15)));
        PgWorm.vertex(cx + 30*cos(radians(angle-15)), cy - 30*sin(radians(angle-15)));
      PgWorm.endShape();
    }
    for(int angle=400; angle>=160; angle-=10){
      PgWorm.beginShape(QUAD_STRIP);
        PgWorm.vertex(c2x + 200*cos(radians(angle)), c2y - 200*sin(radians(angle)));
        PgWorm.vertex(c2x + 150*cos(radians(angle)), c2y - 150*sin(radians(angle)));
        PgWorm.vertex(c2x + 200*cos(radians(angle-5)), c2y - 200*sin(radians(angle-5)));
        PgWorm.vertex(c2x + 150*cos(radians(angle-5)), c2y - 150*sin(radians(angle-5)));
      PgWorm.endShape();
    }
    int x1=439; int y1=120; int x2=406; int y2=150;
    for(int i = 0; i<4; i++){
      PgWorm.beginShape(QUAD_STRIP);
        PgWorm.vertex(x1,y1);
        PgWorm.vertex(x2,y2);
        PgWorm.vertex(x1-9,y1-11);
        PgWorm.vertex(x2-7,y2-15);
      PgWorm.endShape();
      x1 -= 18; y1 -= 22;
      x2 -= 14; y2 -= 30;
    }
    
  PgWorm.endDraw();
}

void slide(){
  stroke(1);
  fill(255);
  rect(620, 450, 210, 10);
  fill(c1);
  rect(620, 430, 210, 20);
  fill(c2);
  rect(620, 460, 210, 20);
  
  fill(100);
  stroke(0);
  beginShape(TRIANGLE_FAN);
  vertex(slx, sly);
  vertex(slx, sly-15); 
  vertex(slx+10, sly); 
  vertex(slx, sly+15); 
  vertex(slx-10, sly); 
  vertex(slx, sly-15); 
  endShape();
}
