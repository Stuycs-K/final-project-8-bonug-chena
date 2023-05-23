public class Board{
  private Tile[][] mineMap;
  static final int SQUARE_SIZE = 20;
  
  //public Board() {
  //mineMap = new Tile[width/SQUARE_SIZE][height/SQUARE_SIZE];
  //for(int x = 0; x < 39; x += SQUARE_SIZE){
  //  for(int y = 0; y < 39; y+= SQUARE_SIZE){
  //      mineMap[x][y] = new Tile();
  //    }
  //  }
  //}
  
  
    public void numberCalculator(int[][] map, int row, int col){
        if(map[row][col] == EMPTY){
          if(row == 0 && col == 0){// top left corner
            
          }
        }
          if(row == 0 && col == map[row].length-1) //bottom left corner
          if(row == map.length-1 && col == 0) // top right corner
          if(row == map.length-1 && col == map[row].length-1) //bottom right corner
          
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
