module Game.RulesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Rules

spec :: Spec
spec = do

  describe "Game Rules" $ do

    it "finds winner for rows" $ do
      winner [
        replicate 3 (Filled Player1),
        replicate 3 Empty,
        replicate 3 Empty
        ] `shouldBe` True
      winner [
        replicate 3 Empty,
        replicate 3 (Filled Player2),
        replicate 3 Empty
        ] `shouldBe` True
      winner [
        replicate 3 Empty,
        replicate 3 Empty,
        replicate 3 Empty
        ]`shouldBe` False

    it "finds winner for columns" $ do
      winner [
        [Filled Player1, Empty, Empty],
        [Filled Player1, Empty, Empty],
        [Filled Player1, Empty, Empty]
        ] `shouldBe` True
      winner [
        [Empty, Filled Player2, Empty],
        [Empty, Filled Player2, Empty],
        [Empty, Filled Player2, Empty]
        ] `shouldBe` True
    it "finds winner for main diagonal" $ do
      winner [
        [Filled Player1, Empty, Empty],
        [Empty, Filled Player1, Empty],
        [Empty, Empty, Filled Player1]
        ] `shouldBe` True
    it "finds winner for secondary diagonal" $ do
      winner [
        [Empty, Empty, Filled Player2],
        [Empty, Filled Player2, Empty],
        [Filled Player2, Empty, Empty]
        ] `shouldBe` True
