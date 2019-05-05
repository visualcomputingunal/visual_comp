//Authors
//Jhon Alexander Sedano Delgado
//David Felipe Rico Hernandez

import processing.video.*;

Movie myMovie;
PImage original, img01, img02, img03, segm, gray, conv, video;
PGraphics originalPG, modifiedPG;
int mode = 0,sel_img = 1, conv_option = 6, vid_option = 0, histogram[], gh[];
long wait = 300, lastTime;
float[][] mask = { {0, 0, 0},
                   {0, 1, 0},
                   {0, 0, 0}};  // Initialize the convolution mask with identity in order to avoid changes in original images

float[][] videoMask = { {0, 0, 0},
                        {0, 1, 0},
                        {0, 0, 0}};

void setup(){
  size(1000,500);
  background(200);
   
  img01 = loadImage("cat.jpg");
  img02 = loadImage("colors.jpg");
  img03 = loadImage("optical.jpg");
  img01.resize(250,250);
  img02.resize(250,250);
  img03.resize(250,250);
  gray = createImage(250, 250, RGB);
  conv = createImage(250, 250, RGB);
  segm = createImage(250, 250, RGB);
  
  myMovie = new Movie(this, "sample.mp4");
  myMovie.play();
  originalPG = createGraphics(350, 250);
  modifiedPG = createGraphics(320, 241);
  video = createImage(350, 250, RGB);
}

void draw() {
  init();
  navbar();
  
  if(mode == 1){
    img_menu();
    image(original, 100, 130);
    image(gray, 150+original.width,130);
  }else if(mode == 2){
    img_menu();
    image(original, 100, 130);
    convolution(mask, conv, true);
    image(conv, 150+original.width, 130);
  }else if(mode == 3){
    img_menu();
    image(original, 100, 130);
    histogram();
  }else if(mode == 4){
    img_menu();
    image(original, 100, 130);
    image(segm, 150+original.width, 130);
  }else if(mode == 5){
    image(originalPG, 100, 130);
    video(videoMask, video);
    modifiedPG.beginDraw();
    modifiedPG.image(video, 0, 0);
    modifiedPG.endDraw();
    image(modifiedPG, 150+originalPG.width, 130);
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
  
  originalPG.beginDraw();
  originalPG.image(myMovie, 0, 0);
  originalPG.endDraw();
  
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
  
  if(vid_option == 0){// Identity
    videoMask = new float [][]{{0, 0, 0},
                          {0, 1, 0},
                          {0, 0, 0}};
  }else if(vid_option == 1){//Gaussian Blur
    videoMask = new float [][]{{0.0625, 0.125, 0.0625},
                          {0.1250, 0.250, 0.1250},
                          {0.0625, 0.125, 0.0625}};
  }else if(vid_option == 2){// Edge Detection 2
    videoMask = new float [][]{{-1, -1, -1},
                          {-1, 8, -1},
                          {-1, -1, -1}};
  }
  
  grayScale(gray, true);
  histogram = getHistogram(original);
  gh = getHistogram(gray);
  segmentation(gh, gray, segm);
}

void mouseClicked() {
  background(200);
  if(mouseX > 20 && mouseX < 70 && mouseY > 170 && mouseY < 220 && mode != 5) {
    sel_img = 1;
  }else if(mouseX > 20 && mouseX < 70 && mouseY > 230 && mouseY < 280 && mode != 5) {
    sel_img = 2;
  }else if(mouseX > 20 && mouseX < 70 && mouseY > 290 && mouseY < 340 && mode != 5) {
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
  
  if(mouseX > 700 && mouseX < 800 && mouseY > 170 && mouseY < 200 && mode == 2) {
    conv_option = 1;
  }else if(mouseX > 830 && mouseX < 930 && mouseY > 170 && mouseY < 200 && mode == 2) {
    conv_option = 2;
  }else if(mouseX > 690 && mouseX < 810 && mouseY > 230 && mouseY < 260 && mode == 2) {
    conv_option = 3;
  }else if(mouseX > 820 && mouseX < 940 && mouseY > 230 && mouseY < 260 && mode == 2) {
    conv_option = 4;
  }else if(mouseX > 690 && mouseX < 810 && mouseY > 290 && mouseY < 320 && mode == 2) {
    conv_option = 5;
  }else if(mouseX > 830 && mouseX < 930 && mouseY > 290 && mouseY < 320 && mode == 2) {
    conv_option = 6;
  }
  
  if(mouseX > 845 && mouseX < 945 && mouseY > 145 && mouseY < 175 && mode == 5) {
    vid_option = 0;
  }else if(mouseX > 845 && mouseX < 945 && mouseY > 205 && mouseY < 235 && mode == 5) {
    vid_option = 1;
  }else if(mouseX > 845 && mouseX < 945 && mouseY > 265 && mouseY < 295 && mode == 5) {
    vid_option = 2;
  }else if(mouseX > 845 && mouseX < 945 && mouseY > 325 && mouseY < 355 && mode == 5) {
    vid_option = 3;
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
  
  if(sel_img == 1){
    fill(0);
    rect(20, 170, 50, 50);
    fill(255);
    text("Img 01", 26, 200);
  }if(sel_img == 2){
    fill(0);
    rect(20, 230, 50, 50);
    fill(255);
    text("Img 02", 26, 260);
  }if(sel_img == 3){
    fill(0);
    rect(20, 290, 50, 50);
    fill(255);
    text("Img 03", 26, 320);
  }
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
  text("Gray Scale", 170, 55);
  text("Convolution", 315, 55);
  text("Histogram", 470, 55);
  text("Segmentation", 610, 55);
  text("Video", 785, 55);
  
  if(mode == 1){
    fill(0);
    rect(150, 35, 100, 30);
    fill(255);
    text("Gray Scale", 170, 55);
    
    myMovie.jump(0);
    myMovie.pause();
    conv_option = 6;
    vid_option = 0;
  }if(mode == 2){
    fill(0);
    rect(300, 35, 100, 30);
    fill(255);
    text("Convolution", 315, 55);
    
    myMovie.jump(0);
    myMovie.pause();
    vid_option = 0;
  }if(mode == 3){
    fill(0);
    rect(450, 35, 100, 30);
    fill(255);
    text("Histogram", 470, 55);
    
    myMovie.jump(0);
    myMovie.pause();
    conv_option = 6;
    vid_option = 0;
  }if(mode == 4){
    fill(0);
    rect(600, 35, 100, 30);
    fill(255);
    text("Segmentation", 610, 55);
    
    myMovie.jump(0);
    myMovie.pause();
    conv_option = 6;
    vid_option = 0;
  }if(mode == 5){
    fill(0);
    rect(750, 35, 100, 30);
    fill(255);
    text("Video", 785, 55);
    conv_option = 6;
  }if(mode == 0){
    myMovie.jump(0);
    myMovie.pause();
  }
  noFill();
}

void resetValues(){
  if(mode == 5) conv_option = 6;
  else{
    myMovie.jump(0);
    myMovie.pause();
    vid_option = 0;
    if(mode != 2) conv_option = 6;
  }
}
