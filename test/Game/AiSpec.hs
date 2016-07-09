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

    -- it "handles a full board" $ do
    --   let board = customBoard 3 3 (\_ -> Filled Player2)
    --   makeMove Player1 board `shouldBe` (0,0)
    --
    it "blocks win" $ do
      let board = foldr (\b agg -> insert agg Player1 b) (newBoard 3 3) [(1,1),(1,2)]
      makeMove Player2 board `shouldBe` (1,3)

    it "finds win" $ do
      let board = foldr (\b agg -> insert agg Player2 b) (newBoard 3 3) [(1,1),(1,2)]
      makeMove Player2 board `shouldBe` (1,3)

    it "takes diagonal on fork attempt" $ do
      let a = foldr (\b agg -> insert agg Player2 b) (newBoard 3 3) [(2,2), (3,3)]
      let b = foldr (\b agg -> insert agg Player1 b) a [(1,1)]
      makeMove Player1 b `shouldBe` (3,1)

    it "forces defensive move" $ do
      let a = foldr (\b agg -> insert agg Player2 b) (newBoard 3 3) [(1,2)]
      let b = foldr (\b agg -> insert agg Player1 b) a [(3,1)]
      makeMove Player1 b `shouldBe` (3,3)

    -- it "stuff" $ do
    --   let board = foldr (\b agg -> insert agg Player2 b) (newBoard 3 3) [(1,1),(3,3)]
    --   let updated = foldr (\b agg -> insert agg Player1 b) board [(2,2)]
      -- makeMove Player1 updated `shouldBe` (1,3)
