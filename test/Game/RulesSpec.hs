module Game.RulesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Rules

spec :: Spec
spec = do

  describe "Game Rules" $ do

    it "finds winner for rows" $ do
      1 `shouldBe` 1

      -- hasWinner [
  --       replicate 3 (Filled Player1),
  --       replicate 3 Empty,
  --       replicate 3 Empty
  --       ] `shouldBe` True
  --     hasWinner [
  --       replicate 3 Empty,
  --       replicate 3 (Filled Player2),
  --       replicate 3 Empty
  --       ] `shouldBe` True
  --     hasWinner [
  --       replicate 3 Empty,
  --       replicate 3 Empty,
  --       replicate 3 Empty
  --       ]`shouldBe` False
  --
  --   it "finds winner for columns" $ do
  --     hasWinner [
  --       [Filled Player1, Empty, Empty],
  --       [Filled Player1, Empty, Empty],
  --       [Filled Player1, Empty, Empty]
  --       ] `shouldBe` True
  --     hasWinner [
  --       [Empty, Filled Player2, Empty],
  --       [Empty, Filled Player2, Empty],
  --       [Empty, Filled Player2, Empty]
  --       ] `shouldBe` True
  --   it "finds winner for main diagonal" $ do
  --     hasWinner [
  --       [Filled Player1, Empty, Empty],
  --       [Empty, Filled Player1, Empty],
  --       [Empty, Empty, Filled Player1]
  --       ] `shouldBe` True
  --   it "finds winner for secondary diagonal" $ do
  --     hasWinner [
  --       [Empty, Empty, Filled Player2],
  --       [Empty, Filled Player2, Empty],
  --       [Filled Player2, Empty, Empty]
  --       ] `shouldBe` True
