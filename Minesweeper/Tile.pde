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
    return this.MINE;
  }

  public void setNeighbors(int neighbors){
    NEIGHBORS = neighbors;
  }


  public void setFlag(boolean flag){
    FLAG = flag;
  }

  public boolean hasFlag(){
    return this.FLAG;
  }

  public int getNeighbors(){
    return  NEIGHBORS;
  }

  public boolean getHidden(){
    return HIDDEN;
  }



}
