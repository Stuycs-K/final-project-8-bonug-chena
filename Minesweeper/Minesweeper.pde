private Tile[][] mineMap;
static final int SQUARE_SIZE = 20;

void setup(){
  size(800,800);
  Board();
  //grid();
  //mineMaker();
}

//  public void mineMaker(){
//    for (int i = 0; i < width; i ++){
//      for (int j = 0; j < height; j++){
//        int random = (int) Math.random();
//        if (random <= .3){  

//        }
//  }


  public void Board() {
  mineMap = new Tile[width/SQUARE_SIZE][height/SQUARE_SIZE];
  for(int x = 0; x < mineMap.length; x ++){
    for(int y = 0; y < mineMap[x].length; y++){
        mineMap[x][y] = new Tile();
      }
    }
  }
  

  
//void grid() {
//  for(int x = 0; x < width; x += SQUARE_SIZE) {
//    for(int y = 0; y < height; y += SQUARE_SIZE) {
//      fill(250);
//      stroke(0);
//      square(x,y,SQUARE_SIZE);
//    }
//  }
//}
  
  
void draw(){
  for (int i = 0; i < mineMap.length ; i++){
    for (int j = 0; j < mineMap.length; j ++){
      if (mineMap[i][j].hasMine()){
        fill (255,0,0);
      }
      else {
        fill (250); // white
      }
      stroke(0);
      square(i,j,SQUARE_SIZE);
    }
  }
}
