void segmentation(int[] hstg, PImage base, PImage modified){
  int bright = 0;
  int max = 0;
  
  for(int i = 0; i < hstg.length; i++){
    if(hstg[i] > max){
      max = hstg[i];
      bright = i;
    }
  }
  
  float lBound = bright - 10;
  float uBound = bright + 10;
  
  if(lBound < 0) lBound = 0;
  if(uBound > 250) uBound = 250;
  
  base.loadPixels();
  modified.loadPixels();
  for(int x = 0; x < base.width; x++){
    for(int y = 0;y < base.height; y++){
      int pos = x + y*base.width;
      int b = int(brightness(base.pixels[pos]));
      if(b >= lBound && b <= uBound) modified.pixels[pos] = color(255);
      else modified.pixels[pos] = color(0);
    }
  }
  modified.updatePixels();
}
