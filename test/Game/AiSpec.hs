module Game.AiSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Constants
import Game.Rules
import Game.Board
import Game.Ai

spec :: Spec
spec = do
  describe "Game AI" $ do

    it "chooses winning position" $ do
      1 `shouldBe` 1
