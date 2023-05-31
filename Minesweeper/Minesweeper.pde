import java.util.Arrays;
private Board mineMap;
private boolean END;
static final int SQUARE_SIZE = 100;
boolean NEWMAP = false;
boolean FLAGPRESSED;
PImage img;


void setup() {
  size(950, 800);
  Board();
  grid();
  img = loadImage("flag.png");
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
  if (NEWMAP) {
    Board();
    grid();
  }
}

void placeFlag(int x, int y) {
  if (!mineMap.getTile(y/SQUARE_SIZE, X/SQUARE_SIZE).hasFlag()) {
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
    //mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).setFlag(true);
    //System.out.println(""+ mineMap.getTile(X/SQUARE_SIZE,Y/SQUARE_SIZE).hasFlag());
    //text(""+mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasFlag(), x, y);
    //System.out.println(""+ mineMap.getTile(mouseX/SQUARE_SIZE, mouseY/SQUARE_SIZE).hasFlag());
  } else {
    //mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).setFlag(false);
    makeSquare(corner(x), corner(y), 225);
    //System.out.println(""+ mineMap.getTile(X/SQUARE_SIZE,Y/SQUARE_SIZE).hasFlag());
    //System.out.println(""+ mineMap.getTile(mouseX/SQUARE_SIZE, mouseY/SQUARE_SIZE).hasFlag());
    //text(""+mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasFlag(), x, y);
  }
  if (!mineMap.getTile(y/SQUARE_SIZE, X/SQUARE_SIZE).hasFlag()){
    mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).setFlag(true);
  }
  else {
    mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).setFlag(false);
  }
  //mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).setFlag(!mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasFlag());

  text(""+mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).FLAG,x,y);
  System.out.println(""+ mineMap.getTile(mouseX/SQUARE_SIZE, mouseY/SQUARE_SIZE).hasFlag());
}


//void keyPressed(){
//  Board();
//  grid();
//}



void mouseClicked() {
  int x = mouseX;
  int y = mouseY;
  if (x<925 && x>825 && y >20 && y <70) {
    NEWMAP= true;
  }
  if (x<925 && x > 825 && y > 100 && y < 200) {
    FLAGPRESSED = !FLAGPRESSED;
    System.out.println(FLAGPRESSED); //remove later
  }
  if (x < 800 && END == false) {

    //place flag
    if (FLAGPRESSED && mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getHidden()) {
      //mineMap.getTile(x/SQUARE_SIZE,y/SQUARE_SIZE).setFlag(true);
      placeFlag(x, y);
    }

    //reveal number
    if (!FLAGPRESSED) {
      if (!mineMap.getTile(Y/SQUARE_SIZE, X/SQUARE_SIZE).hasFlag()) {
        mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).HIDDEN = false;
        text((mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors()), corner(x) + 45, corner(y)+55);
      }
    }

    //press on mine
    if (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).MINE && !FLAGPRESSED && !mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).FLAG) {
      end();
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
  for (int x = 0; x < 800; x += SQUARE_SIZE) {
    for (int y = 0; y <800; y+= SQUARE_SIZE) {
      int col = 250;
      makeSquare(x, y, col);
      //if (mineMap.getTile(y/SQUARE_SIZE,x/SQUARE_SIZE).FLAG) {
      //  placeFlag(y, x);
      //}
      if (mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).hasMine()) {
        col = 100; // delete this part later
      }
      if (!mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getHidden()) {
        col = 175;
        text((mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors()), x+50, y+50);
        /// this changes it to what u press on and its not hidden. must reveal the number here!!!!
      }
      makeSquare(x, y, col);
      fill(0);
      //text((mineMap.getTile(y/SQUARE_SIZE, x/SQUARE_SIZE).getNeighbors()), x+50, y+50);
    }
  }
}

void flagButton() {
  makeSquare(825, 100, 0);
  image(img, 826, 101, SQUARE_SIZE-1, SQUARE_SIZE-1);
  textSize(22);
  fill(0, 0, 0);
  text("Flag placer", 825, 220);
}


public void newGameButton() {
  fill(255);
  rect(825, 20, 100, 50);
  fill(0);
  textSize(20);
  text("New Game", 830, 50);
}


public void end() {
  END = true;
  fill(225);
  stroke(0);
  square(0, 0, width);
  textSize(100);
  fill(0, 0, 0);
  text("Game over.", 100, 360);
  text("Goodbye. Press", 100, 460);
  text("\"New Game\"", 100, 560);
  text("to play again.", 100, 660);
}


/*
if a tile has a flag already, u cant press and reveal number
 if a tile is a mine and has a flag, u cant press on it and die
 add method to unflag a tile
 */
