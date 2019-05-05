void convolution(float[][] matrix, PImage modified, boolean image){
  if(image) {
    conv_choices();
    modified.loadPixels();
    for (int x = 0; x < original.width; x++) {
      for (int y = 0; y < original.height; y++) {
        color c = kernel(x, y, matrix, original);
        int loc = x + y * original.width;
        modified.pixels[loc] = c;
      }
    }
    modified.updatePixels();
  }else{
    vid_choices();
    modified.loadPixels();
    for (int x = 0; x < originalPG.width; x++) {
      for (int y = 0; y < originalPG.height; y++) {
        color c = kernel(x, y, matrix, originalPG);
        int loc = x + y * originalPG.width;
        modified.pixels[loc] = c;
      }
    }
    modified.updatePixels();
  }
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
  text("Original", 855, 310);
  
  if(conv_option == 1){
    fill(0);
    rect(700, 170, 100, 30);
    fill(255);
    text("Gaussian Blur", 710, 190);
  }if(conv_option == 2){
    fill(0);
    rect(830, 170, 100, 30);
    fill(255);
    text("Box Blur", 850, 190);
  }if(conv_option == 3){
    fill(0);
    rect(690, 230, 120, 30);
    fill(255);
    text("Edge Detection 1", 700, 250);
  }if(conv_option == 4){
    fill(0);
    rect(820, 230, 120, 30);
    fill(255);
    text("Edge Detection 2", 830, 250);
  }if(conv_option == 5){
    fill(0);
    rect(690, 290, 120, 30);
    fill(255);
    text("Edge Detection 3", 700, 310);
  }if(conv_option == 6){
    fill(0);
    rect(830, 290, 100, 30);
    fill(255);
    text("Original", 855, 310);
  }
  noFill();
}
