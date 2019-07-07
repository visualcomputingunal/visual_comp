import processing.video.*;

Movie myMovie;
PGraphics Labels;
PShape textureImg;
PShader textureShader;
int conv_option = 10;

void setup() {
  size(1152, 600, P2D);
  Labels = createGraphics(1152, 60);
  myMovie = new Movie(this, "video.mp4");
  myMovie.play();
  textureImg = createShape(myMovie, 1152, 540);
  textureShader = loadShader("original.glsl");
}

void draw() {
  shader(textureShader);
  shape(textureImg);
  println(frameRate);
  labels();
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

void labels(){
  Labels.beginDraw();
    Labels.background(0);
    Labels.fill(0);
    Labels.rect(0, 0, 1152, 60);
    Labels.fill(255);
    Labels.textSize(30);
    
    if(conv_option == 0)
      Labels.text("Gaussian Blur (3x3)", 25, 40);
    else if(conv_option == 1)
      Labels.text("Box Blur (3x3)", 25, 40);
    else if(conv_option == 2)
      Labels.text("Motion Blur (9x9)", 25, 40);
    else if(conv_option == 3)
      Labels.text("Edge Detection 1 (3x3)", 25, 40);
    else if(conv_option == 4)
      Labels.text("Edge Detection 2 (3x3)", 25, 40);
    else if(conv_option == 5)
      Labels.text("Edge Detection 3 (3x3)", 25, 40);
    else if(conv_option == 6)
      Labels.text("Sharpen 1 (3x3)", 25, 40);
    else if(conv_option == 7)
      Labels.text("Sharpen 2 (3x3)", 25, 40);
    else if(conv_option == 8)
      Labels.text("Emboss 1 (3x3)", 25, 40);
    else if(conv_option == 9)
      Labels.text("Emboss 2 (5x5)", 25, 40);
    else
      Labels.text("Original", 25, 40);
  Labels.endDraw();
  image(Labels,0,540);
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == RIGHT) conv_option += 1;
    else if (keyCode == LEFT) conv_option -= 1;
    
    if(conv_option > 10)conv_option = 0;
    else if(conv_option < 0)conv_option = 10;
  }
  
  if(key=='0' || conv_option == 0) {
    conv_option = 0;
    textureShader = loadShader("gaussianblur.glsl");
  }if(key=='1' || conv_option == 1){ 
    conv_option = 1;
    textureShader = loadShader("boxblur.glsl");
  }if(key=='2' || conv_option == 2){ 
    conv_option = 2;
    textureShader = loadShader("motionblur.glsl");
  }if(key=='3' || conv_option == 3){
    conv_option = 3;
    textureShader = loadShader("edge1.glsl");
  }if(key=='4' || conv_option == 4){
    conv_option = 4;
    textureShader = loadShader("edge2.glsl");
  }if(key=='5' || conv_option == 5){
    conv_option = 5;
    textureShader = loadShader("edge3.glsl");
  }if(key=='6' || conv_option == 6){ 
    conv_option = 6;
    textureShader = loadShader("sharpen1.glsl");
  }if(key=='7' || conv_option == 7){ 
    conv_option = 7;
    textureShader = loadShader("sharpen2.glsl");
  }if(key=='8' || conv_option == 8){ 
    conv_option = 8;
    textureShader = loadShader("emboss1.glsl");
  }if(key=='9' || conv_option == 9){ 
    conv_option = 9;
    textureShader = loadShader("emboss2.glsl");
  }if(key=='r' || key=='R' ||  conv_option == 10){
    conv_option = 10;
    textureShader = loadShader("original.glsl");
  }
}
