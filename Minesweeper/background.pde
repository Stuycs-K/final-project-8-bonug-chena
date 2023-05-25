public class background{
  private int [][] mineMap;
  private static final int MINE = 0;
  private static final int EMPTY = 1;
 
  
  public void numberCalculator(){
    for(int row = 0; row < mineMap.length; row++){
      for(int col = 0; col < mineMap[row].length; col++){
        if(mineMap[row][col] == EMPTY){
          if(row == 0 && col == 0){// top left corner
          
          }
          if(row == 0 && col == mineMap[row].length-1) //bottom left corner
          if(row == mineMap.length-1 && col == 0) // top right corner
          if(row == mineMap.length-1 && col == mineMap[row].length-1) //bottom right corner
          
        }
      }
  }
  
  
}
