import processing.video.*;

Movie myMovie;
PImage videoConv, original;
int conv_option = 10;
PGraphics originalPG, modifiedPG, Labels;
float[][] mask = { {0, 0, 0},
                        {0, 1, 0},
                        {0, 0, 0}};
void setup(){
  size(1152, 600);
  background(200);
  myMovie = new Movie(this, "video.mp4");
  myMovie.play();
  originalPG = createGraphics(1152, 540);
  modifiedPG = createGraphics(1152, 540);
  Labels = createGraphics(1152, 60);
  videoConv = createImage(1152, 540, RGB);
}

void draw(){
  originalPG.beginDraw();
  originalPG.image(myMovie, 0, 0);
  originalPG.endDraw();
  vid(mask, videoConv);
  println(frameRate);
  modifiedPG.beginDraw();
  modifiedPG.image(videoConv, 0, 0);
  modifiedPG.endDraw();
  image(modifiedPG, 0, 0);
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
      Labels.text("Motion Blur (9x9)", 25, 40);
    else if(conv_option == 3)
      Labels.text("Edge Detection 1 (3x3)", 25, 40);
    else if(conv_option == 4)
      Labels.text("Edge Detection 2 (3x3)", 25, 40);
    else if(conv_option == 5)
      Labels.text("Edge Detection 3 (3x3)", 25, 40);
    else if(conv_option == 6)
      Labels.text("Sharpen 1 (3x3)", 25, 40);
    else if(conv_option == 7)
      Labels.text("Sharpen 2 (3x3)", 25, 40);
    else if(conv_option == 8)
      Labels.text("Emboss 1 (3x3)", 25, 40);
    else if(conv_option == 9)
      Labels.text("Emboss 2 (5x5)", 25, 40);
    else
      Labels.text("Original", 25, 40);
  Labels.endDraw();
  image(Labels,0,540);
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == RIGHT) conv_option += 1;
    else if (keyCode == LEFT) conv_option -= 1;
    
    if(conv_option > 10)conv_option = 0;
    else if(conv_option < 0)conv_option = 10;
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
  }if(key=='2' || conv_option == 2){ //Motion Blur
    conv_option = 2;
    mask = new float [][]{{0.11111, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
                          {0.0, 0.11111, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
                          {0.0, 0.0, 0.11111, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
                          {0.0, 0.0, 0.0, 0.11111, 0.0, 0.0, 0.0, 0.0, 0.0},
                          {0.0, 0.0, 0.0, 0.0, 0.11111, 0.0, 0.0, 0.0, 0.0},
                          {0.0, 0.0, 0.0, 0.0, 0.0, 0.11111, 0.0, 0.0, 0.0},
                          {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.11111, 0.0, 0.0},
                          {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.11111, 0.0},
                          {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.11111}};
  }if(key=='3' || conv_option == 3){ //Edge Detection 1
    conv_option = 3;
    mask = new float [][]{{1, 0, -1},
                          {0, 0, 0},
                          {-1, 0, 1}};
  }if(key=='4' || conv_option == 4){ //Edge Detection 2
    conv_option = 4;
    mask = new float [][]{{-1, -1, -1},
                          {-1, 8, -1},
                          {-1, -1, -1}};
  }if(key=='5' || conv_option == 5){ //Edge Detection 3
    conv_option = 5;
    mask = new float [][]{{0, 1, 0},
                          {1, -4, 1},
                          {0, 1, 0}};
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
  }if(key=='8' || conv_option == 8){  //Emboss 1
    conv_option = 8;
    mask = new float [][]{{-1, -1, 0},
                          {-1, 0, 1},
                          {0, 1, 1}};
  }if(key=='9' || conv_option == 9){  //Emboss 2
    conv_option = 9;
    mask = new float [][]{{-1, -1, -1, -1, 0},
                          {-1, -1, -1,  0, 1},
                          {-1, -1,  0,  1, 1},
                          {-1,  0,  1,  1, 1},
                          { 0,  1,  1,  1, 1}};
  }if(key=='r' || key=='R' ||  conv_option == 10){ //Normal
    conv_option = 10;
    mask = new float [][]{{0, 0, 0},
                          {0, 1, 0},
                          {0, 0, 0}};
  }
}
