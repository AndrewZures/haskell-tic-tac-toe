module Game.Ai where

import Game.Constants

makeMove :: Player -> Board -> Position -> (Int, Int)
makeMove player board position = findBestMove player board 0

findBestMove :: Player -> Board -> Int -> (Int,Int)
findBestMove player board depth = (1,1)
