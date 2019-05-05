int[] getHistogram(PImage base){
  int[] aux = new int[256];
  
  for (int i = 0; i < 250; i++) {
    for (int j = 0; j < 250; j++) {
      int bright = int(brightness(base.get(i, j)));
      aux[bright]++;
    }
  }
  return aux;
}

void histogram(){
  int hMax = max(histogram);
  int gMax = max(gh);
  fill(200);
  noStroke();
  rect(424,385,510,20);
  fill(0);
  stroke(255,0,0);
  for (int i = 0; i < original.width; i +=2) {
    int which = int(map(i, 0, original.width, 0, 255));
    int y = int(map(histogram[which], 0, hMax, original.height, 0));
    line(i+400, 130+original.height, i+400, y+100);
  }
  textSize(15);
  text("Original image's histogram",425,400);
  stroke(0);
  for (int i = 0; i < 250; i += 2) {
    int which = int(map(i, 0, 250, 0, 255));
    int y = int(map(gh[which], 0, gMax, 250, 0));
    line(i + 700, 130 + original.height, i + 700, y + 130);
  }
  text("Gray scale image's histogram",720,400);
  textSize(12);
  noFill();
  noStroke();
}
