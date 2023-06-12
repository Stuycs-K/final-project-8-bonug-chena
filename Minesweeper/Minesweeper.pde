import java.util.Arrays;
private Board mineMap;
private boolean END;
static  int SQUARE_SIZE;
private int diff;
boolean NEWMAP = false;
boolean FLAGPRESSED;
boolean DEFLAG;
PImage img;
PImage img2;
private int boardMines;
private int mineCounter = 0;
private int totalMines = 0; //also counts incorrectly placed mines
private int MINESLEFT;

void setup() {
  diff = 1;
  SQUARE_SIZE =100;
  size(950, 800);
  Board();
  grid();
  textSize(22);
  minesLeft();
  img = loadImage("flag.png");
  img2 = loadImage("flagOn.png");
}

public void Board() {
  END = false;
  mineMap = new Board(diff);
  if (diff == 0) {
    SQUARE_SIZE = 200;
  }
  if (diff == 1) {
    SQUARE_SIZE = 100;
  }
  if (diff ==2) {
    SQUARE_SIZE = 50;
  }
  boardMines = mineMap.getMineNum();
  MINESLEFT = boardMines;
  mineCounter = 0;
  totalMines = 0;
  textSize(22);
  minesLeft();
}

int corner(int x) {
  return x/SQUARE_SIZE * SQUARE_SIZE;
}

void draw() {
  textSize(22);
  minesLeft();
  flagButton();
  newGameButton();
  deflagButton();
  difficultyButton();
  if (NEWMAP) {
    Board();
    grid();
  }
}

void keyPressed() {
  //diff ++;
  //if (diff == 3){
  //  diff = 0;
  //}
  //NEWMAP = true;
  //for demo purposes, delete later - reveals where all the bombs are
  for (int x = 0; x < 800; x += SQUARE_SIZE) {
    for (int y = 0; y <800; y+= SQUARE_SIZE) {
      if (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasMine()) {
        makeSquare(corner(x), corner(y), 100);
      }
    }
  }
}

void difficultyButton() {
  stroke(225);
  fill(250);
  rect(825, 400, 100, 50);
  fill(0);
  text("Difficulty:", 830, 420);
  if (diff == 0) {
    text("Easy", 830, 440);
  }
  if (diff == 1) {
    text("Medium", 830, 440);
  }
  if (diff ==2) {
    text("Hard", 830, 440);
  }
}


void placeFlag(int x, int y) {
  //image(img, corner(x) +1, corner(y)+1, SQUARE_SIZE-1, SQUARE_SIZE-1);
  stroke(0);
  fill(0);
  rect(corner(x)+ SQUARE_SIZE /4, corner(y)  + (3* SQUARE_SIZE)/4, SQUARE_SIZE/2, SQUARE_SIZE/10);
  rect(corner(x)+SQUARE_SIZE*.45, corner(y) +SQUARE_SIZE*.55, SQUARE_SIZE/10, SQUARE_SIZE/4);
  stroke(225, 0, 0);
  fill(225, 0, 0);
  rect(corner(x)+SQUARE_SIZE*.45, corner(y)+SQUARE_SIZE/5, SQUARE_SIZE/10, SQUARE_SIZE *.35);
  stroke(255, 49, 49);
  fill(255, 49, 49);
  triangle(corner(x)+SQUARE_SIZE *.45, corner(y)+SQUARE_SIZE/5, corner(x)+SQUARE_SIZE/10, corner(y)+ SQUARE_SIZE*.375, corner(x)+SQUARE_SIZE*.45, corner(y)+ SQUARE_SIZE*.55);
  minesLeft();
  //text(""+mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).FLAG,x,y);
  //System.out.println(""+ mineMap.getTile(x/SQUARE_SIZE,y/SQUARE_SIZE).hasFlag());
}


public void deflag(int x, int y) {
  makeSquare(corner(x), corner(y), 250);
  mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).setFlag(false);
  minesLeft();
}


