PImage img;
PShape textureImg;
PShader textureShader;
int conv_option = 6;

void setup() {
  size(1000, 500, P2D);
  img = loadImage("eiffel.jpg");
  textureImg = createShape(img, 1000, 500);
  textureShader = loadShader("original.glsl");
}

void draw() {
  background(200);
  shader(textureShader);
  shape(textureImg);
}

PShape createShape(PImage tex,int x, int y) {
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
void keyPressed() {
  if (key == '0') {
    textureShader = loadShader("gaussianblur.glsl");
  }else if(key == '1'){ //Edge detection 1
    textureShader = loadShader("edge1.glsl");
  }else if(key == '2'){ //Edge detection 2
    textureShader = loadShader("edge2.glsl");
  }else if(key == '3'){ //Edge detection 3
    textureShader = loadShader("edge3.glsl");
  }else if(key == '4'){ 
    textureShader = loadShader("boxblur.glsl");
  }else{ //Normal
    textureShader = loadShader("original.glsl");
  }
}
