import java.util.Arrays;
private Board mineMap;
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
  /*mineMap = new Tile[width/SQUARE_SIZE][height/SQUARE_SIZE];
  for(int x = 0; x < mineMap.length; x ++){
    for(int y = 0; y < mineMap[x].length; y++){
        mineMap[x][y] = new Tile();
      }
    }
    */
    mineMap = new Board();
  }
  
  void placeFlag(int x, int y){
      image(img, x+1, y +1, SQUARE_SIZE-1, SQUARE_SIZE-1);
  }

void draw(){
  grid();
  flagButton();
}

//void keyPressed(){
//  Board();
//  grid();
//}



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
  mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).HIDDEN = false;
  redraw();
  if (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).MINE == true){
  //if (FLAGPRESSED){
  //  placeFlag(x,y);
  //}
    END = true;
    end();
    //noLoop();
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
  END = false;
  for(int x = 0; x < width-150; x += SQUARE_SIZE){
    for(int y = 0; y < height; y+= SQUARE_SIZE){
      int col = 250;
      if (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasMine()){
        col = 100;
      }
      if (!mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getHidden()){
        col = 0; /// this changes it to what u press on and its not hidden. must reveal the number here!!!!
      }
        makeSquare(x,y,col);
        fill(0);
        text((mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE ).getNeighbors()), x+50, y+50);
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
