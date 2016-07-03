module Game.Rules where

data Square = Empty | Player String deriving (Eq, Show)

type BoardColumn = [Square]
type BoardState = [BoardColumn]
type BoardSize = Int
data Board = Board BoardSize BoardState

isWinner :: Board -> Bool
isWinner (Board _ state) = or $ fmap findWinner state

findWinner :: [Square] -> Bool
findWinner = all (==Empty)
