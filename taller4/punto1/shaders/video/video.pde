import processing.video.*;

Movie myMovie;
PImage img;
PGraphics Menu;
PShape textureImg;
PShader textureShader;
int conv_option = 10;

void setup() {
  size(1300, 540, P2D);
  Menu = createGraphics(142, 540);
  myMovie = new Movie(this, "video.mp4");
  myMovie.play();
  textureImg = createShape(myMovie, 1152, 540);
  textureShader = loadShader("original.glsl");
}

void draw() {
  background(200);
  menu();
  image(Menu,1152,0);
  shader(textureShader);
  shape(textureImg);
}

PShape createShape(Movie tex,int x, int y) {
  myMovie.loop();
  textureMode(NORMAL);
  PShape shape = createShape();
  shape.beginShape();
  shape.noStroke();
  textureMode(NORMAL);
  shape.texture(tex);
  shape.vertex(0, 0, 0, 0);
  shape.vertex(x, 0, 1, 0);
  shape.vertex(x, y, 1, 1);
  shape.vertex(0, y, 0, 1);
  shape.endShape();
  return shape;
}

void movieEvent(Movie m) { 
  m.read();
}

void menu(){
  Menu.beginDraw();
    Menu.background(200);
    Menu.fill(50,100,255);
    Menu.rect(10, 35, 120, 30);
    Menu.fill(0);
    Menu.text("Gaussian Blur", 25, 55);
    
    if(conv_option == 0){
      Menu.fill(0);
      Menu.rect(10, 35, 120, 30);
      Menu.fill(255);
      Menu.text("Gaussian Blur", 25, 55);
    }
  Menu.endDraw();
}

void mouseClicked(){
  if(mouseX > 1162 && mouseX < 1282 && mouseY > 35 && mouseY < 65) {
    conv_option = 0;
  }
  keyPressed();
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == UP) conv_option -= 1;
    else if (keyCode == DOWN) conv_option += 1;
    
    if(conv_option > 10)conv_option = 0;
    else if(conv_option < 0)conv_option = 10;
  }
  if(key=='0' || key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6'
       || key=='7' || key=='8' || key=='9') conv_option = int(key);
       
  else if( key == 'o' || key == 'O') conv_option = 10;
  
  if(conv_option == 0) {
    textureShader = loadShader("gaussianblur.glsl");
  }else if(conv_option == 1){ //Edge detection 1
    textureShader = loadShader("edge1.glsl");
  }else if(conv_option == 2){ //Edge detection 2
    textureShader = loadShader("edge2.glsl");
  }else if(conv_option == 3){ //Edge detection 3
    textureShader = loadShader("edge3.glsl");
  }else if(conv_option == 4){ 
    textureShader = loadShader("boxblur.glsl");
  }else if(conv_option == 5){ 
    textureShader = loadShader("sharpen1.glsl");
  }else if(conv_option == 6){ 
    textureShader = loadShader("sharpen2.glsl");
  }else if(conv_option == 7){ 
    textureShader = loadShader("motionblur.glsl");
  }else if(conv_option == 8){ 
    textureShader = loadShader("emboss1.glsl");
  }else if(conv_option == 9){ 
    textureShader = loadShader("emboss2.glsl");
  }else if(conv_option == 10){ //Normal
    textureShader = loadShader("original.glsl");
  }else{
    
  }
}
