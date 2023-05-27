public class Board{
  private Tile[][] mineMap;
  static final int SQUARE_SIZE = 100;

public Board() {
mineMap = new Tile[width/SQUARE_SIZE][height/SQUARE_SIZE];
for(int x = 0; x < mineMap.length; x ++){
  for(int y = 0; y < mineMap[x].length; y++){
      mineMap[x][y] = new Tile();
    }
  }
  numSet();
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
<<<<<<< HEAD
=======
        //if(j == 0 && i ==0){}
>>>>>>> 6c9f78a (the numbers are being displayed properly. it was just because of offset axis, not index)
        if(mineMap[row+i][col+j].hasMine())neighbors++;
      }
    }
    return neighbors;
  }

  public Tile getTile(int row, int col){
    return mineMap[row][col];
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
