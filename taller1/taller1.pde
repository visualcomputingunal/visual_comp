//Authors
//Jhon Alexander Sedano Delgado
//David Felipe Rico

PImage img, gray, conv;
PGraphics p1, p2, p3, p4, p5;
color col;
float[][] mask = { {0, 0, 0},
                   {0, 1, 0},
                   {0, 0, 0}};  // Initialize the convolution mask with identity in order to avoid changes in original images
String title = "Image with Convolution";

void setup(){
  size(1000, 1000);
  img = loadImage("colors.jpg");
  gray = createImage(img.width, img.height, RGB);
  conv = createImage(img.width, img.height, RGB);

}

void draw() {
  textSize(32);
  String s1 = "Original Picture";
  fill(0, 012, 153);
  text(s1, 50, 50, 1000, 200);  // Text wraps within text box
  image(img, 50, 100);
  loadPixels();
  for (int i = 0; i < img.pixels.length; i++){ 
    color c = img.pixels[i];
    int g = (int)(blue(c) + green(c) + red(c)) / 3;
    gray.pixels[i] = color(g);    
  } 
  String s2 = "Grayscale Image";
  fill(0, 102, 153);
  text(s2, 100 + img.width, 50, 1000, 200);  // Text wraps within text box
  image(gray, 100 + img.width, 100);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      color c = convolution(x, y, mask, img);
      int loc = x + y * img.width;
      conv.pixels[loc] = c;
    }
  }
  conv.loadPixels();
  fill(0, 102, 153);
  text(title, 50, 120 + img.height, 1000, 200);  // Text wraps within text box
  image(conv, 50, 160 + img.height);
  conv.updatePixels();
}

color convolution(int x, int y, float[][] matrix, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  
  for (int i = 0; i < 3; i++){
    for (int j= 0; j < 3; j++){
      // What pixel are we testing
      int pixel = x + i + (y + j) * img.width;
      pixel = constrain(pixel, 0, img.pixels.length - 1);
      // Make sure we haven't walked off our image, we could do better here
      // Calculate the convolution
      //println(matrix[i][j]);
      rtotal += (red(img.pixels[pixel]) * matrix[i][j]);
      gtotal += (green(img.pixels[pixel]) * matrix[i][j]);
      btotal += (blue(img.pixels[pixel]) * matrix[i][j]);
    }
  }
  
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
  return color(rtotal, gtotal, btotal);
}
//Select mask according to pressed key
void keyPressed(){
  if(key == '1'){ //Gaussian Blur
    mask = new float [][]{{0.0625, 0.125, 0.0625},
                          {0.1250, 0.250, 0.1250},
                          {0.0625, 0.125, 0.0625}};
  }else if(key == '2'){ // Box Blur
    mask = new float [][]{{0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111}};
  }else if(key == '3'){ //Edge Detection 1
    mask = new float [][]{{1, 0, -1},
                          {0, 0, 0},
                          {-1, 0, 1}};
  }else if(key == '4'){ //Edge Detection 2
    mask = new float [][]{{-1, -1, -1},
                          {-1, 8, -1},
                          {-1, -1, -1}};
    
  }else if(key == '5'){ //Edge Detection 3
    mask = new float [][]{{0, 1, 0},
                          {1, -4, 1},
                          {0, 1, 0}};

  }else{
    mask = new float [][]{{0, 0, 0},
                          {0, 1, 0},
                          {0, 0, 0}};
  }
}
