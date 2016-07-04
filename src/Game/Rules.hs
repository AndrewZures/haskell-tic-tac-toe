module Game.Rules where

import qualified Data.List as List

data Player = Player1 | Player2 deriving (Eq, Show)
data Square = Empty | Filled Player deriving (Eq, Show)


-- hasWinner :: Board -> Bool
-- hasWinner board = or $ isWinner <$> [rows, columns, diagonals]
--   where rows = board
--         columns = List.transpose board
--         diagonals = diag board
--
-- isWinner :: [[Square]] -> Bool
-- isWinner vectors = or $ fmap findWinner vectors
--
-- findWinner :: [Square] -> Bool
-- findWinner squares = length set == 1 && head set /= Empty
--   where set = List.nub squares
--
-- diag :: Board -> Board
-- diag board = [
--   zipWith (!!) board [0..],
--   zipWith (!!) board [lastIdx, (lastIdx-1)..]
--   ]
--   where lastIdx = length board - 1
