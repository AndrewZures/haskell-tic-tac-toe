module Game.Ai where

import Game.Constants
import qualified Game.Board as Board
import qualified Game.Rules as Rules

-- TODO
-- have Rules take aboard and return a board status : Winner Player | Tied | InProgress
-- review minimax alg, show be a guard statement with board statuses at some point

type ScoredPosition = (Int, Position)

-- makeMove :: Player -> Board -> Position -> Position
-- makeMove player board position = findBestMove player board 0

findBestMove :: Player -> Int -> Board -> [Int]
findBestMove player depth board = map (scoreMove player depth board) $ Board.openPositions board

scoreMove :: Player -> Int -> Board -> Position -> Int
scoreMove player depth board position = minimum $ findBestMove nextPlayer nextDepth updatedBoard
  where nextDepth = depth+1
        updatedBoard = Board.insert player position board
        nextPlayer = Board.nextPlayer player

-- scorePossibleMoves player depth board =
--   map scoreMove player depth $ Board.insert player board $ Board.openPositions board
  -- find open positions, add respective positions to respective boards, scoreBoards
--
-- scoreMove' player depth board
--   case boardStatus in
--     Winner player -> depth
--     Tie -> 0
--     InProgress -> findBestMove nextPlayer nextDepth nextBoard
--   where boardStatus = Board.boardStatus board


  -- update board
  -- increase depth
  -- change player
  -- score with updated stuff

  -- score is depth if winner, zero if tie, recurse if neither
