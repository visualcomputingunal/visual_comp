import nub.timing.*;
import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

// 1. Nub objects
Scene scene;
Node node;
Vector v1, v2, v3;
// timing
TimingTask spinningTask;
boolean yDirection;
// scaling is a power of 2
int n = 4;
color[] c = {color(255, 255, 0, 125), color(0, 255, 255, 125), color(255, 0, 255, 125)};
// 2. Hints
boolean triangleHint = true;
boolean gridHint = true;
boolean debug = true;
boolean square = false;
// 3. Use FX2D, JAVA2D, P2D or P3D
String renderer = P3D;
// 4. Window dimension
int dim = 9;

void settings() {
  size(int(pow(2, dim)), int(pow(2, dim)), renderer);
}

void setup() {

  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fit(1);

  // not really needed here but create a spinning task
  // just to illustrate some nub.timing features. For
  // example, to see how 3D spinning from the horizon
  // (no bias from above nor from below) induces movement
  // on the node instance (the one used to represent
  // onscreen pixels): upwards or backwards (or to the left
  // vs to the right)?
  // Press ' ' to play it
  // Press 'y' to change the spinning axes defined in the
  // world system.
  spinningTask = new TimingTask() {
    @Override
      public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };
  scene.registerTask(spinningTask);

  node = new Node();
  node.setScaling(width/pow(2, n));

  // init the triangle that's gonna be rasterized
  randomizeTriangle();
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (gridHint)
    scene.drawGrid(scene.radius(), (int)pow(2, n));
  if (triangleHint)
    drawTriangleHint();
  pushMatrix();
  pushStyle();
  scene.applyTransformation(node);
  triangleRaster();
  popStyle();
  popMatrix();
}

// Implement this function to rasterize the triangle.
// Coordinates are given in the node system which has a dimension of 2^n
void triangleRaster() {  
  int boundary = floor(pow(2, n)/2);
  boolean repeat = true;
  // Iteration through the grid
  for (int i = -boundary; i < boundary; i++) {
    for (int j = -boundary; j < boundary; j++) {
      pushStyle();
      // Convert vector to world node to operate with v1, v2 and v3 
      Vector p = node.worldLocation(new Vector(i + 0.5f, j + 0.5f));
      // Draw point if vector belongs to area 
      if (belongsToTriangle(p)) {
        drawPoint(i, j);
        repeat = false;
      }
      
    }
    if (i == boundary - 1 && repeat) {
      Vector v = v1;
      v1 = v2;
      v2 = v;
      i = -boundary;
      repeat = false;
    }
  }
  // node.location converts points from world to node
  // here we convert v1 to illustrate the idea
  if (debug) {
    pushStyle();
    stroke(c[1]);
    fill(color(c[1]));
    drawPoint(floor(node.location(v1).x()), floor(node.location(v1).y()));
    stroke(c[2]);
    fill(color(c[2]));
    drawPoint(floor(node.location(v2).x()), floor(node.location(v2).y()));
    stroke(c[0]);
    fill(color(c[0]));
    drawPoint(floor(node.location(v3).x()), floor(node.location(v3).y()));
    popStyle();
  }
}

boolean belongsToTriangle(Vector p) {
  boolean inside;
  float w[] = new float[3];
  inside = (w[0] = triangleArea(p, v1, v2)) >= 0;
  inside &= (w[1] = triangleArea(p, v2, v3)) >= 0;
  inside &= (w[2] = triangleArea(p, v3, v1)) >= 0; 
   
  if (inside) { 
    color c = vectorRGB(w);
    stroke(c);
    fill(c);
    return inside;
  } 
  return false;
}
float triangleArea(Vector v1, Vector v2, Vector v3) //Parallelogram Method
{   
    float v_one_x = node.location(v1).x();
    float v_one_y = node.location(v1).y();
    float v_two_x = node.location(v2).x();
    float v_two_y = node.location(v2).y();
    float v_three_x = node.location(v3).x();
    float v_three_y = node.location(v3).y();
    return ((v_one_x - v_two_x) * (v_three_y - v_two_y) - (v_one_y - v_two_y) * (v_three_x - v_two_x)); 
}

// Color of a vector in the triangle
color vectorRGB(float[] edge) {
  float r = 0, g = 0, b = 0, 
    area = triangleArea(v1, v2, v3);
  for (int i = 0; i < 3; i++) {
    edge[i] /= area;
    r += edge[i] * red(c[i]);
    g += edge[i] * green(c[i]);
    b += edge[i] * blue(c[i]);
  }
  return color(r, g, b);
}

void randomizeTriangle() {
  int low = -width / 2;
  int high = width / 2;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    v1 = new Vector(mouseX - width / 2, mouseY - height / 2);
  } else if (mouseButton == RIGHT) {
    v2 = new Vector(mouseX - width / 2, mouseY - height / 2);
  } else {
    v3 = new Vector(mouseX - width / 2, mouseY - height / 2);
  }
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
void keyPressed() {
  if (key == 'g')
    gridHint = !gridHint;
  if (key == 't')
    triangleHint = !triangleHint;
  if (key == 'd')
    debug = !debug;
  if (key == '+') {
    n = n < 7 ? n+1 : 2;
    node.setScaling(width/pow( 2, n));
  }
  if (key == '-') {
    n = n >2 ? n-1 : 7;
    node.setScaling(width/pow( 2, n));
  }
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run(20);
  if (key == 'y')
    yDirection = !yDirection;
  if (key == 'c')  // Draws squares instead of points
    square = !square;
 
}

void drawPoint(float x, float y) {
  if (square) {
    noStroke();
    rect(x, y, 1, 1);
  } else
    point(x + 0.5, y + 0.5);
}
