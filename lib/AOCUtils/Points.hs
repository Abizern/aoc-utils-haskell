-- |
-- This module provides utilities for working with points.
module AOCUtils.Points where

data Point2d = Point2d Int Int deriving (Eq, Show)

data Move = Up | Down | Rt | Lt deriving (Eq, Show)

-- |
-- >>> move origin Up
-- Point2d 0 1
--
-- >>> move origin Down
-- Point2d 0 (-1)
--
-- >>> move origin Rt
-- Point2d 1 0
--
-- >>> move origin Lt
-- Point2d (-1) 0
move :: Point2d -> Move -> Point2d
move (Point2d x y) m = case m of
  Up -> Point2d x (y + 1)
  Down -> Point2d x (y - 1)
  Rt -> Point2d (x + 1) y
  Lt -> Point2d (x - 1) y

origin :: Point2d
origin = Point2d 0 0
