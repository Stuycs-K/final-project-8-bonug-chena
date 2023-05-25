
//private Board board;
import java.util.Arrays;

private Tile[][] mineMap;
private boolean END;
static final int SQUARE_SIZE = 100;

void setup(){
  size(800,800);
  Board();
}

  //grid();
  //mineMaker();


//  public void mineMaker(){
//    for (int i = 0; i < width; i ++){
//      for (int j = 0; j < height; j++){
//        int random = (int) Math.random();
//        if (random <= .3){

//        }
//  }

public String test(){
  String ans = "";
  boolean[][] map = new boolean[mineMap.length][mineMap.length];
  for (int i = 0; i < mineMap.length; i++){
    for (int j = 0; j < mineMap[i].length; j ++){
        map[i][j] = mineMap[i][j].hasMine();
    }
    ans += Arrays.toString(map[i]) + " ";
    System.out.println(Arrays.toString(map[i]));
  }
  return ans;
}

  public void Board() {
  END = false;
  mineMap = new Tile[width/SQUARE_SIZE][height/SQUARE_SIZE];
  for(int x = 0; x < mineMap.length; x ++){
    for(int y = 0; y < mineMap[x].length; y++){
        mineMap[x][y] = new Tile();



void setup(){
  size(800,800);
  Board();
  //grid();
  //mineMaker();
}

<<<<<<< HEAD

  
void keyPressed(){
  Board();
  grid();
}
=======
//  public void mineMaker(){
//    for (int i = 0; i < width; i ++){
//      for (int j = 0; j < height; j++){
//        int random = (int) Math.random();
//        if (random <= .3){  

//        }
//  }
>>>>>>> f91a443 (fixed merge conflicts)


void draw(){
  grid();
}


void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  //if (END == true){
  //  Board();
  //  grid();
  //}
  mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].HIDDEN = false;
  //redraw();
  if (mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].MINE == true){
    END = true;
    end();
    noLoop();
  }
  redraw();
}

public void makeSquare(int x, int y, int col){
  fill(col);
  stroke(0);
  square(x, y, SQUARE_SIZE);
}
  
public void grid(){
  for(int x = 0; x < width; x += SQUARE_SIZE){
    for(int y = 0; y < height; y+= SQUARE_SIZE){
      int col = 250;
      if (mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].hasMine()){
        col = 100;
      }
      if (!mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].getHidden()){
        col = 175;
      }
        makeSquare(x,y,col);
    }
  }
}

public void end(){
  //END = true;
  fill(225);
  stroke(0);
  square(0, 0, width);
  textSize(128);
  fill(0, 0, 0);
  END = false;
  text("Game over.", 100, 360);
}

  
void grid() {
  for(int x = 0; x < width; x += SQUARE_SIZE) {
    for(int y = 0; y < height; y += SQUARE_SIZE) {
      fill(250);
      stroke(0);
      square(x,y,SQUARE_SIZE);
    }
  }
}
