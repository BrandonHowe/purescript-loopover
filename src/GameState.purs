module GameState where

import Prelude

import Data.Array (cons, foldl, head, init, last, snoc, tail, updateAt, zip, (!!), (..))
import Data.Functor.Compose (Compose(..))
import Data.Maybe (Maybe, fromMaybe)
import Data.Newtype (unwrap)
import Data.Traversable (sequence)
import Data.Tuple (uncurry)

type GameState = Array (Array Int)

displayGameState :: GameState -> String
displayGameState state = foldl (\acc n -> acc <> "\n" <> n) "" ((\x -> foldl (\acc n -> acc <> "|" <> show n) "" x <> "|") <$> state)

newSquareGame :: Int -> GameState
newSquareGame sideLength = (\x -> (sideLength * x + 1)..(sideLength * (x+1))) <$> 0..(sideLength - 1)

cycleArr' :: forall a. Boolean -> Array a -> Array a
cycleArr' left arr = fromMaybe arr 
  if left == true
    then do
      tailArr <- tail arr
      headArr <- head arr
      pure $ snoc tailArr headArr
    else do
      lastArr <- last arr
      initArr <- init arr
      pure $ cons lastArr initArr

cycleRow :: GameState -> Int -> Boolean -> GameState
cycleRow arr row left = fromMaybe arr do
  let rowArr = arr !! row 
  cycled <- cycleArr' left <$> rowArr
  updateAt row cycled arr

genColumn :: GameState -> Int -> Maybe (Array Int)
genColumn state col = sequence $ (\x -> x !! col) <$> state

cycleCol :: GameState -> Int -> Boolean -> GameState
cycleCol arr row up = fromMaybe arr (join $ sequence <$> (unwrap $ (uncurry (\x y -> updateAt row y x) <$> Compose (zip arr <$> (cycleArr' up <$> genColumn arr row)))))