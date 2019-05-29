int x, y;

void setPos(){
  // Grid position and dimension
  xPGgrid=400; yPGgrid=0; wPGgrid=600; hPGgrid=600;
  // Grid options position and dimension
  wPGoptions=100; hPGoptions=600; xPGoptions=xPGgrid-wPGoptions; yPGoptions=0;
  // Checkbox position and dimension
  xc=20; yc=300; wc=20; hc=20;
}

void mouseClicked(){
  if(mouseX>(xPGoptions+xc) && mouseX<(xPGoptions+xc+wc) && mouseY>(yPGoptions+yc) && mouseY<(yPGoptions+yc+hc)){
    background(200);
    gridHint = !gridHint;
  }
}

void keyPressed() {
  if (key == '+') {
    n = n < 7 ? n+1 : 2;
    node.setScaling(PGgrid.width/pow( 2, n));
  }
  if (key == '-') {
    n = n >2 ? n-1 : 7;
    node.setScaling(PGgrid.width/pow( 2, n));
  }
}
