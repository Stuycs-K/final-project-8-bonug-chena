import java.util.Arrays;
private Board map;
private boolean END;
static final int SQUARE_SIZE = 100;

void setup(){
  size(800,800);
  //Board.Board();
}

 

void draw(){
  grid();
}

void keyPressed(){
  //Board();
  grid();
}

void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  if (END == true){
    map = new Board();
    grid();
  }
  map.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).HIDDEN = false;
  redraw();
  if (map.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).MINE == true){
    END = true;
    end();
    noLoop();
  }
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
      if ((map.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE)).hasMine()){
        col = 100;
      }
      if (!((map.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE)).getHidden())){
        col = 175;
      }
        makeSquare(x,y,col);
    }
  }
}


//public String test(){
//  String ans = "";
//  boolean[][] map = new boolean[mineMap.length][mineMap.length];
//  for (int i = 0; i < mineMap.length; i++){
//    for (int j = 0; j < mineMap[i].length; j ++){
//        map[i][j] = mineMap[i][j].getMine();
//    }
//    ans += Arrays.toString(map[i]) + " ";
//    System.out.println(Arrays.toString(map[i]));
//  }
//  return ans;
//}

public String end(){
  //END = true;
  fill(225);
  stroke(0);
  square(0, 0, width);
  textSize(128);
  fill(0, 0, 0);
  text("Game over.", 100, 360);
  return "Game over";
}
