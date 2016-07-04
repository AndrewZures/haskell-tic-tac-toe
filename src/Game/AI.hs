module Game.Ai ( makeMove ) where

import qualified Data.List as List
import Data.Matrix
import Game.Rules

type Move = (Int, Int)

makeMove :: [[Square]]-> Player -> Move
makeMove board player = (0,0)
