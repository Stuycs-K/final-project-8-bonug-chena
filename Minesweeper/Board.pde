public class Board{
  private Tile[][] mineMap;
  static final int SQUARE_SIZE = 20;

public Board() {
mineMap = new Tile[width/SQUARE_SIZE][height/SQUARE_SIZE];
for(int x = 0; x < mineMap.length; x ++){
  for(int y = 0; y < mineMap[x].length; y++){
      mineMap[x][y] = new Tile();
    }
  }
}
  public void numSet(){
    for(int row = 0; row <  mineMap.length; row++){
      for(int col = 0; col< mineMap[row].length; col++){
       if(!mineMap[row][col].hasMine()){
         mineMap[row][col].setNeighbors(surroundingMines(row, col));
       }
      }
    }
  }

  public int surroundingMines(int row, int col){
    int neighbors = 0;
    if(row == 0 && col == 0){ //left top corner
      if(mineMap[row][col+1].hasMine())neighbors++;
      if(mineMap[row+1][col].hasMine())neighbors++;
      if(mineMap[row+1][col+1].hasMine())neighbors++;
      return neighbors;
    }
    if(row == 0 && col == mineMap[row].length -1){//bottom left corner
      if(mineMap[row][col-1].hasMine())neighbors++;
      if(mineMap[row+1][col].hasMine())neighbors++;
      if(mineMap[row+1][col-1].hasMine())neighbors++;
      return neighbors;
    }
    if(row == mineMap.length-1 && col == mineMap[row].length -1){//bottom right corner
      if(mineMap[row][col-1].hasMine())neighbors++;
      if(mineMap[row-1][col].hasMine())neighbors++;
      if(mineMap[row-1][col-1].hasMine())neighbors++;
      return neighbors;
    }

    if(row == mineMap.length-1 && col == 0){//top right corner
      if(mineMap[row][col+1].hasMine())neighbors++;
      if(mineMap[row-1][col].hasMine())neighbors++;
      if(mineMap[row-1][col+1].hasMine())neighbors++;
      return neighbors;
    }
    for(int i = -1; i <=1; i ++){
      for(int j = -1; j <= 1; j++){
        if(j == 0 && i ==0){}
        if(mineMap[row+i][col+j].hasMine())neighbors++;
      }
    }
    return neighbors;
  }




//  public void  mineMaker(){
//    for (int i = 0; i < mineMap.length; i ++){
//      for (int j = 0; j < mineMap[i].length; j++){
//        int random = (int) Math.random();
//        if (random <= .3){
//          mineMap[i][j].MINE = true;
//        }
//      }
//    }
//  }

}