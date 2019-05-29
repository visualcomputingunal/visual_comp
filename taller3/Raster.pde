void Raster(){
  PGgrid.beginDraw();
    PGgrid.background(0);
    PGgrid.stroke(0, 255, 0);
    if (gridHint)
      scene.drawGrid((int)pow(2, n));
    drawTriangleHint();
    pushMatrix();
    pushStyle();
    scene.applyTransformation(node);
    triangleRaster();
    popStyle();
    popMatrix();
  PGgrid.endDraw();
}

void triangleRaster() {
  pushStyle();
  stroke(255, 255, 0, 125);
  point(round(50), round(50));
  popStyle();
}
