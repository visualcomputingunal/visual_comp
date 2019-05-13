PGraphics pg, PgSchroder, PgWorm;
long wait = 100, lastTime;
float slx, sly;
color c1, c2, cs1, cs2;

void setup(){
  size(1280, 600);
  background(200);
  
  pg = createGraphics(650, 400);
  PgSchroder = createGraphics(680, 390);
  PgWorm = createGraphics(600, 500);
  
  c1 = color(250,200,200);
  c2 = color(0,50,0);
  cs1 = c1;
  cs2 = c2;
  slx = 625; sly = 455;
}

void draw() {
  init();
  //Schroder();
  //image(PgSchroder, 10, 10);
  
  //ImpossibleStair();
  //image(pg, 9, 30);
  
  Worm();
  slide();
  image(PgWorm, 10, 10);
}

void init(){
  background(200);
  if(millis()-lastTime > wait){
    color aux = cs1;
    cs1 = cs2;
    cs2 = aux;
    lastTime = millis();
  }
}

void mouseDragged() {
  if(mouseX < 625) slx = 625; if(mouseX > 825) slx = 825;
  if(mouseX < slx+10 && mouseX > slx-10 && mouseY < sly+15 && mouseY > sly-15
      || mouseX < 825 && mouseX > 625 && mouseY < 480 && mouseY > 430){
    slx = mouseX;
    if(mouseX >= 625 && mouseX <= 725){
      int aux = 2*(mouseX - 625);
      c1 = color(250,200-aux, 200-aux);
      c2 = color(0,50+aux,0);
      cs1 = c1; cs2 = c2;
    }if(mouseX > 725 && mouseX <= 825){
      int aux = 2*(825 - mouseX);
      c1 = color(50+aux,0,0);
      c2 = color(250-aux,255,250-aux);
      cs1 = c1; cs2 = c2;
    }
  }
}

void mousePressed(){
  if(mouseX < 825 && mouseX > 625 && mouseY < 460 && mouseY > 450){
    slx = mouseX;
    if(mouseX >= 625 && mouseX <= 725){
      int aux = 2*(mouseX - 625);
      c1 = color(250,200-aux, 200-aux);
      c2 = color(0,50+aux,0);
      cs1 = c1; cs2 = c2;
    }
  }
}
