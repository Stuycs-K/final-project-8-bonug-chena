import java.util.Arrays;
private Board mineMap;
private boolean END;
static final int SQUARE_SIZE = 100;
boolean NEWMAP = false;
boolean FLAGPRESSED;
boolean DEFLAG;
PImage img;
PImage img2;


void setup() {
  size(950, 800);
  Board();
  grid();
  img = loadImage("flag.png");
  img2 = loadImage("flagOn.png");
}

  public void Board() {
    END = false;
    mineMap = new Board();
  }

  int corner(int x) {
  return x/SQUARE_SIZE * SQUARE_SIZE;
}

void draw() {
  flagButton();
  newGameButton();
  deflagButton();
  if (NEWMAP) {
    Board();
    grid();
  }
}

void placeFlag(int x, int y) {
  //image(img, corner(x) +1, corner(y)+1, SQUARE_SIZE-1, SQUARE_SIZE-1);
  stroke(0);
  fill(0);
  rect(corner(x)+25, corner(y)+75, 50, 10);
  rect(corner(x)+45, corner(y)+55, 10, 25);
  stroke(225, 0, 0);
  fill(225, 0, 0);
  rect(corner(x)+45, corner(y)+20, 10, 35);
  stroke(255, 49, 49);
  fill(255, 49, 49);
  triangle(corner(x)+45, corner(y)+20, corner(x)+10, corner(y)+37.5, corner(x)+45, corner(y)+55);
  //text(""+mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).FLAG,x,y);
  //System.out.println(""+ mineMap.getTile(x/SQUARE_SIZE,y/SQUARE_SIZE).hasFlag());
}


public void deflag(int x, int y){
   makeSquare(corner(x), corner(y), 250);
   mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).setFlag(false);
}

void keyPressed(){ 
  //for demo purposes, delete later - reveals where all the bombs are
  for (int x = 0; x < 800; x += SQUARE_SIZE) {
    for (int y = 0; y <800; y+= SQUARE_SIZE) {
       if (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasMine()) {
          makeSquare(corner(x), corner(y), 100); 
       }
    }
  }
}

public void deflagButton(){
  makeSquare(825, 250, 0);
  textSize(22);
  fill(0, 0, 0);
  if(DEFLAG){
    image(img2, 826,251,SQUARE_SIZE-1, SQUARE_SIZE-1);
  } 
  else {
    image(img, 826,251,SQUARE_SIZE-1, SQUARE_SIZE-1);
  }
  textSize(130);
  text("X", 840, 340);
  textSize(22);
  text("Deflag", 825, 370);
  
}



void mouseClicked() {
  int x = mouseX;
  int y = mouseY;
  if (x<925 && x>825 && y >20 && y <70) {
    NEWMAP= true;
  }
  if (x<925 && x > 825 && y > 100 && y < 200) {
    FLAGPRESSED = !FLAGPRESSED;
    flagButton();
    
    
    if(FLAGPRESSED){
      flagButton();
    //  image(img2, 826,101,SQUARE_SIZE-1, SQUARE_SIZE-1);
    //} 
    //else {
    //  image(img, 826,101,SQUARE_SIZE-1, SQUARE_SIZE-1);
    }
    
    //System.out.println(FLAGPRESSED); //remove later
  }
  if (x < 925 && x > 825 && y > 250 && y < 350){
    DEFLAG = !DEFLAG;
  }
  if (x < 800 && END == false) {

    //place flag
    if (FLAGPRESSED &&  mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).getHidden() && !mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).hasFlag()) {
      mineMap.getTile(x/SQUARE_SIZE,y/SQUARE_SIZE).setFlag(true);
      placeFlag(x, y);
    }
    
    
    //else if(FLAGPRESSED && /*mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).getHidden() && */mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).hasFlag()){
    //  mineMap.getTile(x/SQUARE_SIZE,y/SQUARE_SIZE).setFlag(false);
    //  int col = 250;
    //  if(mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).hasMine())col = 100;
    //  makeSquare(corner(x), corner(y), col); // must check where this is going wrong, only goes in a diagonal line from top to bottom
    //}
    

    //deflag
    if (DEFLAG) {
        deflag(x,y);
    }


    //reveal number
    if (!FLAGPRESSED) {
      if (!mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).hasFlag()){
        if( (mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).getNeighbors()) == 0){
          int row = y/SQUARE_SIZE;
          int col = x/SQUARE_SIZE;
          dig(row, col, x, y);
          
       /*
          if(mineMap.getTile(row-1, col).getHidden() && !mineMap.getTile(row-1, col).hasMine()) dig(row-1, col, x, y  -SQUARE_SIZE);
          if(mineMap.getTile(row+1, col).getHidden() && !mineMap.getTile(row+1, col).hasMine()) dig(row+1, col, x , y+ SQUARE_SIZE);
          if(mineMap.getTile(row, col+1).getHidden() && !mineMap.getTile(row, col+1).hasMine())  dig(row, col+1, x+SQUARE_SIZE, y);
          if(mineMap.getTile(row, col-1).getHidden() && !mineMap.getTile(row, col-1).hasMine()) dig(row, col-1, x- SQUARE_SIZE, y );*/
          
        }
        else {
          mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).HIDDEN = false;
          text((mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors()), corner(x) + 45, corner(y)+55);
        }
        
      }
    }

    //press on mine
    if (mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).MINE && !FLAGPRESSED && !mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).FLAG) {
      end();
    }

  }
}

