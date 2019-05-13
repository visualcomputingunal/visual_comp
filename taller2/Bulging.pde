int value1 = 0;
int value2 = 255;
int btn = 0;
float side = 3;
void Bulging(){
  
  init_2();
  img_menu();
  image(PGBul, 100 ,100);

}
void init_2(){
  PGBul.beginDraw();
  
  PGBul.noStroke();
  
  float h = 0;

  for(int i = 0; i<side; i++){
    
    float w = 0;
    for(int j = 0; j<side; j++){
      if((j%2==0 && i%2==0) || (j%2==1 && i%2==1)){
        PGBul.fill(value1);
        
      }else{
        PGBul.fill(value2);
      }
      
      PGBul.square(w, h, PGBul.width / side);
     
      if((j%2==0 && i%2==0) || (j%2==1 && i%2==1)){
        PGBul.fill(value2);
      }else{
        PGBul.fill(value1);
      }
      
      
      if((i < floor(side / 2) && j < floor(side / 2)) || (i > floor(side/2) && j > floor(side / 2))){
        PGBul.square(w + (PGBul.width / side) - 2 - PGBul.width / (side * 6), h + 2, PGBul.width / (side * 6)); // right upper corner
        PGBul.square(w + 2, h + (PGBul.width / side) - 2 - PGBul.width / (side * 6), PGBul.width / (side * 6)); // left lower corner 
      }else if((i > floor(side / 2) && j < floor(side / 2)) || (i < floor(side/2) && j > floor(side / 2))){
        PGBul.square(w + 2, h + 2, PGBul.width / (side * 6)); //left upper corner
        PGBul.square(w + (PGBul.width / side) - 2 - PGBul.width / (side * 6), h + (PGBul.width / side) - 2 - PGBul.width / (side * 6), PGBul.width / (side * 6)); //right lower corner
      }else if(i == floor(side / 2) && j < floor(side / 2)){//both corners left
        PGBul.square(w + (PGBul.width / side) - 2 - PGBul.width / (side * 6), h + 2, PGBul.width / (side * 6)); 
        PGBul.square(w + (PGBul.width / side) - 2 - PGBul.width / (side * 6), h + (PGBul.width / side) - 2 - PGBul.width / (side * 6), PGBul.width / (side * 6));
      }else if(i == floor(side / 2) && j > floor(side / 2)){//both corners right
        PGBul.square(w + 2, h + 2, PGBul.width / (side * 6));
        PGBul.square(w + 2, h + (PGBul.width / side) - 2 - PGBul.width / (side * 6), PGBul.width / (side * 6));  
      }else if(i < floor(side / 2) && j == floor(side / 2)){//both corners down
        PGBul.square(w + 2, h + (PGBul.width / side) - 2 - PGBul.width / (side * 6), PGBul.width / (side * 6)); 
        PGBul.square(w + (PGBul.width / side) - 2 - PGBul.width / (side * 6), h + (PGBul.width / side) - 2 - PGBul.width / (side * 6), PGBul.width / (side * 6));
      }else if(i > floor(side / 2) && j == floor(side / 2)){//both corners up
        PGBul.square(w + 2, h + 2, PGBul.width / (side * 6));
        PGBul.square(w + (PGBul.width / side) - 2 - PGBul.width / (side * 6), h + 2, PGBul.width / (side * 6));
      }
     
      w+=PGBul.width / side;
    }
    h+=PGBul.height / side;  
  }
  
  PGBul.endDraw();
}
void mouseClicked() {
  
  
  if(mouseX > 1000 && mouseX < 1100 && mouseY > 200 && mouseY < 225) {
    btn = 1;
  }else if(mouseX > 1000 && mouseX < 1100 && mouseY > 250 && mouseY < 275) {
    btn = 2;
  }else if(mouseX > 800 && mouseX < 900 && mouseY > 200 && mouseY < 225){
    btn = 3;
  }else if(mouseX > 800 && mouseX < 900 && mouseY > 200 && mouseY < 225){
    btn = 3;
    
  }
}
void img_menu(){
  fill(0);
  text("Intercambiar Colores",800,175);
  fill(value1);
  rect(800, 200, 100, 25);
  fill(0);
  text("Cantidad de cuadros", 1000,175);
  fill(0,255,0);
  rect(1000, 200, 100,25);
  fill(0);
  triangle(1045,215,1050,210,1055,215);
  fill(255,0,0);
  rect(1000, 250, 100,25);
  fill(0);
  triangle(1045,260,1050,265,1055,260);
 
  
  if(btn == 1){
    side+=2;
    btn = 0;
    println(side);
  }else if(btn == 2){
    side-=2;
    btn = 0;
    println(side);
  }else if(btn == 3){
    if(value1 == 0){
      value1 = 255;
      value2 = 0;
    }else{
      value1 = 0;
      value2 = 255;
    }
    btn=0;
  }
  noFill();
}