public void deflagButton() {
  //makeSquare(825, 250, 0);
  stroke(0);
  textSize(22);
  //fill(0, 0, 0);
  //makeSquare(825, 250, 60);
  if (DEFLAG) {
    image(img2, 826, 251, 100-1, 100-1);
  } else {
    image(img, 826, 251, 100-1, 100-1);
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


  if (x<925 && x>825 && y > 400 && y < 450) {
    diff++;
    if (diff> 2) diff = 0;
    NEWMAP = true;
  }
  //pressing flag button
  if (x<925 && x > 825 && y > 100 && y < 200) {
    FLAGPRESSED = !FLAGPRESSED;
    //flagButton();
    if (FLAGPRESSED) {
      flagButton();
    }
  }

  //pressing deflag button
  if (x < 925 && x > 825 && y > 250 && y < 350) {
    DEFLAG = !DEFLAG;
  }


  if (x < 800 && END == false) {

    //flag
    if (FLAGPRESSED && mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getHidden()) {
      //minesLeft();
      if (!mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasFlag()) { // if tile has no flag
        placeFlag(x, y);
        MINESLEFT --;
        if (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasMine() && !mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasFlag()) {
          mineCounter ++;
        }
        totalMines++;
      }
      mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).setFlag(true);
    }

    //deflag
    if (DEFLAG && mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasFlag()) {
      //minesLeft();
      deflag(x, y);
      totalMines --;
      MINESLEFT ++;
    }


    //reveal number
    if (!FLAGPRESSED && !DEFLAG) {
      if (!mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasFlag()) {
        if ( (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors()) == 0) {
          int row = y/SQUARE_SIZE;
          int col = x/SQUARE_SIZE;
          dig(row, col, x, y);
        } else {
          makeSquare(corner(x), corner(y), 220);
          mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).HIDDEN = false;
          if (diff == 1) {
            textSize(30);
          }
          if (diff == 0) {
            textSize(50);
          }
          if (diff == 2) {
            textSize(15);
          }
          int neigh = mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors();
          if (neigh == 1) {
            fill(0, 0, 225);
          }
          if (neigh == 2) {
            fill(0, 153, 0);
          }
          if (neigh == 3) {
            fill(255, 0, 0);
          }
          if (neigh == 4) {
            fill(0, 0, 102);
          }
          if (neigh == 5) {
            fill(102, 0, 0);
          }
          if (neigh >5) {
            fill(0);
          }
          text((mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors()), corner(x) + SQUARE_SIZE *.45, corner(y)+SQUARE_SIZE *.55);
        }
      }
    }

    //press on mine
    if (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).MINE && !FLAGPRESSED && !mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).FLAG && !DEFLAG) {
      end();
    }
    if (mineCounter == boardMines && totalMines == boardMines) {
      winner();
    }
  }
  minesLeft();
  System.out.println("boardmines: " + boardMines);
  System.out.println("counted mines: " + mineCounter);
  System.out.println("total mines: " + totalMines);
}

//first check if its zero
//if its zero, then go to all surrounding squares
//if its not zero, stop there


