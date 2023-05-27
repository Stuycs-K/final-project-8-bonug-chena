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
}

void draw(){
  Board();
  grid();
  flagButton();
  newGameButton();
  noLoop();
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
      //image(img, corner(x) +1, corner(y)+1, SQUARE_SIZE-1, SQUARE_SIZE-1);
      fill(0);
      rect(corner(x)+25,corner(y)+75, 50, 10);
      rect(corner(x)+45, corner(y)+55,10,25);
      stroke(225,0,0);
      fill(225,0,0);
      rect(corner(x)+45, corner(y)+20,10,35);
      stroke(255, 49, 49);
      fill(255, 49, 49);
      triangle(corner(x)+45, corner(y)+20, corner(x)+10, corner(y)+37.5, corner(x)+45, corner(y)+55);
      mineMap[x/SQUARE_SIZE][Y/SQUARE_SIZE].FLAG = true; 
  }
  
  int corner(int x){
    return x/SQUARE_SIZE * SQUARE_SIZE;
  }


//void keyPressed(){
//  Board();
//  grid();
//}


void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  if (x<925 && x>825 && y >20 && y <70){
    redraw();
  }
  if (x<925 && x > 825 && y > 100 && y < 200){
    FLAGPRESSED = !FLAGPRESSED;
    System.out.println(FLAGPRESSED);
  }
  else if (x <= 800){
  if (FLAGPRESSED){
    placeFlag(x,y);
    noLoop();
  }
  //mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].HIDDEN = false;
  //redraw();
  //if (mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].MINE == true && !FLAGPRESSED){
  //  END = true;
  //  end();
  //  noLoop();
  //}
  //if (END == true){
  //  end();
  //  Board();
  //  grid();
  //  END = false;
  //}
  }
}

  public void newGame(){
    Board();
    grid();
    flagButton();
    newGameButton();
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
       if (mineMap[y/SQUARE_SIZE][x/SQUARE_SIZE].FLAG){
        placeFlag(y,x);
      }
    }
  }
}

void flagButton(){
  makeSquare(825, 100,0);
  image(img, 826,101,SQUARE_SIZE-1, SQUARE_SIZE-1);
  fill(0);
  textSize(20);
  text("Place Flags", 825, 220);
}

public void newGameButton(){
  fill(255);
  rect(825,20,100,50);
  fill(0);
  textSize(20);
  text("New Game", 830, 50);
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
