module Game.BoardSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Data.Matrix
import Game.Constants
import Game.Board

spec :: Spec
spec = do

  describe "Board Spec" $ do

    it "creates a new empty board" $ do
      (newBoard 3 3) `shouldBe` (matrix 3 3 $ const Empty)

    it "inserts a player move onto the board" $ do
      let board = newBoard 3 3
      (get (1,1) board) `shouldBe` Empty
      let updatedBoard = insert board Player1 (1,1)
      (get (1,1) updatedBoard) `shouldBe` Filled Player1

    it "removes a player move from the board" $ do
      let board = insert (newBoard 3 3) Player1 (1,1)
      (get (1,1) board) `shouldBe` Filled Player1
      let updatedBoard = remove (1,1) board
      (get (1,1) updatedBoard) `shouldBe` Empty

    it "returns open positions for a board" $ do
      let board = foldr (\b agg -> insert agg Player1 b) (newBoard 3 3) [(1,1),(2,1),(3,1)]
      openPositions board `shouldBe` [(1,2),(1,3),(2,2),(2,3),(3,2),(3,3)]
