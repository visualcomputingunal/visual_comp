import nub.timing.*;
import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

PGraphics PGgrid, PGoptions;
int xPGgrid, yPGgrid, wPGgrid, hPGgrid;
int xPGoptions, yPGoptions, wPGoptions, hPGoptions;
Scene scene;
Node node;
Vector v1, v2, v3;
int n = 4;
boolean gridHint = true;

void setup(){
  size(1200, 600, P3D);
  background(200);
  
  setPos();
  
  PGgrid = createGraphics(wPGgrid, hPGgrid);
  PGoptions = createGraphics(wPGoptions, hPGoptions);
  
  scene = new Scene(this, PGgrid);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(PGgrid.width);
  scene.fit(0);
  node = new Node();
  node.setScaling(PGgrid.width/pow(2, n));
  randomizeTriangle();
}

void draw(){
  gridOptions();
  Raster();
  image(PGgrid, xPGgrid, yPGgrid);
}

void randomizeTriangle() {
  int w = xPGgrid + PGgrid.width;
  int h = yPGgrid + PGgrid.height;
  v1 = new Vector(random(xPGgrid, w), random(yPGgrid, h));
  v2 = new Vector(random(xPGgrid, w), random(yPGgrid, h));
  v3 = new Vector(random(xPGgrid, w), random(yPGgrid, h));
}

void drawTriangleHint() {
  pushStyle();
  noFill();
  strokeWeight(2);
  stroke(255, 0, 0);
  triangle(v1.x(), v1.y(), v2.x(), v2.y(), v3.x(), v3.y());
  strokeWeight(5);
  stroke(0, 255, 255);
  point(v1.x(), v1.y());
  point(v2.x(), v2.y());
  point(v3.x(), v3.y());
  popStyle();
}

void gridOptions(){
  PGoptions.beginDraw();
    // Checkbox position and dimension
    int xc=20, yc=300, wc=20, hc=20;
    
    PGoptions.background(100);
    PGoptions.fill(255);
    PGoptions.stroke(0);
    PGoptions.rect(xc, yc, wc, hc);
    PGoptions.fill(0);
    PGoptions.text("Grid", xc+wc+5, yc+hc-5);
    if (gridHint){
      PGoptions.fill(0, 255, 0);
      PGoptions.stroke(0);
      PGoptions.rect(xc+2, yc+2, wc-4, hc-4);
    }
  PGoptions.endDraw();
  image(PGoptions, xPGoptions, 0);
}
