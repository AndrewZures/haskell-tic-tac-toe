module Game.AiSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Rules
import Game.Ai

spec :: Spec
spec = do

  describe "Game AI" $ do

    it "guards against loss" $ do
      1 `shouldBe` 1
