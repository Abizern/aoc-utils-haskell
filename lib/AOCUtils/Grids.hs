-- | Helpers for working in Grids
module AOCUtils.Grids
  ( rTuples,
    rcTuples,
    makeGrid,
    makeGrid1,
    Coord,
    Grid,
  )
where

import Data.Map (Map)
import qualified Data.Map as Map (fromList)

-- Function to convert a list of a to a list of tuples with row, column, and a
-- >>> rTuples 0 "abc"
-- [(0,0,'a'),(0,1,'b'),(0,2,'c')]
rTuples :: Int -> [a] -> [(Int, Int, a)]
rTuples rowNum = zipWith (\colNum v -> (rowNum, colNum, v)) [0 ..]

-- Function to convert a list of list of a to a list of tuples
-- >>> rcTuples ["ab", "de"]
-- [(0,0,'a'),(0,1,'b'),(1,0,'d'),(1,1,'e')]
rcTuples :: [[a]] -> [(Int, Int, a)]
rcTuples strings = concat $ zipWith rTuples [0 ..] strings

-- | A coordinate type to for use as a key in a Grid
data Coord = Coord
  { row :: Int,
    column :: Int
  }
  deriving (Eq, Show, Ord)

type Grid a = Map Coord a

makeGrid :: (a -> b) -> [[a]] -> Grid b
makeGrid f l = Map.fromList $ rctList l
  where
    transformer (r, c, val) = (Coord r c, f val)
    rctList list = map transformer $ rcTuples list

-- | >>> makeGrid1 ["12", "34"]
-- fromList [(Coord {row = 0, column = 0},'1'),(Coord {row = 0, column = 1},'2'),(Coord {row = 1, column = 0},'3'),(Coord {row = 1, column = 1},'4')]
makeGrid1 :: [[a]] -> Grid a
makeGrid1 = makeGrid id
