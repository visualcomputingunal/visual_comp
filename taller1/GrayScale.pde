void grayScale(PImage modified, boolean image){
  if(image){
    modified.loadPixels();
    for (int i = 0; i < original.pixels.length; i++){ 
      color c = original.pixels[i];
      int g = (int)(blue(c)+green(c)+red(c))/3;
      modified.pixels[i] = color(g);    
    }
    modified.updatePixels();
  }else{
    vid_choices();
    modified.loadPixels();
    for (int i = 0; i < originalPG.pixels.length; i++){ 
      color c = originalPG.pixels[i];
      int g = (int)(blue(c)+green(c)+red(c))/3;
      modified.pixels[i] = color(g);    
    }
    modified.updatePixels();
  }
}
