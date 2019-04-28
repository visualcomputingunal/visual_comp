//Authors
//Jhon Alexander Sedano Delgado
//David Felipe Rico

PImage original, img01, img02, img03, segm, gray, conv;
PGraphics p1, p2, p3, p4, p5;
int mode = 0,sel_img = 1, conv_option = 6, histogram[], gh[];
color col;
float[][] mask = { {0, 0, 0},
                   {0, 1, 0},
                   {0, 0, 0}};  // Initialize the convolution mask with identity in order to avoid changes in original images

void setup(){
  size(1000,500);
  background(200);
  
  img01 = loadImage("colors.jpg");
  img02 = loadImage("optical.jpg");
  img03 = loadImage("cat.jpg");
  img01.resize(250,250);
  img02.resize(250,250);
  img03.resize(250,250);
  gray = createImage(250, 250, RGB);
  conv = createImage(250, 250, RGB);
  segm = createImage(250, 250, RGB);

}

void draw() {
  navbar();
  init();
  
  if(mode == 1){
    img_menu();
    image(gray, 150+original.width,130);
  }else if(mode == 2){
    img_menu();
    conv_choices();
    convolution(mask, conv);
    image(conv, 150+original.width, 130);
  }else if(mode == 3){
    img_menu();
    histogram();
  }else if(mode == 4){
    img_menu();
    image(segm, 150+original.width, 130);
  }else if(mode == 5){
    video();
  }
}

void init(){
  if(sel_img == 1){
    original = img01;
  }else if(sel_img == 2){
    original = img02;
  }else if(sel_img == 3){
    original = img03;
  }
  
  if(conv_option == 1){//Gaussian Blur
    mask = new float [][]{{0.0625, 0.125, 0.0625},
                          {0.1250, 0.250, 0.1250},
                          {0.0625, 0.125, 0.0625}};
  }else if(conv_option == 2){// Box Blur
    mask = new float [][]{{0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111}};
  }else if(conv_option == 3){// Edge Detection 1
    mask = new float [][]{{1, 0, -1},
                          {0, 0, 0},
                          {-1, 0, 1}};
  }else if(conv_option == 4){// Edge Detection 2
    mask = new float [][]{{-1, -1, -1},
                          {-1, 8, -1},
                          {-1, -1, -1}};
  }else if(conv_option == 5){// Edge Detection 3
    mask = new float [][]{{0, 1, 0},
                          {1, -4, 1},
                          {0, 1, 0}};
  }else if(conv_option == 6){// Identity
    mask = new float [][]{{0, 0, 0},
                          {0, 1, 0},
                          {0, 0, 0}};
  }
  
  grayScale(gray);
  histogram = getHistogram(original);
  gh = getHistogram(gray);
  segmentation(gh, gray, segm);
}

void mouseClicked() {
  background(200);
  if(mouseX > 20 && mouseX < 70 && mouseY > 170 && mouseY < 220) {
    sel_img = 1;
  }else if(mouseX > 20 && mouseX < 70 && mouseY > 230 && mouseY < 280) {
    sel_img = 2;
  }else if(mouseX > 20 && mouseX < 70 && mouseY > 290 && mouseY < 340) {
    sel_img = 3;
  }
  
  if(mouseX > 150 && mouseX < 250 && mouseY > 35 && mouseY < 65) {
    mode = 1;
  }else if(mouseX > 300 && mouseX < 400 && mouseY > 35 && mouseY < 65) {
    mode = 2;
  }else if(mouseX > 450 && mouseX < 550 && mouseY > 35 && mouseY < 65) {
    mode = 3;
  }else if(mouseX > 600 && mouseX < 700 && mouseY > 35 && mouseY < 65) {
    mode = 4;
  }else if(mouseX > 750 && mouseX < 850 && mouseY > 35 && mouseY < 65) {
    mode = 5;
  }
  
  if(mouseX > 700 && mouseX < 800 && mouseY > 170 && mouseY < 200) {
    conv_option = 1;
  }else if(mouseX > 830 && mouseX < 930 && mouseY > 170 && mouseY < 200) {
    conv_option = 2;
  }else if(mouseX > 690 && mouseX < 810 && mouseY > 230 && mouseY < 260) {
    conv_option = 3;
  }else if(mouseX > 820 && mouseX < 940 && mouseY > 230 && mouseY < 260) {
    conv_option = 4;
  }else if(mouseX > 690 && mouseX < 810 && mouseY > 290 && mouseY < 320) {
    conv_option = 5;
  }else if(mouseX > 830 && mouseX < 930 && mouseY > 290 && mouseY < 320) {
    conv_option = 6;
  }
}

