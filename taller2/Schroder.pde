void Schroder(){
  PGSchroder.beginDraw();
    PGSchroder.background(255);
    stroke(0);
    
    // Side A
    PGSchroder.fill(200);
    PGSchroder.beginShape();
      PGSchroder.vertex(50,20);
      PGSchroder.vertex(450,20);
      PGSchroder.vertex(450, 70);
      PGSchroder.vertex(370, 70);
      PGSchroder.vertex(370, 120);
      PGSchroder.vertex(290, 120);
      PGSchroder.vertex(290, 170);
      PGSchroder.vertex(210, 170);
      PGSchroder.vertex(210, 220);
      PGSchroder.vertex(130, 220);
      PGSchroder.vertex(130, 270);
      PGSchroder.vertex(50, 270);
    PGSchroder.endShape(CLOSE);
    
    // Steps
    PGSchroder.fill(255);
    PGSchroder.beginShape(QUAD_STRIP);
      PGSchroder.vertex(50, 270);
      PGSchroder.vertex(150, 370);
      PGSchroder.vertex(130, 270);
      PGSchroder.vertex(230, 370);
      PGSchroder.vertex(130, 220);
      PGSchroder.vertex(230, 320);
      PGSchroder.vertex(210, 220);
      PGSchroder.vertex(310, 320);
      PGSchroder.vertex(210, 170);
      PGSchroder.vertex(310, 270);
      PGSchroder.vertex(290, 170);
      PGSchroder.vertex(390, 270);
      PGSchroder.vertex(290, 120);
      PGSchroder.vertex(390, 220);
      PGSchroder.vertex(370, 120);
      PGSchroder.vertex(470, 220);
      PGSchroder.vertex(370, 70);
      PGSchroder.vertex(470, 170);
      PGSchroder.vertex(450, 70);
      PGSchroder.vertex(550, 170);
      PGSchroder.vertex(450, 20);
      PGSchroder.vertex(550, 120);
      PGSchroder.vertex(530, 20);
      PGSchroder.vertex(630, 120);
    PGSchroder.endShape();
    
    // Side B
    PGSchroder.fill(200);
    PGSchroder.beginShape();
      PGSchroder.vertex(230, 370);
      PGSchroder.vertex(230, 320);
      PGSchroder.vertex(310, 320);
      PGSchroder.vertex(310, 270);
      PGSchroder.vertex(390, 270);
      PGSchroder.vertex(390, 220);
      PGSchroder.vertex(470, 220);
      PGSchroder.vertex(470, 170);
      PGSchroder.vertex(550, 170);
      PGSchroder.vertex(550, 120);
      PGSchroder.vertex(630, 120);
      PGSchroder.vertex(630, 370);
    PGSchroder.endShape(CLOSE);
  PGSchroder.endDraw();
}
