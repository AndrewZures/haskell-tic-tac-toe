module Game.Ai where

import Game.Constants
import qualified Game.Board as Board
import qualified Game.Rules as Rules

-- TODO
-- review minimax alg, show be a guard statement with board statuses at some point

type ScoredPosition = (Double, Position)

-- makeMove :: Player -> Board -> Position
makeMove player board = snd $ bestScore $ zip (scorePossibleMoves player 1 board) (Board.openPositions board)

scorePossibleMoves :: Player -> Double -> Board -> [Double]
scorePossibleMoves player depth board =
  insertAndScore board player depth <$> Board.openPositions board

insertAndScore :: Board -> Player -> Double -> Position -> Double
insertAndScore board player depth position =
  scoreMove player depth $ Board.insert board player position

scoreMove :: Player -> Double -> Board -> Double
scoreMove player depth board =
  case boardStatus of
    Win player -> 1 / depth
    Tied -> 0
    NoWin -> negate $ maximum $ scorePossibleMoves (Board.nextPlayer player) (depth+1) board
  where boardStatus = Rules.boardStatus board

bestScore :: [ScoredPosition] -> ScoredPosition
bestScore = foldl (\score best -> if fst score > fst best then score else best) (-100000000000, (0,0))
