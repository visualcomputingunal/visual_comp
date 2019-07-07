PImage original, conv;
PGraphics imgContainer;
float[][] mask = { {0, 0, 0},
                   {0, 1, 0},
                   {0, 0, 0}};  // Initialize the convolution mask with identity in order to avoid changes in original images

void setup() {
  size(1000, 500);
  original = loadImage("eiffel.jpg");
  conv = createImage(1000, 500, RGB);
}

void draw() {
  background(200);
  convolution(mask, conv);
  image(conv, 0, 0);
}

void keyPressed() {
  if (key == '0') {
    mask = new float [][]{{0.0625, 0.125, 0.0625},
                          {0.1250, 0.250, 0.1250},
                          {0.0625, 0.125, 0.0625}};
  }else if(key == '1'){ //Edge detection 1
    mask = new float [][]{{1, 0, -1},
                          {0, 0, 0},
                          {-1, 0, 1}};
  }else if(key == '2'){ //Edge detection 2
    mask = new float [][]{{-1, -1, -1},
                          {-1, 8, -1},
                          {-1, -1, -1}};
  }else if(key == '3'){ //Edge detection 3
    mask = new float [][]{{0, 1, 0},
                          {1, -4, 1},
                          {0, 1, 0}};
  }else if(key == '4'){ 
    mask = new float [][]{{0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111}};
  }else if(key == '5'){  //emboss 
    mask = new float [][]{{-1, -1, 0},
                          {-1, 0, 1},
                          {0, 1, 1}};
  }else if(key == '6'){  //sharpen 1
    mask = new float [][]{{-1, -1, -1},
                          {-1, 9, -1},
                          {-1, -1, -1}};
  }else if(key == '7'){  //sharpen 2
    mask = new float [][]{{1, 1, 1},
                          {1, -7, 1},
                          {1, 1, 1}};
  }else{ //Normal
    mask = new float [][]{{0, 0, 0},
                          {0, 1, 0},
                          {0, 0, 0}};
  }
}
