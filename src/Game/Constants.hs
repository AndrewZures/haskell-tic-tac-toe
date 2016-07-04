module Game.Constants where
import Data.Matrix

data Player = Player1 | Player2 deriving (Eq, Show)
data Square = Empty | Filled Player deriving (Eq, Show)

type Board = Matrix Square
type Position = (Int, Int)
