import processing.video.*;

Movie myMovie;
PImage videoConv, original;
PGraphics originalPG, modifiedPG;
float[][] mask = { {0, 0, 0},
                        {0, 1, 0},
                        {0, 0, 0}};
void setup(){
  size(1280, 600);
  background(200);
  myMovie = new Movie(this, "video.mp4");
  myMovie.play();
  originalPG = createGraphics(1280, 600);
  modifiedPG = createGraphics(1280, 600);
  videoConv = createImage(1280, 600, RGB);
}

void draw(){
  originalPG.beginDraw();
  originalPG.image(myMovie, 0, 0);
  originalPG.endDraw();
  vid(mask, videoConv);
  println(frameRate);
  modifiedPG.beginDraw();
  modifiedPG.image(videoConv, 0, 0);
  modifiedPG.endDraw();
  image(modifiedPG, 0, 0);

}

void keyPressed() {
  if (key == '0') {
    mask = new float [][]{{0.0625, 0.125, 0.0625},
                          {0.1250, 0.250, 0.1250},
                          {0.0625, 0.125, 0.0625}};
  }else if(key == '1'){ //Edge detection 1
    mask = new float [][]{{1, 0, -1},
                          {0, 0, 0},
                          {-1, 0, 1}};
  }else if(key == '2'){ //Edge detection 2
    mask = new float [][]{{-1, -1, -1},
                          {-1, 8, -1},
                          {-1, -1, -1}};
  }else if(key == '3'){ //Edge detection 3
    mask = new float [][]{{0, 1, 0},
                          {1, -4, 1},
                          {0, 1, 0}};
  }else if(key == '4'){ //box blur
    mask = new float [][]{{0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111},
                          {0.11111, 0.11111, 0.11111}};
  }else if(key == '5'){  //emboss 
    mask = new float [][]{{-1, -1, 0},
                          {-1, 0, 1},
                          {0, 1, 1}};
  }else if(key == '6'){  //sharpen 1
    mask = new float [][]{{-1, -1, -1},
                          {-1, 9, -1},
                          {-1, -1, -1}};
  }else if(key == '7'){  //sharpen 2
    mask = new float [][]{{1, 1, 1},
                          {1, -7, 1},
                          {1, 1, 1}};
  }else{ //Normal
    mask = new float [][]{{0, 0, 0},
                          {0, 1, 0},
                          {0, 0, 0}};
  }
}
