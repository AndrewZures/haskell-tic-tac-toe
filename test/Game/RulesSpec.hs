module Game.RulesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Constants
import Game.Rules
import Game.Board

spec :: Spec
spec = do

  describe "Game Rules" $ do

    it "finds no Win" $ do
      let emptyBoard = newBoard 3 3
      (boardStatus emptyBoard) `shouldBe` NoWin

    it "winStatus Works" $ do
      let board = customBoard 3 3 (\(i,j) -> if i == 1 then Filled Player1 else Empty)
      (winStatus NoWin <$> rows board) `shouldBe` [Win Player1, NoWin, NoWin]

      let board = customBoard 3 3 (\(i,j) -> if i == 2 then Filled Player1 else Empty)
      (winStatus NoWin <$> rows board) `shouldBe` [NoWin, Win Player1, NoWin]

      let board = customBoard 3 3 (\(i,j) -> if i == 3 then Filled Player1 else Empty)
      (winStatus NoWin <$> rows board) `shouldBe` [NoWin, NoWin, Win Player1]

    it "winStatus works for columns" $ do
      let board = customBoard 3 3 (\(i,j) -> if j == 1 then Filled Player1 else Empty)
      (winStatus NoWin <$> columns board) `shouldBe` [Win Player1, NoWin, NoWin]

      let board = customBoard 3 3 (\(i,j) -> if j == 2 then Filled Player1 else Empty)
      (winStatus NoWin <$> columns board) `shouldBe` [NoWin, Win Player1, NoWin]

      let board = customBoard 3 3 (\(i,j) -> if j == 3 then Filled Player1 else Empty)
      (winStatus NoWin <$> columns board) `shouldBe` [NoWin, NoWin, Win Player1]

      let board = customBoard 3 3 (\(i,j) -> if j == 3 then Filled Player1 else Empty)
      let updated = insert board Player2 (1,3)
      (winStatus NoWin <$> columns updated) `shouldBe` [NoWin, NoWin, NoWin]

    it "winStatus works for main diagonal" $ do
      let board = customBoard 3 3 (\(i,j) -> if j == i then Filled Player1 else Empty)
      (winStatus NoWin <$> diagonals board) `shouldBe` [Win Player1, NoWin]

    it "winStatus works for second diagonal" $ do
      let board = newBoard 3 3
      let updated = foldl (\new pos -> insert new Player1 pos) board [(1,3), (2,2), (3,1)]
      (winStatus NoWin <$> diagonals updated) `shouldBe` [NoWin, Win Player1]
