public class Tile{
  private boolean HIDDEN; 
  private boolean MINE = false; 
  private boolean FLAG; 
  private int SURROUND;
  public Tile tile;
  
  public Tile(){
    double random = Math.random();
    if (random < .3){
      MINE = true;
    }
    FLAG = false;
    HIDDEN = true;
  }
  
  public boolean getMine(){
    return MINE;
  }
  
  public boolean getHidden(){
    return HIDDEN;
  }
  
}
