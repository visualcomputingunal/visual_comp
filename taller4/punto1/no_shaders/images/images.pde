PImage original, conv;
PGraphics Labels;
int conv_option = 8;
float[][] mask = { {0, 0, 0},
                   {0, 1, 0},
                   {0, 0, 0}};  // Initialize the convolution mask with identity in order to avoid changes in original images

void setup() {
  size(1000, 560);
  Labels = createGraphics(1000, 60);
  original = loadImage("eiffel.jpg");
  conv = createImage(1000, 500, RGB);
}

void draw() {
  background(200);
  convolution(mask, conv);
  image(conv, 0, 0);
  labels();
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
      Labels.text("Edge Detection 1 (3x3)", 25, 40);
    else if(conv_option == 3)
      Labels.text("Edge Detection 2 (3x3)", 25, 40);
    else if(conv_option == 4)
      Labels.text("Edge Detection 3 (3x3)", 25, 40);
    else if(conv_option == 5)
      Labels.text("Emboss 1 (3x3)", 25, 40);
    else if(conv_option == 6)
      Labels.text("Sharpen 1 (3x3)", 25, 40);
    else if(conv_option == 7)
      Labels.text("Sharpen 2 (3x3)", 25, 40);
    else
      Labels.text("Original", 25, 40);
  Labels.endDraw();
  image(Labels,0,500);
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == RIGHT) conv_option += 1;
    else if (keyCode == LEFT) conv_option -= 1;
    
    if(conv_option > 8)conv_option = 0;
    else if(conv_option < 0)conv_option = 8;
  }
  
  if (key=='0' || conv_option == 0) {// Gaussian Blur
    conv_option = 0;
    mask = new float [][]{{0.0625, 0.125, 0.0625},
                          {0.1250, 0.250, 0.1250},
                          {0.0625, 0.125, 0.0625}};
  }if(key=='1' || conv_option == 1){ //Box Blur
    conv_option = 1;
    mask = new float [][]{{0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111}};
  }if(key=='2' || conv_option == 2){ //Edge Detection 1
    conv_option = 2;
    mask = new float [][]{{1, 0, -1},
                          {0, 0, 0},
                          {-1, 0, 1}};
  }if(key=='3' || conv_option == 3){ //Edge Detection 2
    conv_option = 3;
    mask = new float [][]{{-1, -1, -1},
                          {-1, 8, -1},
                          {-1, -1, -1}};
  }if(key=='4' || conv_option == 4){ //Edge Detection 3
    conv_option = 4;
    mask = new float [][]{{0, 1, 0},
                          {1, -4, 1},
                          {0, 1, 0}};
  }if(key=='5' || conv_option == 5){  //Emboss
    conv_option = 5;
    mask = new float [][]{{-1, -1, 0},
                          {-1, 0, 1},
                          {0, 1, 1}};
  }if(key=='6' || conv_option == 6){  //Sharpen 1
    conv_option = 6;
    mask = new float [][]{{-1, -1, -1},
                          {-1, 9, -1},
                          {-1, -1, -1}};
  }if(key=='7' || conv_option == 7){  //Sharpen 2
    conv_option = 7;
    mask = new float [][]{{1, 1, 1},
                          {1, -7, 1},
                          {1, 1, 1}};
  }if(key=='8' || conv_option == 8){ //Normal
    conv_option = 8;
    mask = new float [][]{{0, 0, 0},
                          {0, 1, 0},
                          {0, 0, 0}};
  }
}