//first check if its zero
//if its zero, then go to all surrounding squares
//if its not zero, stop there

public void dig(int row, int col, int x, int y){ 
  mineMap.getTile(row, col).HIDDEN = false;
  text((mineMap.getTile(row, col).getNeighbors()), corner(x) + 45, corner(y)+55);
  if(mineMap.getTile(row, col).getNeighbors()==0 && row> 0 && row  < mineMap.lengthRow()-1 && col > 0 && col < mineMap.lengthCol()-1){
    if(mineMap.getTile(row-1, col).getHidden() && !mineMap.getTile(row-1, col).hasMine()) dig(row-1, col, x, y  -SQUARE_SIZE);
          if(mineMap.getTile(row+1, col).getHidden() && !mineMap.getTile(row+1, col).hasMine()) dig(row+1, col, x , y+ SQUARE_SIZE);
          if(mineMap.getTile(row, col+1).getHidden() && !mineMap.getTile(row, col+1).hasMine())  dig(row, col+1, x+SQUARE_SIZE, y);
          if(mineMap.getTile(row, col-1).getHidden() && !mineMap.getTile(row, col-1).hasMine()) dig(row, col-1, x- SQUARE_SIZE, y );
  }
  //println("row: " + row + "    col: " + col + "        x: " + x + "    y: " + y);
  if(row> 0 && row  < mineMap.lengthRow()-1 && col > 0 && col < mineMap.lengthCol()-1){
      if(mineMap.getTile(row-1, col).getNeighbors() == 0 && mineMap.getTile(row-1, col).getHidden()){
    dig(row-1, col, x, y  -SQUARE_SIZE);
  }
  
  if(mineMap.getTile(row+1, col).getNeighbors() == 0 && mineMap.getTile(row+1, col).getHidden()){
    dig(row+1, col, x , y+ SQUARE_SIZE);
  }
  if(mineMap.getTile(row, col+1).getNeighbors() == 0 && mineMap.getTile(row, col+1).getHidden()){
    dig(row, col+1, x+SQUARE_SIZE, y);
  }
  if(mineMap.getTile(row, col-1).getNeighbors() == 0 && mineMap.getTile(row, col-1).getHidden()){
    dig(row, col-1, x- SQUARE_SIZE, y );
  }
  
  if(mineMap.getTile(row-1, col-1).getNeighbors() == 0 && mineMap.getTile(row-1, col-1).getHidden()){
    dig(row-1, col-1, x -SQUARE_SIZE, y- SQUARE_SIZE);
  }
  
  if(mineMap.getTile(row-1, col+1).getNeighbors() == 0){
    dig(row-1, col +1, x - SQUARE_SIZE, y+ SQUARE_SIZE);
  }
  
  if(mineMap.getTile(row+1, col+1).getNeighbors() == 0 && mineMap.getTile(row+1, col+1).getHidden()){
    dig(row+1, col+1, x +SQUARE_SIZE, y + SQUARE_SIZE);
  }
  if(mineMap.getTile(row+1, col-1).getNeighbors() == 0 && mineMap.getTile(row+1, col-1).getHidden()){
    dig(row+1, col-1, x +SQUARE_SIZE, y-SQUARE_SIZE);
  }
  
  }
}

public void makeSquare(int x, int y, int col){
  fill(col);
  stroke(0);
  square(x, y, SQUARE_SIZE);
}

public void grid() {
  NEWMAP = false;
  END = false;
  for (int x = 0; x < width-150; x += SQUARE_SIZE) {
    for (int y = 0; y < height; y+= SQUARE_SIZE) {
      int col = 250;
      makeSquare(x, y, col);
      if (!mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getHidden()){
        col = 175;
        text((mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors()), x+50, y+50);
         /// this changes it to what u press on and its not hidden. must reveal the number here!!!!
      }
        makeSquare(x,y,col);
      fill(0);
    }
  }
}

void flagButton(){
  makeSquare(825, 100, 60);
  textSize(22);
  fill(100, 100, 100);
  text("Flag placer", 825, 220);
  if(FLAGPRESSED){
    image(img2, 826,101,SQUARE_SIZE-1, SQUARE_SIZE-1);
  } 
  else {
    image(img, 826,101,SQUARE_SIZE-1, SQUARE_SIZE-1);
  }
}




public void newGameButton() {
  fill(255);
  rect(825, 20, 100, 50);
  fill(0);
  textSize(20);
  text("New Game", 830, 50);
}


public void end(){
  END = true;
  fill(225);
  stroke(0);
  square(0, 0, width);
  textSize(100);
  fill(0, 0, 0);
  text("Game over.", 100, 260);
  text("Goodbye. Press", 100, 360);
  text("\"New Game\"", 100, 460);
  text("to play again.", 100, 560);
}


/*
if a tile has a flag already, u cant press and reveal number
if a tile is a mine and has a flag, u cant press on it and die
add method to unflag a tile
*/
