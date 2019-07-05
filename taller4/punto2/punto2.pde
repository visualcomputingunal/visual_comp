PShape can;
float angle;
int xl = 320, yl = 450, zl=200;
PShader lightShader;
boolean diffuse = true;
boolean vertex = true;

void setup() {
  size(640, 450, P3D);
  can = createCan(100, 200, 32);
  lightShader = loadShader("diffuse/lightfrag.glsl", "diffuse/lightvert.glsl");
}

void draw() {    
  background(0);

  shader(lightShader);

  pointLight(255, 255, 255, xl, yl, zl);
  translate(width/2, height/2);
  rotateY(angle);  
  shape(can);  
  angle += 0.01;
}

PShape createCan(float r, float h, int detail) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}

void keyPressed() {
  if(key == CODED){
    if(keyCode == UP) yl+=20;
    else if(keyCode == DOWN) yl-=20;
    else if(keyCode == RIGHT) xl+=20;
    else if(keyCode == LEFT) xl-=20;
  }
  
  if(key == 'r' || key == 'R'){
    xl=320; yl=450; zl=200;
    diffuse=true; vertex=true;
  }
  
  if (key == ' ') diffuse = !diffuse;
  else if (key == 'v' || key == 'V') vertex = true;
  else if (key == 'p' || key == 'P') vertex = false;
  else if(key == '+') zl +=10;
  else if(key == '-') zl -=10;
  
  if(diffuse){
    if(vertex)
      lightShader = loadShader("diffuse/lightfrag.glsl", "diffuse/lightvert.glsl");
    else
      lightShader = loadShader("diffuse/pixlightfrag.glsl", "diffuse/pixlightvert.glsl");
  }else{
    if(vertex)
      lightShader = loadShader("specular/lightfrag.glsl", "specular/lightvert.glsl");
    else
      lightShader = loadShader("specular/pixlightfrag.glsl", "specular/pixlightvert.glsl");
  }
}
