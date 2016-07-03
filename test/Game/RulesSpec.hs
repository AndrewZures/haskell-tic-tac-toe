module Game.RulesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Rules

spec :: Spec
spec = do

  describe "Game Rules" $ do

    it "finds winner for rows" $ do
      winner [
        [Filled Player1, Filled Player1],
        [Empty, Empty]
        ] `shouldBe` True
      winner [
        [Filled Player2, Filled Player2],
        [Empty, Empty]
        ] `shouldBe` True
      winner [
        [Empty, Filled Player1],
        [Empty, Empty]
        ]`shouldBe` False

    it "finds winner for columns" $ do
      winner [
        [Filled Player1, Empty],
        [Filled Player1, Empty]
        ] `shouldBe` True
    it "finds winner for main diagonal" $ do
      winner [
        [Filled Player1, Empty],
        [Empty, Filled Player1]
        ] `shouldBe` True
    it "finds winner for secondary diagonal" $ do
      winner [
        [Empty, Filled Player1],
        [Filled Player1, Empty]
        ] `shouldBe` True
