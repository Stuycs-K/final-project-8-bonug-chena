public class Tile{
  private boolean HIDDEN; 
  private boolean MINE = false; 
  private boolean FLAG; 
  private int SURROUND;
  //public static final int MINE = 1; 
  //private static final int FLAG = 2;
  //private static final int NUMBER = 3;
  public Tile tile;
  
  public Tile(){
    //tile = new Tile();
    int random = (int) Math.random();
    if (random < .3){
      MINE = true;
    }
    else {
      MINE = false;
    }
    FLAG = false;
    HIDDEN = true;
  }
  
  public boolean getMine(){
    return MINE;
  }
  
}
