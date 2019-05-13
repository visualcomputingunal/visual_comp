PGraphics pg, PgSchroder, PgWorm, PgCircles, PGBul;
int mode = 0;
long wait = 100, lastTime;
float slx, sly;
color c1, c2, cs1, cs2;

void setup(){
  size(1280, 600);
  background(200);
  
  pg = createGraphics(650, 400);
  PgSchroder = createGraphics(680, 390);
  PGBul = createGraphics(420, 420);
  PgWorm = createGraphics(600, 500);
  PgCircles = createGraphics(580, 580);
  
  c1 = color(250,200,200);
  c2 = color(0,50,0);
  cs1 = c1;
  cs2 = c2;
  slx = 625; sly = 455;
}

void draw() {
  init();
  navbar();
  
  if(mode == 1){
    Schroder();
    image(PgSchroder, 100, 100);
  }else if(mode == 2){
    ImpossibleStair();
    image(pg, 100, 100);
  }else if(mode == 3){
    Worm();
    slide();
    image(PgWorm, 10, 80);
  }else if(mode == 4){
    Bulging();
  }  
  //IrregularCircles();
  //image(PgCircles,10,10);
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

void mouseReleased() {
  background(200);
  if(mouseX > 150 && mouseX < 280 && mouseY > 35 && mouseY < 65) {
    mode = 1;
  }else if(mouseX > 305 && mouseX < 425 && mouseY > 35 && mouseY < 65) {
    mode = 2;
  }else if(mouseX > 450 && mouseX < 550 && mouseY > 35 && mouseY < 65) {
    mode = 3;
  }else if(mouseX > 575 && mouseX < 735 && mouseY > 35 && mouseY < 65) {
    mode = 4;
  }
}

void navbar(){
  fill(50,100,255);
  rect(150, 35, 130, 30);
  rect(305, 35, 120, 30);
  rect(450, 35, 100, 30);
  rect(575, 35, 160, 30);
  fill(0);
  text("Schroder Staircase", 160, 55);
  text("Impossible Stairs", 315, 55);
  text("Worm Ilusion", 460, 55);
  text("Bulging Checker Board", 585, 55);
  
  if(mode == 1){
    fill(0);
    rect(150, 35, 130, 30);
    fill(255);
    text("Schroder Staircase", 160, 55);
  }if(mode == 2){
    fill(0);
    rect(305, 35, 120, 30);
    fill(255);
    text("Impossible Stairs", 315, 55);
  }if(mode == 3){
    fill(0);
    rect(450, 35, 100, 30);
    fill(255);
    text("Worm Ilusion", 460, 55);
  }if(mode == 4){
    fill(0);
    rect(575, 35, 160, 30);
    fill(255);
    text("Bulging Checker Board", 585, 55);
  }if(mode == 0){
    
  }
  noFill();
}
