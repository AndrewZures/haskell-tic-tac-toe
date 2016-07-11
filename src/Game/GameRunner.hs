module Game.GameRunner (run) where

import Game.Constants
import qualified Game.Rules as Rules
import qualified Game.Board as Board
import qualified Game.Ai as Ai
import Data.Matrix
import Control.Monad (unless)

run :: IO ()
run = runGame (Board.newBoard 3 3) Player1

runGame :: Board -> Player -> IO ()
runGame board player = do
  line <- getLine
  print updatedBoard
  unless (line == "q") (runGame updatedBoard (Board.nextPlayer player))
  where updatedBoard = Board.insert board player $ getAiMove $ Ai.makeMove player board

-- get line -> check for commands -> attemptGameUpdate

checkCommands :: String -> Maybe String
checkCommands input =
  case input of
    "q" -> Just "quit"
    _ -> Nothing

getAiMove :: Maybe Position -> Position
getAiMove (Just x) = x
getAiMove _ = (1,1)
