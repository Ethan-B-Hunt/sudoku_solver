# Overview

This is a basic Sudoku solver designed to assist individuals who struggle with Sudoku puzzles. It provides a quick and effective way to solve Sudoku grids, helping users understand solutions step by step. 

The solver is implemented in Erlang and includes features like input validation, error handling for invalid grids, and a visually clean representation of solutions.

**Watch the demonstration**: [Erlang Sudoku Solver Video](https://youtu.be/umTn88J_hMM)


# Features

- **Input Validation**: Ensures the grid is a valid 9x9 matrix with numbers between 0 and 9.
- **Error Handling**: Displays helpful messages for invalid inputs or unsolvable grids.
- **Dot Representation**: Shows empty cells as dots for easy visualization.
- **Efficient Algorithm**: Solves puzzles using a recursive backtracking approach.
- **User-Friendly Output**: Displays the solved grid neatly formatted in the terminal.


# How to Run the Solver

1. cd sudoku_solver

2. erl 
   c(sudoku_solver).

3. **Run the Solver**  
   Create a Sudoku grid (replace `Grid` with your puzzle):
   ```erlang
   Grid = [
       [5, 3, 0, 0, 7, 0, 0, 0, 0],
       [6, 0, 0, 1, 9, 5, 0, 0, 0],
       [0, 9, 8, 0, 0, 0, 0, 6, 0],
       [8, 0, 0, 0, 6, 0, 0, 0, 3],
       [4, 0, 0, 8, 0, 3, 0, 0, 1],
       [7, 0, 0, 0, 2, 0, 0, 0, 6],
       [0, 6, 0, 0, 0, 0, 2, 8, 0],
       [0, 0, 0, 4, 1, 9, 0, 0, 5],
       [0, 0, 0, 0, 8, 0, 0, 7, 9]
   ].
   ```

4. sudoku_solver:solve(Grid).

# Useful Resources

- [Starting Out](https://learnyousomeerlang.com/starting-out)
- [Erlang Documentation](https://www.erlang.org/docs)
- [Erlang Tutorial](https://www.tutorialspoint.com/erlang/index.htm)
