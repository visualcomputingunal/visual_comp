void Schroder(){
  int xpos, ypos;
  PgSchroder.beginDraw();
    PgSchroder.background(255);
    stroke(0);
    
    // Side A
    PgSchroder.fill(200);
    PgSchroder.beginShape();
      PgSchroder.vertex(50,20);
      xpos = 450; ypos = 20;
      for(int step = 0; step<11; step++){
        PgSchroder.vertex(xpos, ypos);
        if(step%2 == 0)ypos += 50;
        else xpos -= 80;
      }
    PgSchroder.endShape(CLOSE);
    
    // Steps
    PgSchroder.fill(255);
    PgSchroder.beginShape(QUAD_STRIP);
      xpos = 50; ypos = 270;
      for(int step = 0; step<12; step++){
        PgSchroder.vertex(xpos, ypos);
        PgSchroder.vertex(xpos+100, ypos+100);
        if(step%2 == 0)xpos += 80;
        else ypos -= 50;
      }
    PgSchroder.endShape();
    
    // Side B
    PgSchroder.fill(200);
    PgSchroder.beginShape();
      xpos = 230; ypos = 370;
      for(int step = 0; step<11; step++){
        PgSchroder.vertex(xpos, ypos);
        if(step%2 == 0)ypos -= 50;
        else xpos += 80;
      }PgSchroder.vertex(630, 370);
    PgSchroder.endShape(CLOSE);
  PgSchroder.endDraw();
}
