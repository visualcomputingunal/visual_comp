void video(float[][] mask, PImage modified){
  myMovie.loop();
  if(vid_option == 3){
    grayScale(modified, false);
  }else{
    convolution(mask, modified, false);
  }
  println(frameRate);
}

void movieEvent(Movie m) { 
  m.read();
}

void vid_choices(){
  fill(100,255,50);
  rect(845, 145, 100, 30);
  rect(845, 205, 100, 30);
  rect(845, 265, 100, 30);
  rect(845, 325, 100, 30);
  fill(0);
  text("Original", 870, 165);
  text("Gaussian Blur", 855, 225);
  text("Edge Detection", 850, 285);
  text("Gray Scale", 865, 345);
  
  if(vid_option == 0){
    fill(0);
    rect(845, 145, 100, 30);
    fill(255);
    text("Original", 870, 165);
  }if(vid_option == 1){
    fill(0);
    rect(845, 205, 100, 30);
    fill(255);
    text("Gaussian Blur", 855, 225);
  }if(vid_option == 2){
    fill(0);
    rect(845, 265, 100, 30);
    fill(255);
    text("Edge Detection", 850, 285);
  }if(vid_option == 3){
    fill(0);
    rect(845, 325, 100, 30);
    fill(255);
    text("Gray Scale", 865, 345);
  }
  noFill();
}
