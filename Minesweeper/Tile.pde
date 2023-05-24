public class Tile{
  private boolean HIDDEN; 
  private boolean MINE; 
  private boolean FLAG; 
  private int SURROUND;
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
  
  public boolean getHidden(){
    return HIDDEN;
  }
  

  
}
