import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

PGraphics PGgrid;

Scene scene;
Node node;
Vector v1, v2, v3;

int n = 4;

boolean triangleHint = true;
boolean gridHint = true;
boolean debug = true;

void setup(){
  size(1200, 600);
  background(200);
  
  PGgrid = createGraphics(600, 600);
  
  scene = new Scene(this, PGgrid);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(PGgrid.width);
  scene.fit(0);
  node = new Node();
  node.setScaling(width/pow(2, n));
  randomizeTriangle();
}

void draw(){
  PGgrid.beginDraw();
    PGgrid.background(0);
    PGgrid.stroke(0, 255, 0);
    scene.drawGrid((int)pow(2, n));
    drawTriangleHint();
    pushMatrix();
    pushStyle();
    scene.applyTransformation(node);
    popStyle();
    popMatrix();
  PGgrid.endDraw();
  image(PGgrid, 600, 0);
}

void randomizeTriangle() {
  int low = 0;
  int high = 600;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
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
