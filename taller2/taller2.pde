PGraphics pg;
void setup(){
  size(1280, 600);
  pg = createGraphics(650, 400);
}

void draw() {
  pg.beginDraw();
  pg.background(220);
  pg.stroke(0);
 
  pg.fill(220);
  pg.beginShape();
  pg.vertex(0, 190);
  pg.vertex(325, 0);
  pg.vertex(650, 190);
  pg.vertex(325, 380);
  pg.endShape(CLOSE);
  
  pg.fill(100);
  pg.beginShape();
  pg.vertex(0, 190);
  pg.vertex(0, 210);
  pg.vertex(325, 400);
  pg.vertex(325, 380);
  pg.endShape(CLOSE);
  
  pg.fill(160);
  pg.beginShape();
  pg.vertex(325, 380);
  pg.vertex(325, 400);
  pg.vertex(650, 210);
  pg.vertex(650, 190);
  pg.endShape(CLOSE);
  
  pg.fill(220);
  pg.beginShape();
  pg.vertex(30, 190);
  pg.vertex(325, 20);
  pg.vertex(620, 190);
  pg.vertex(325, 360);
  pg.endShape(CLOSE);
  
  //Perfil Superior Claro
  pg.fill(160);
  pg.beginShape();
  pg.vertex(30, 190);
  pg.vertex(325, 20);
  pg.vertex(325, 43);
  pg.vertex(51, 202);
  pg.endShape(CLOSE);
  
  //Perfil Superior oscuro
  pg.fill(100);
  pg.beginShape();
  pg.vertex(325, 20);
  pg.vertex(325, 43);
  pg.vertex(599, 202);
  pg.vertex(620, 190);
  pg.endShape(CLOSE);
  
  //Escalones blancos izquierda
  pg.fill(220);  

  pg.quad(240, 92, 220, 81, 200, 92, 220, 103);
  pg.quad(260, 125, 240, 114, 220, 125, 240, 136);
  pg.quad(280, 158, 260, 147, 240, 158, 260, 169);
  pg.quad(300, 191, 280, 180, 260, 191, 280, 202);
  pg.quad(320, 224, 300, 213, 280, 224, 300, 235);
  pg.quad(340, 257, 320, 246, 300, 257, 320, 268);
  
  //Escalones oscuros izquierda
  pg.fill(160);
  pg.beginShape();
  pg.vertex(240, 92);
  pg.vertex(240, 114);
  pg.vertex(220, 125);
  pg.vertex(220, 103);
  pg.endShape(CLOSE);
  
  pg.fill(160);
  pg.beginShape();
  pg.vertex(260, 125);
  pg.vertex(260, 147);
  pg.vertex(240, 158);
  pg.vertex(240, 136);
  pg.endShape(CLOSE);
  
  pg.fill(160);
  pg.beginShape();
  pg.vertex(280, 158);
  pg.vertex(280, 180);
  pg.vertex(260, 191);
  pg.vertex(260, 169);
  pg.endShape(CLOSE);
  
  pg.fill(160);
  pg.beginShape();
  pg.vertex(300, 191);
  pg.vertex(300, 213);
  pg.vertex(280, 224);
  pg.vertex(280, 202);
  pg.endShape(CLOSE);
  
  pg.fill(160);
  pg.beginShape();
  pg.vertex(320, 224);
  pg.vertex(320, 246);
  pg.vertex(300, 257);
  pg.vertex(300, 235);
  pg.endShape(CLOSE);
  
  //Perfil escalera izquierda
  pg.fill(100);
  pg.beginShape();
  pg.vertex(200, 92);
  pg.vertex(200, 136);
  pg.vertex(220, 147);
  pg.vertex(220, 169);
  pg.vertex(240, 180);
  pg.vertex(240, 202);
  pg.vertex(260, 213);
  pg.vertex(260, 235);
  pg.vertex(280, 246);
  pg.vertex(280, 268);
  pg.vertex(386, 325);
  pg.vertex(405, 314);
  pg.vertex(300, 257);
  pg.vertex(300, 235);
  pg.vertex(280, 224);
  pg.vertex(280, 202);
  pg.vertex(260, 191);
  pg.vertex(260, 169);
  pg.vertex(240, 158);
  pg.vertex(240, 136);
  pg.vertex(220, 125);
  pg.vertex(220, 103);
  pg.vertex(200, 92);
  pg.endShape();
  
  
  //Escalones blancos derecha
  pg.fill(220);
  pg.quad(480, 158, 460, 147, 440, 158, 460, 169);
  pg.quad(502, 122, 480, 109, 460, 122, 480, 133);
  
  //Escalones oscuros derecha
  pg.fill(100);
  pg.beginShape();
  pg.vertex(480, 133);
  pg.vertex(480, 158);
  pg.vertex(460, 147);
  pg.vertex(460, 122);
  pg.endShape(CLOSE);
  
  
  pg.fill(100);
  pg.beginShape();
  pg.vertex(460, 169);
  pg.vertex(460, 191);
  pg.vertex(440, 180);
  pg.vertex(440, 158);
  pg.endShape(CLOSE);
  
  //perfil escalera derecha
  pg.fill(160);
  pg.beginShape();
  pg.vertex(502, 122);
  pg.vertex(502, 188);
  pg.vertex(360, 268);
  pg.vertex(340, 257);
  pg.vertex(460, 191);
  pg.vertex(460, 169);
  pg.vertex(480, 158);
  pg.vertex(480, 133);
  pg.endShape();
  
  //Plano en l
  pg.fill(220);
  pg.beginShape();
  pg.vertex(460, 191);
  pg.vertex(440, 180);
  pg.vertex(320, 246);
  pg.vertex(300, 257);
  pg.vertex(405, 314);
  pg.vertex(424, 303.5);
  pg.vertex(340, 257);
  pg.endShape();
 
  pg.endDraw();
  image(pg, 9, 30); 
  
}
