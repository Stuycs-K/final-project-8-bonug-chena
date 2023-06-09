public class Board{
  private Tile[][] mineMap;
  private int SQUARE_SIZE;
  private int MINES;

public Board(int diff) {
  if(diff == 0){
    SQUARE_SIZE = 150;
    mineMap = new Tile[4][4];
  }
  else if(diff == 1){
    SQUARE_SIZE = 100;
    mineMap = new Tile[8][8];
  }
  else if(diff == 2){
    SQUARE_SIZE = 50;
    mineMap = new Tile[16][16];
  }
for(int x = 0; x < mineMap.length; x ++){
  for(int y = 0; y < mineMap[x].length; y++){
      mineMap[x][y] = new Tile();
      if (mineMap[x][y].hasMine()) {
          MINES ++;
      }
    }
  }
  numSet();
}

public int getMineNum(){
  return MINES;
}


  public void numSet(){
    for(int row = 0; row <  mineMap.length; row++){
      for(int col = 0; col< mineMap[row].length; col++){
       if(!mineMap[row][col].hasMine()){
         mineMap[row][col].setNeighbors(surroundingMines(row, col));
       }
       else mineMap[row][col].setNeighbors(-1);
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
    if(row == 0 && col == mineMap[col].length -1){//bottom left corner
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
    if(row == 0){//top edge
      if(mineMap[row][col+1].hasMine())neighbors++;
      if(mineMap[row][col-1].hasMine())neighbors++;
      if(mineMap[row+1][col+1].hasMine())neighbors++;
      if(mineMap[row+1][col-1].hasMine())neighbors++;
      if(mineMap[row+1][col].hasMine())neighbors++;
      return neighbors;
    }
    if(col == 0){//left edge
      if(mineMap[row][col+1].hasMine())neighbors++;
      if(mineMap[row+1][col].hasMine())neighbors++;
      if(mineMap[row-1][col].hasMine())neighbors++;
      if(mineMap[row+1][col+1].hasMine())neighbors++;
      if(mineMap[row-1][col+1].hasMine())neighbors++;
      return neighbors;
    }
    if(row == mineMap.length-1){//bottom edge
      if(mineMap[row][col+1].hasMine())neighbors++;
      if(mineMap[row][col-1].hasMine())neighbors++;
      if(mineMap[row-1][col+1].hasMine())neighbors++;
      if(mineMap[row-1][col-1].hasMine())neighbors++;
      if(mineMap[row-1][col].hasMine())neighbors++;
      return neighbors;
    }
    if(col == mineMap[row].length-1){//right edge
      if(mineMap[row+1][col].hasMine())neighbors++;
      if(mineMap[row-1][col].hasMine())neighbors++;
      if(mineMap[row+1][col-1].hasMine())neighbors++;
      if(mineMap[row-1][col-1].hasMine())neighbors++;
      if(mineMap[row][col-1].hasMine())neighbors++;
      return neighbors;
    }
    for(int i = -1; i <=1; i ++){
      for(int j = -1; j <= 1; j++){
        if(mineMap[row+i][col+j].hasMine())neighbors++;
      }
    }
    return neighbors;
  }

  public Tile getTile(int row, int col){
    return mineMap[row][col];
  }



  public int lengthRow(){
    return mineMap.length;
  }

  public int lengthCol(){
    return mineMap[0].length;
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
