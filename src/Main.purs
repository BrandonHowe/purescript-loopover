module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import GameState (cycleCol, newSquareGame, displayGameState)

main :: Effect Unit
main = do
  log "🍝"
  log $ "Generating new game state with side length 4"
  let newGame = newSquareGame 4
  let modifiedGame = cycleCol newGame 5 true
  log $ displayGameState modifiedGame
