module Game.RulesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Constants
import Game.Rules
import Game.Board

spec :: Spec
spec = do

  describe "Game Rules" $ do

    it "finds no winner" $ do
      let emptyBoard = newBoard 3 3
      (hasWinner emptyBoard) `shouldBe` False

    it "isWinner Works" $ do
      let board = customBoard 3 3 (\(i,j) -> if i == 1 then Filled Player1 else Empty)
      (isWinner <$> rows board) `shouldBe` [True, False, False]

      let board = customBoard 3 3 (\(i,j) -> if i == 2 then Filled Player1 else Empty)
      (isWinner <$> rows board) `shouldBe` [False, True, False]

      let board = customBoard 3 3 (\(i,j) -> if i == 3 then Filled Player1 else Empty)
      (isWinner <$> rows board) `shouldBe` [False, False, True]

    it "isWinner works for columns" $ do
      let board = customBoard 3 3 (\(i,j) -> if j == 1 then Filled Player1 else Empty)
      (isWinner <$> columns board) `shouldBe` [True, False, False]

      let board = customBoard 3 3 (\(i,j) -> if j == 2 then Filled Player1 else Empty)
      (isWinner <$> columns board) `shouldBe` [False, True, False]

      let board = customBoard 3 3 (\(i,j) -> if j == 3 then Filled Player1 else Empty)
      (isWinner <$> columns board) `shouldBe` [False, False, True]

      let board = customBoard 3 3 (\(i,j) -> if j == 3 then Filled Player1 else Empty)
      let updated = insert Player2 (1,3) board
      (isWinner <$> columns updated) `shouldBe` [False, False, False]

    it "isWinner works for main diagonal" $ do
      let board = customBoard 3 3 (\(i,j) -> if j == i then Filled Player1 else Empty)
      (isWinner <$> diagonals board) `shouldBe` [True, False]

    it "iswinner works for second diagonal" $ do
      let board = newBoard 3 3
      let updated = foldl (\new pos -> insert Player1 pos new) board [(1,3), (2,2), (3,1)]
      (isWinner <$> diagonals updated) `shouldBe` [False, True]
