//private Board board;
import java.util.Arrays;

private Tile[][] mineMap;
static final int SQUARE_SIZE = 40;

void setup(){
  size(800,800);
  Board();
  //test();
  System.out.println(Arrays.toString(test()));
}


public boolean[][] test(){
  boolean[][] ans = new boolean[mineMap.length][mineMap.length];
  for (int i = 0; i < mineMap.length; i++){
    for (int j = 0; j < mineMap[i].length; j ++){
        ans[i][j] = mineMap[i][j].getMine();
    }
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
  
  
  //void  mineMaker(){
  //  for (int i = 0; i < width/SQUARE_SIZE; i ++){
  //    for (int j = 0; j < height/SQUARE_SIZE; j++){
  //      int random = (int) Math.random();
  //      if (random <= .3){  
  //        //flagMine();
  //      }
  //    }
  //  }
  //}
  
void draw(){
//  for (int i = 0; i < mineMap.length ; i++){
//    for (int j = 0; j < mineMap.length; j ++){
//      if (mineMap[i][j].getMine()){
//        //fill (255,0,0);
//        makeSquare(i,j, 255);
        
//      }
//      else {
//         makeSquare(i,j, 0);
//        //fill (250); // white
//      }
//      //stroke(0);
//      //square(i,j,SQUARE_SIZE);
//    }
//  }
  grid();
}


public void makeSquare(int x, int y, int col){
  fill(col);
  stroke(0);
  square(x, y, SQUARE_SIZE);
}

  
public void grid(){
  for(int x = 0; x < width; x += SQUARE_SIZE){
    for(int y = 0; y < height; y+= SQUARE_SIZE){
      if (mineMap[X/SQUARE_SIZE][y/SQUARE_SIZE].getMine()){
         makeSquare(x,y,100);
      }
      else {
         makeSquare(x,y,250);
      }
    }
  }
}