void img_menu(){
  fill(255,0,0);
  rect(20, 170, 50, 50);
  rect(20, 230, 50, 50);
  rect(20, 290, 50, 50);
  fill(0);
  text("Img 01", 26, 200);
  text("Img 02", 26, 260);
  text("Img 03", 26, 320);
  noFill();
}

void conv_choices(){
  fill(100,255,50);
  rect(700, 170, 100, 30);
  rect(830, 170, 100, 30);
  rect(690, 230, 120, 30);
  rect(820, 230, 120, 30);
  rect(690, 290, 120, 30);
  rect(830, 290, 100, 30);
  fill(0);
  text("Gaussian Blur", 710, 190);
  text("Box Blur", 850, 190);
  text("Edge Detection 1", 700, 250);
  text("Edge Detection 2", 830, 250);
  text("Edge Detection 3", 700, 310);
  text("Identity", 855, 310);
  noFill();
}

void navbar(){
  fill(50,100,255);
  rect(150, 35, 100, 30);
  rect(300, 35, 100, 30);
  rect(450, 35, 100, 30);
  rect(600, 35, 100, 30);
  rect(750, 35, 100, 30);
  fill(0);
  text("Gray Scale", 165, 55);
  text("Convolution", 315, 55);
  text("Histogram", 470, 55);
  text("Segmentation", 610, 55);
  text("Video", 785, 55);
  noFill();
}

void grayScale(PImage modified){
  image(original, 100, 130);
  modified.loadPixels();
  for (int i = 0; i < original.pixels.length; i++){ 
    color c = original.pixels[i];
    int g = (int)(blue(c)+green(c)+red(c))/3;
    modified.pixels[i] = color(g);    
  }
  modified.updatePixels();
}

void convolution(float[][] mask, PImage modified){
  image(original, 100, 130);
  modified.loadPixels();
  for (int x = 0; x < original.width; x++) {
    for (int y = 0; y < original.height; y++) {
      color c = kernel(x, y, mask, original);
      int loc = x + y * original.width;
      modified.pixels[loc] = c;
    }
  }
  modified.updatePixels();
}

color kernel(int x, int y, float[][] matrix, PImage base){
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  
  for (int i = 0; i < 3; i++){
    for (int j= 0; j < 3; j++){
      // What pixel are we testing
      int pixel = x + i + (y + j) * base.width;
      pixel = constrain(pixel, 0, base.pixels.length - 1);
      // Make sure we haven't walked off our image, we could do better here
      // Calculate the convolution
      //println(matrix[i][j]);
      rtotal += (red(base.pixels[pixel]) * matrix[i][j]);
      gtotal += (green(base.pixels[pixel]) * matrix[i][j]);
      btotal += (blue(base.pixels[pixel]) * matrix[i][j]);
    }
  }
  
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
  return color(rtotal, gtotal, btotal);
}

int[] getHistogram(PImage base){
  int[] gh = new int[256];
  
  for (int i = 0; i < 250; i++) {
    for (int j = 0; j < 250; j++) {
      int bright = int(brightness(base.get(i, j)));
      gh[bright]++;
    }
  }
  return gh;
}

void histogram(){
  image(original, 100, 130);
  for (int i = 0; i < 250; i++) {
    for (int j = 0; j < 250; j++) {
      int bright = int(brightness(original.get(i, j)));
      int gbright = int(brightness(gray.get(i, j)));
      histogram[bright]++;
      gh[gbright]++;
    }
  }
  
  int hMax = max(histogram);
  int gMax = max(gh);
  
  stroke(255,0,0);
  for (int i = 0; i < 250; i +=2) {
    int which = int(map(i, 0, 250, 0, 255));
    int y = int(map(histogram[which], 0, hMax, 250, 0));
    line(i+400, 130+original.height, i+400, y+100);
  }
  stroke(0);
  for (int i = 0; i < 250; i +=2) {
    int which = int(map(i, 0, 250, 0, 255));
    int y = int(map(gh[which], 0, gMax, 250, 0));
    line(i+700, 130+original.height, i+700, y+130);
  }
  stroke(0);
}

void segmentation(int[] hstg, PImage base, PImage modified){
  float range = max(hstg)*0.3;
  
  base.loadPixels();
  modified.loadPixels();
  
  for(int x = 0; x < base.width; x++){
    for(int y = 0;y < base.height; y++){
      int pos = x + y*base.width;
      if(brightness(base.pixels[pos]) > range) modified.pixels[pos] = color(255);
      else modified.pixels[pos] = color(0);
    }
  }
  modified.updatePixels();
}

void video(){

}
