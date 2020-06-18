# purescript-loopover

A PureScript library for Loopover.

## Functions

`newSquareGame` - `Int -> GameState`
Takes an Integer for a side length and then returns a GameState with the solved position for the board state.

`cycleRow` - `GameState -> Int -> Boolean -> GameState`
Takes a GameState, row number, and boolean (determining which direction) and returns a new GameState. If the row number is out of bounds, it returns the same GameState.

`cycleCol` - `GameState -> Int -> Boolean -> GameState`
Similar to `cycleRow`, it takes a GameState, column number, and boolean (determining which direction) and returns a new GameState. If the column number is out of bounds, it returns the same GameState.

`displayGameState` - `GameState -> String`
Takes a GameState and turns it into a string.