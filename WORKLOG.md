# Work Log

## Giridhar Bonu

### May 22

worked on a method to check the surroundings on the map and assign a number to that based on how many mines are around.

### May 23

got edge cases for the countingMines

###May 24

finished writing the count method and helper. trying to merge

info

## May 25
merge conflicts resolved. started working on displaying the numbers and flags when a square is clicked.

## May 26
finished and merged the working number display onto the main branch. trying to change it so that numbers display only when dug

## may 30
working on a dig function that recursively opens up empty spaces. started by trying to repurpose alena's display of the numbers

## may 31
worked on dig function recursion but the cases don't work alll the time. tried troubleshooting and making it work properly

## June 1
worked on dig function again. created an easy way to tell when your flag is on and started messing with flag remover

# june 7
trying to toggle difficulty levels

# june 12
fixed the difficulty toggle and merge conflicts, wrote the readme, updated the uml and prototype. also added a hint feature

## Alena Chen

### May 22

CLASS: worked on mineMaker method that randomly creates a certain number of mines on the board.

HOME: added Tile class and created a board of random tiles, also worked on draw method that draws map on screen

### May 23

CLASS: worked more on draw/grid method that draws grid of map on the screen based on what the tile is

HOME: I got the draw/grid method to work! It now differentiates between a safe spot and a mine.

### May 24

CLASS: worked on mouseclicked method where if you click on a square, it changes color and if you click on a mine, the game ends.

HOME: added to mouseclicked method so that if you click on the screen again after you lose, a new map is shown

## May 25

CLASS: fixed a bunch of merge conflicts, tried to move some of the stuff in minesweeper to board so that board methods would work

HOME: added flag methods and flag button where when flag button is pressed and a tile is clicked, a flag is placed on the tile

## May 26
Helped Giridhar debug his code so that the correct number of surrounding mines appear. Fixed merge conflicts.

Got the flag methods to work for the most part and added a new game button

## May 30
CLASS: Fixed merge conflicts and merged the working code to main, made it so that number are revealed when tile is pressed and flag methods workish.

HOME: fixed bug where bottom row wasn't displaying the correct numbers, tried to add deflag method but does not work.

## May 31
Added deflag button and redid deflag since the original deflag was not working. Made a keypressed that reveals where are the mines are for the demo

## June 1
Worked on demo branch, tried to fix deflag methods

## June 5
made it so that if all the mines are properly flagged, a winner screen appears

## June 6
CLASS: added winner method where if you correctly place all the mines, you win the game.
HOME: tried to debug Giridhar's dig method but it still doesnt work

## June 7
trying to make it so that minecounter doesnt count incorrectly placed flags towards the winner method
fixed bugs with the winner method (made it so that deflagging an empty tile doesnt reveal a number, deflagging an empty space doesnt decrease the totalmine number, and so that you can't flag something that already has a flag)

## June 9
finally debugged Giridhar's dig method and got it to work i hope.