public void dig(int row, int col, int x, int y) {
  mineMap.getTile(row, col).HIDDEN = false;
  if (diff == 1) {
    textSize(30);
  }
  if (diff == 0) {
    textSize(50);
  }
  if (diff == 2) {
    textSize(15);
  }
  //text((mineMap.getTile(row, col).getNeighbors()), corner(x) + SQUARE_SIZE * .45, corner(y)+SQUARE_SIZE*.55);
  makeSquare(corner(x), corner(y), 220);
  if (mineMap.getTile(row, col).getNeighbors()!=0) {
    int neigh = mineMap.getTile(row, col).getNeighbors();
    //int col = 0;
    if (neigh == 1) {
            fill(0, 0, 225);
          }
          if (neigh == 2) {
            fill(0, 153, 0);
          }
          if (neigh == 3) {
            fill(255, 0, 0);
          }
          if (neigh == 4) {
            fill(0, 0, 102);
          }
          if (neigh == 5) {
            fill(102, 0, 0);
          }
          if (neigh >5) {
            fill(0);
          }
    text((mineMap.getTile(row, col).getNeighbors()), corner(x) + SQUARE_SIZE * .45, corner(y)+SQUARE_SIZE*.55);
  } else {
    if (row > 0 && col > 0) {
      if (mineMap.getTile(row-1, col-1).getHidden() && !mineMap.getTile(row-1, col-1).hasMine()) dig(row-1, col-1, x- SQUARE_SIZE, y - SQUARE_SIZE);
    }
    if (row > 0) {
      if (mineMap.getTile(row-1, col).getHidden() && !mineMap.getTile(row-1, col).hasMine()) dig(row-1, col, x, y  -SQUARE_SIZE);
    }
    if (row > 0 && col < mineMap.lengthRow()-1) {
      if (mineMap.getTile(row-1, col+1).getHidden() && !mineMap.getTile(row-1, col+1).hasMine()) dig(row-1, col+1, x+ SQUARE_SIZE, y - SQUARE_SIZE );
    }
    if (col > 0) {
      if (mineMap.getTile(row, col-1).getHidden() && !mineMap.getTile(row, col-1).hasMine()) dig(row, col-1, x- SQUARE_SIZE, y );
    }
    if (col < mineMap.lengthCol() -1) {
      if (mineMap.getTile(row, col+1).getHidden() && !mineMap.getTile(row, col+1).hasMine())  dig(row, col+1, x+SQUARE_SIZE, y);
    }
    if (row < mineMap.lengthRow() -1 && col > 0) {
      if (mineMap.getTile(row+1, col-1).getHidden() && !mineMap.getTile(row+1, col-1).hasMine()) dig(row+1, col -1, x - SQUARE_SIZE, y+ SQUARE_SIZE); // changed this
    }
    if (row < mineMap.lengthRow() -1) {
      if (mineMap.getTile(row+1, col).getHidden() && !mineMap.getTile(row+1, col).hasMine()) dig(row+1, col, x, y+ SQUARE_SIZE);
    }
    if (row < mineMap.lengthRow() -1 && col < mineMap.lengthCol() -1) {
      if (mineMap.getTile(row+1, col+1).getHidden() && !mineMap.getTile(row+1, col+1).hasMine()) dig(row+1, col+1, x+ SQUARE_SIZE, y +SQUARE_SIZE);
    }
  }
}



public void makeSquare(int x, int y, int col) {
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
      if (!mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getHidden()) {
        col = 175;
        text((mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors()), x+50, y+50);
        /// this changes it to what u press on and its not hidden. must reveal the number here!!!!
      }
      makeSquare(x, y, col);
      fill(0);
    }
  }
}

void flagButton() {
  //makeSquare(825, 100, 60);
  textSize(22);
  stroke(0);
  //makeSquare(825, 100, 60);
  //fill(100, 100, 100);
  text("Flag placer", 825, 220);
  if (FLAGPRESSED) {
    image(img2, 826, 101, 100-1, 100-1);
  } else {
    image(img, 826, 101, 100-1, 100-1);
  }
}

void minesLeft() {
  int col = 206;
  fill(col);
  stroke(col);
  rect(803, 750, 150, 50);
  fill(0);
  textSize(22);
  String mines = "Flags Left: " + MINESLEFT;
  text(mines, 810, 790);
}




public void newGameButton() {
  fill(255);
  stroke(225);
  rect(825, 20, 100, 50);
  fill(0);
  textSize(20);
  text("New Game", 830, 50);
}


public void end() {
  END = true;
  fill(206);
  stroke(0);
  square(0, 0, width-150);
  textSize(100);
  fill(0, 0, 0);
  text("Game over.", 100, 260);
  text("Goodbye. Press", 100, 360);
  text("\"New Game\"", 100, 460);
  text("to play again.", 100, 560);
  textSize(22);
  text("Mines Left: 0", 810, 790);
}

public void winner() {
  END = true;
  fill(206);
  stroke(0);
  square(0, 0, width);
  textSize(100);
  fill(0, 0, 0);
  text("Congrats, you ", 100, 360);
  text("found all mines!", 100, 460);
  textSize(22);
  text("Mines Left: 0", 810, 790);
}


/*
if a tile has a flag already, u cant press and reveal number
 if a tile is a mine and has a flag, u cant press on it and die
 add method to unflag a tile
 */
