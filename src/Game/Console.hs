module Console where

import Game.Constants

readFromConsole :: IO String
readFromConsole = do
    move <- getLine
    return read move

getChoice :: String -> Maybe Position
getChoice input =
  case (read input) of
    1 -> Just (1,1)
    2 -> Just (1,2)
    3 -> Just (1,3)
    4 -> Just (2,1)
    5 -> Just (2,2)
    6 -> Just (2,3)
    7 -> Just (3,1)
    8 -> Just (3,2)
    9 -> Just (3,3)
    _   -> Nothing
