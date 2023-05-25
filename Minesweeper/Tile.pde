public class Tile{
  private boolean HIDDEN;
  private boolean MINE;
  private boolean FLAG;
  private int NEIGHBORS;
  //public static final int MINE = 1;
  //private static final int FLAG = 2;
  //private static final int NUMBER = 3;
  public Tile tile;

  public Tile(){
    double random = Math.random();
    if (random < .3){
      MINE = true;
    }
    else {
      MINE = false;
    }
    FLAG = false;
    HIDDEN = true;

  }

  public boolean hasMine(){
    return MINE;
  }


  public void setNeighbors(int neighbors){
  NEIGHBORS = neighbors;
  }

  public boolean getHidden(){
    return HIDDEN;
  }
  


}