private Tile mineMap;
static final int SQUARE_SIZE = 20;

void setup(){
  size(800,800);
  grid();
  mineMaker();
}

  void  mineMaker(){
    for (int i = 0; i < width; i ++){
      for (int j = 0; j < height; j++){
        int random = (int) Math.random();
        if (random <= .3){  
          //flagMine();
        }
      }
    }
  }
  

  
void grid() {
  for(int x = 0; x < width; x += SQUARE_SIZE) {
    for(int y = 0; y < height; y += SQUARE_SIZE) {
      fill(250);
      stroke(0);
      square(x,y,SQUARE_SIZE);
    }
  }
}
