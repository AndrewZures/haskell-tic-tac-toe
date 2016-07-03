module Game.RulesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Rules

spec :: Spec
spec = do

  describe "testing" $ do

    it "does something" $ do
      hi "hello" `shouldBe` 1
