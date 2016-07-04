module Game.Board where

import Data.Matrix (matrix, setElem, (!))
import Game.Constants

newBoard :: Int -> Int -> Board
newBoard numRows numCols = customBoard numRows numRows $ const Empty

customBoard :: Int -> Int -> ((Int,Int) -> Square) -> Board
customBoard = matrix

insert :: Player -> Position -> Board -> Board
insert player = setElem (Filled player)

remove :: Position -> Board -> Board
remove = setElem Empty

get :: Position -> Board -> Square
get position board = board ! position
