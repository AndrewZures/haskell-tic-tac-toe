module Game.Board where

import Game.Rules
import Data.Matrix

type Board = Matrix Square
type Position = (Int, Int)

newBoard :: Int -> Int -> Board
newBoard numRows numCols = matrix numRows numRows $ const Empty

insert :: Player -> Position -> Board -> Board
insert player = setElem (Filled player)

remove :: Position -> Board -> Board
remove = setElem Empty

get :: Position -> Board -> Square
get position board = board ! position
