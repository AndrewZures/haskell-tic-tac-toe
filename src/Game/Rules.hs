module Game.Rules where

import qualified Data.List as List

data Player = Player1 | Player2 deriving (Eq, Show)
data Square = Empty | Filled Player deriving (Eq, Show)

type Board = [[Square]]

winner :: Board -> Bool
winner board = or $ isWinner <$> [board, List.transpose board, diag board]

isWinner :: Board -> Bool
isWinner vectors = or $ fmap findWinner vectors

findWinner :: [Square] -> Bool
findWinner squares = head set /= Empty && length set == 1
  where set = List.nub squares

diag :: Board -> Board
diag board = [
  zipWith (!!) board [0..],
  zipWith (!!) board [(length board - 1),(length board - 2)..]
  ]
