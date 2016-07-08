module Game.Board where

import Data.Matrix (matrix, setElem, (!), ncols, nrows, unsafeGet)
import Game.Constants

newBoard :: Int -> Int -> Board
newBoard numRows numCols = customBoard numRows numRows $ const Empty

customBoard :: Int -> Int -> ((Int,Int) -> Square) -> Board
customBoard = matrix

openPositions :: Board -> [Position]
openPositions board = [(i,j) | i <- [1..nrows board],
                               j <- [1..ncols board],
                               unsafeGet i j board == Empty]

insert :: Player -> Position -> Board -> Board
insert player = setElem (Filled player)

remove :: Position -> Board -> Board
remove = setElem Empty

get :: Position -> Board -> Square
get position board = board ! position

nextPlayer :: Player -> Player
nextPlayer Player1 = Player2
nextPlayer _       = Player1
