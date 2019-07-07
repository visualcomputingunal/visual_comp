void vid(float[][] mask, PImage modified){
  myMovie.loop();
  convolution(mask, modified);
}

void movieEvent(Movie m) { 
  m.read();
}
