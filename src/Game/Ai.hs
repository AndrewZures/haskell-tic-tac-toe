module Game.Ai where

import Game.Constants
import qualified Game.Board as Board
import qualified Game.Rules as Rules

type ScoredPosition = (Double, Position)
type Score = Double
type Depth = Int

makeMove :: Player -> Board -> Maybe Position
makeMove player board
  | null openPositions = Nothing
  | otherwise          = Just $ snd $ bestScore scoredPositions
  where openPositions = Board.openPositions board
        scoredPositions = zip (scorePossibleMoves player 1 board) openPositions

bestScore :: [ScoredPosition] -> ScoredPosition
bestScore = foldl (\score best -> if fst score > fst best then score else best) (-100000, (0,0))

scorePossibleMoves :: Player -> Depth -> Board -> [Score]
scorePossibleMoves player depth board =
  insertAndScore player depth board <$> Board.openPositions board

insertAndScore :: Player -> Depth -> Board -> Position -> Score
insertAndScore player depth board position =
  scoreMove player depth $ Board.insert board player position

scoreMove :: Player -> Depth -> Board -> Score
scoreMove player depth board =
  case Rules.boardStatus board of
    Win _ -> 1 / fromIntegral depth
    Tied  -> 0
    NoWin -> negate $ maximum $ scorePossibleMoves (Board.nextPlayer player) (depth+1) board
