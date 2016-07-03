module Game.RulesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Game.Rules

spec :: Spec
spec = do

  describe "Game Rules" $ do

    it "finds a winner" $ do
      isWinner (Board 1 [[Empty]])`shouldBe` True
