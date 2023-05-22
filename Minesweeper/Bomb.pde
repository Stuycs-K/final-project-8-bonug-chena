public class Bomb{
  private int[][] mineMap;
  private static final int MINE = 0;
  
  
  public void  mineMaker(){
    for (int i = 0; i < mineMap.length; i ++){
      for (int j = 0; j < mineMap[i].length; j++){
        int ran = (int) Math.random();
        if (ran <= .3){
          mineMap[i][j] = MINE;
        }
      }
    }
  }
  
}
