void convolution(float[][] matrix, PImage modified){
    modified.loadPixels();
    for (int x = 0; x < original.width; x++) {
      for (int y = 0; y < original.height; y++) {
        color c = kernel(x, y, matrix, original);
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
