module Game.Rules where

import qualified Data.Matrix as Matrix
import qualified Data.Vector as Vector
import Data.Vector (Vector)

import Game.Constants

hasWinner :: Board -> Bool
hasWinner board = foldl (\agg x -> agg || isWinner x) False d
  where d = concat [rows board, columns board, diagonals board]

isWinner :: Vector Square -> Bool
isWinner = isWinner' . Vector.toList

isWinner' :: [Square] -> Bool
isWinner' [x] = True
isWinner' (x:y:xs)
  | x == Empty  = False
  | y /= x      = False
  | otherwise   = isWinner' (y:xs)

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
