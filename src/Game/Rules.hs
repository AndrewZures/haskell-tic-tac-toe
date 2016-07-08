module Game.Rules where

import qualified Data.Matrix as Matrix
import qualified Data.Vector as Vector
import qualified Game.Board as Board
import Data.Vector (Vector)

import Game.Constants

data BoardStatus = Win Player | NoWin | Tied deriving (Eq, Show)

boardStatus :: Board -> BoardStatus
boardStatus board
  | winStatus /= NoWin   = winStatus
  | isTie board          = Tied
  | otherwise            = NoWin
  where winStatus = winState board

isTie :: Board -> Bool
isTie = null . Board.openPositions

winState :: Board -> BoardStatus
winState board = foldl winStatus NoWin chunks
  where chunks = concat [rows board, columns board, diagonals board]

winStatus :: BoardStatus -> Vector Square -> BoardStatus
winStatus status chunk
  | status == NoWin  = checkForWin $ Vector.toList chunk
  | otherwise        = status

checkForWin :: [Square] -> BoardStatus
checkForWin [Filled winner] = Win winner
checkForWin (x:y:xs)
  | x == Empty  = NoWin
  | y /= x      = NoWin
  | otherwise   = checkForWin (y:xs)

rows :: Board -> [Vector Square]
rows board = (`Matrix.getRow` board) <$> [1..(Matrix.nrows board)]

columns :: Board -> [Vector Square]
columns = rows . Matrix.transpose

diagonals :: Board -> [Vector Square]
diagonals board = [Matrix.getDiag board, getSecondDiag board]

getSecondDiag :: Board -> Vector Square
getSecondDiag board = Vector.fromList $ zipWith (!!) matrixAsList [mtxLen, (mtxLen-1)..]
    where matrixAsList = Matrix.toLists board
          mtxLen = length matrixAsList - 1
