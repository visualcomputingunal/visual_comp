float angle;
PImage golf_l, soccer_l, basketball_l, volleyball_l;
PShape golf, soccer, basketball, volleyball;
PShader textureShader;
boolean bump = false;
int texture = 1;

void setup() {
  size(500, 500, P3D);
  
  golf_l = loadImage("golfball.jpg");
  golf = createShape(SPHERE, 150);
  golf.setStroke(false);
  golf.setTexture(golf_l);
  
  soccer_l = loadImage("soccerball.jpg");
  soccer = createShape(SPHERE, 150);
  soccer.setStroke(false);
  soccer.setTexture(soccer_l);
  
  basketball_l = loadImage("basketball.jpg");
  basketball = createShape(SPHERE, 150);
  basketball.setStroke(false);
  basketball.setTexture(basketball_l);
  
  volleyball_l = loadImage("volleyball.jpg");
  volleyball = createShape(SPHERE, 150);
  volleyball.setStroke(false);
  volleyball.setTexture(volleyball_l);
  
  textureShader = loadShader("original.glsl");
}

void draw() {    
  background(200);
  translate(250, 250, 0);
  pointLight(255, 255, 255, width/2, height/2, 400);
  rotateY(angle);
  shader(textureShader);
  
  if(texture == 1) shape(golf);
  else if(texture == 2) shape(soccer);
  else if(texture == 3) shape(basketball);
  else if(texture == 4) shape(volleyball);
  
  angle += 0.01;
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT) texture -= 1;
    else if(keyCode == RIGHT) texture += 1;
    
    if(texture > 4)texture = 1;
    else if(texture < 0) texture = 4;
  }
  
  if(key == 'b' || key == 'B') bump=!bump;
  if(bump)textureShader = loadShader("emboss.glsl");
  else textureShader = loadShader("original.glsl");
}
