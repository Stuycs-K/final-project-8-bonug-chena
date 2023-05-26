import java.util.Arrays;
private Tile[][] mineMap;
private boolean END;
static final int SQUARE_SIZE = 100;
boolean FLAGPRESSED;
PImage img;

void setup(){
  size(950 ,800);
  Board();
  img = loadImage("flag.png");
  //test();
}

  public void Board() {
  END = false;
  mineMap = new Tile[width/SQUARE_SIZE][height/SQUARE_SIZE];
  for(int x = 0; x < mineMap.length; x ++){
    for(int y = 0; y < mineMap[x].length; y++){
        mineMap[x][y] = new Tile();
      }
    }
  }
  
  void placeFlag(int x, int y){
      image(img, x+1, y +1, SQUARE_SIZE-1, SQUARE_SIZE-1);
  }

void draw(){
  grid();
  flagButton();
}

void keyPressed(){
  Board();
  grid();
}



void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  if (x<925 && x > 825 && y > 50 && y < 150){
    FLAGPRESSED = !FLAGPRESSED;
    System.out.println(FLAGPRESSED);
  }
  else if (x <= 800){
  if (END == true){
    Board();
    grid();
  }
  mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].HIDDEN = false;
  redraw();
  //if (FLAGPRESSED){
  //  placeFlag(x,y);
  //}
  if (mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].MINE == true){
    END = true;
    end();
    noLoop();
  }
  if (FLAGPRESSED){
    placeFlag(x,y);
  }
  }
}

public void makeSquare(int x, int y, int col){
  fill(col);
  stroke(0);
  square(x, y, SQUARE_SIZE);
}

public void grid(){
  for(int x = 0; x < width-150; x += SQUARE_SIZE){
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

void flagButton(){
  makeSquare(825, 50,0);
  image(img, 826,51,SQUARE_SIZE-1, SQUARE_SIZE-1);
  textSize(22);
  fill(0, 0, 0);
  text("Flag placer", 825, 170);
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
  text("Game over.", 175, 360);
  return "Game over";
}
