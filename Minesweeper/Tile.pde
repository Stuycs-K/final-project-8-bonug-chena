public class Tile{
  private boolean HIDDEN;
  private boolean MINE;
  private boolean FLAG;
  private int NEIGHBORS ;

  public Tile(){
    FLAG = false;
    HIDDEN = true;
    double random = Math.random();
    if (random < .3){
      MINE = true;
    }
    else {
      MINE = false;
    }
  }

  public boolean hasMine(){
    return this.MINE;
  }

  public void setNeighbors(int neighbors){
    NEIGHBORS = neighbors;
  }


  public void setFlag(boolean flag){
    FLAG = flag;
  }

  public boolean hasFlag(){
    return FLAG;
  }

  public int getNeighbors(){
    return  NEIGHBORS;
  }

  public boolean getHidden(){
    return HIDDEN;
  }



}
