public class Tile{
  private boolean HIDDEN; 
  private boolean MINE; 
  private boolean FLAG; 
  private int NEIGHBORS;
  
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
  

  public void setNeighbors(int neighbors){
  NEIGHBORS = neighbors;
  }
}
