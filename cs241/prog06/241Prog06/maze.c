#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define WALL '*'
#define OPEN ' '
#define BREAD '.'
#define PERSON 'X'

#define MAX_MAZE_SIZE 30

int size; // number of rows/cols in maze

void initializeMaze(char maze[][size]);
void outputMaze(char maze[][size]);
void getMazeSize();
bool findRoute(char maze[][size], int row, int col);

int main()
{

  getMazeSize();

  char maze[size][size]; // allocate memory to store the maze

  initializeMaze(maze); // read the maze configuration
                        // from standard input

  // you need to write a function
  // to find a route through the maze
  // then your program should display the
  // resulting maze with the route found
  // (or not found, as the case may be)

  if(findRoute(maze, 0, 0)){
    outputMaze(maze);
    exit(0);
  }else{
    outputMaze(maze);
    exit(2); // return the appropirate exit status
  }
}

void initializeMaze(char maze[][size])
{
  char nextChar;

  for (int row = 0; row < size; row++)
  {

    for (int col = 0; col < size; col++)
    {

      scanf("%c", &maze[row][col]);
    }
    scanf("%*c"); // read the newline char following the row
  }
}

void outputMaze(char maze[][size])
{
  printf("The maze is: \n");
  for (int row = 0; row < size; row++)
  {
    for (int col = 0; col < size; col++)

      printf("%c", maze[row][col]);

    printf("\n");
  }
  printf("\n");
}

// read in the number of rows/columns in the maze grid
// from the standard input
void getMazeSize()
{

  scanf("%d", &size);

  scanf("%*c"); // read the new line following the number

  if (size > MAX_MAZE_SIZE)
  {
    printf("That is an illegal grid size\n");
    exit(1);
  }
}

/*
  Function to try and find any possible way through the maze,
  tries one position and then recursively tries moving in every
  other possible location from that spot until it either
  returns false, no possible route, or true, it found a route.
*/
bool findRoute(char maze[][size], int row, int col){
  // base case
  if(row < 0 || col < 0 || row >= size || col >= size || maze[row][col] == WALL){
    return false;
  }

  // If they start us in our destination
  if(row == size - 1 && col == size - 1){
    maze[row][col] = PERSON;
    return true;
  }

  // cell has been visited already
  if(maze[row][col] == BREAD || maze[row][col] == PERSON){
    return false;
  }

  // add bread crumb to position we're visitng
  maze[row][col] = BREAD;

  // re-call the function in each direction until we find a valid one
  if( findRoute(maze, row-1, col) ||  // north
      findRoute(maze, row, col+1) ||  // east
      findRoute(maze, row+1, col) ||  // south
      findRoute(maze, row, col-1)){   // west
    maze[row][col] = PERSON;
    return true;
  }
  return false;
}
