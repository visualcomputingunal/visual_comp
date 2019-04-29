//Authors //<>//
//Jhon Alexander Sedano Delgado
//David Felipe Rico

import processing.video.*;  
Movie myMovie;
PGraphics originalPG, gsPG, edgedPG, blurredPG;
PImage gsMovie, edgedMovie, blurredMovie;

int w, h;
                    
float [][] edges = {{-1, -1, -1}, 
                    {-1, 8, -1 }, 
                    {-1, -1, -1}}; 

float [][] blur = {{0.0625, 0.1250, 0.0625}, 
                   {0.1250, 0.2500, 0.1250}, 
                   {0.0625, 0.1250, 0.0625}}; 
                    
String s1 = "Original Movie";
String s2 = "Blurred Movie";
String s3 = "Edged Movie";
String s4 = "GrayScale Movie";

void setup() {
  size(1200, 800);
  w = 500;
  h = 500;

  myMovie = new Movie(this, "sample.mp4");
  myMovie.loop();  
  
  gsMovie = createImage(w, h, RGB);
  edgedMovie = createImage(w, h, RGB);
  blurredMovie = createImage(w, h, RGB);
  
  originalPG = createGraphics(w, h);
  gsPG = createGraphics(w, h);
  blurredPG = createGraphics(w, h);
  edgedPG = createGraphics(w, h);
}

void draw() {
  textSize(32);
  fill(0);
  
  originalPG.beginDraw();
  originalPG.image(myMovie, 100, 100);
  originalPG.endDraw();
  text(s1, 100, 80);
  image(originalPG, 0, 0);
  
  blurredPG.beginDraw();
  conv(blur, myMovie, 1);
  blurredPG.image(blurredMovie, 0, 0);
  blurredPG.endDraw();
  text(s2, 100, 380);
  image(blurredPG, 100, 400);
  
  edgedPG.beginDraw();
  conv(edges, myMovie, 2);
  edgedPG.image(edgedMovie, 0, 0);
  edgedPG.endDraw();
  text(s3, 800, 80);
  image(edgedPG, 800, 100);
  
  gsPG.beginDraw();
  grayScale(myMovie);
  gsPG.image(gsMovie, 0, 0);
  gsPG.endDraw();
  text(s4, 800, 380);
  image(gsPG, 800, 400);
  
  println(frameRate);
}

void movieEvent(Movie m) { 
  m.read();
}
void grayScale(PImage original){
  gsMovie = original.copy();
  gsMovie.loadPixels();
  for (int i = 0; i < original.pixels.length; i++){ 
    color c = original.pixels[i];
    int g = (int)(blue(c) + green(c) + red(c)) / 3;
    gsMovie.pixels[i] = color(g);  
    
  }
  gsMovie.updatePixels();
}
void conv(float[][] mask, PImage original, int type){
  if(type == 1){
    blurredMovie = original.copy();
    blurredMovie.loadPixels();
  }else{ 
    edgedMovie = original.copy();
    edgedMovie.loadPixels();
  }
  for (int x = 0; x < original.width; x++) {
    for (int y = 0; y < original.height; y++) {
      color c = kernel(x, y, mask, original);
      int loc = x + y * original.width;
      if(type == 1){
        blurredMovie.pixels[loc] = c;
      }else{
        edgedMovie.pixels[loc] = c;
      }
    }
  }
  blurredMovie.updatePixels();
  edgedMovie.updatePixels();
}

color kernel(int x, int y, float[][] matrix, PImage base) {
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
