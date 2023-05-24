//private Board board;
import java.util.Arrays;

>>>>>>> mineMaker
private Tile[][] mineMap;
static final int SQUARE_SIZE = 100;

void setup(){
  size(800,800);
  Board();
}

//  public void mineMaker(){
//    for (int i = 0; i < width; i ++){
//      for (int j = 0; j < height; j++){
//        int random = (int) Math.random();
//        if (random <= .3){  

//        }
//  }


public String test(){
  String ans = "";
  boolean[][] map = new boolean[mineMap.length][mineMap.length];
  for (int i = 0; i < mineMap.length; i++){
    for (int j = 0; j < mineMap[i].length; j ++){
        map[i][j] = mineMap[i][j].getMine();
    }
    ans += Arrays.toString(map[i]) + " ";
    System.out.println(Arrays.toString(map[i]));
  }
  return ans;
}

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
  grid();
}


public void makeSquare(int x, int y, int col){
  fill(col);
  stroke(0);
  square(x, y, 20);
}

  
public void grid(){
  for(int x = 0; x < width; x += SQUARE_SIZE){
    for(int y = 0; y < height; y+= SQUARE_SIZE){
      int col = 250;
      if (mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].getMine()){
        col = 100;
      }
        makeSquare(x,y,col);
    }
  }
}
