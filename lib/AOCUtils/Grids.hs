-- | Helpers for working in Grids
module AOCUtils.Grids
  ( rTuples,
    rcTuples,
  )
where

-- Function to convert a list of a to a list of tuples with row, column, and a
-- >>> rTuples 0 "abc"
-- [(0,0,'a'),(0,1,'b'),(0,2,'c')]
rTuples :: Int -> [a] -> [(Int, Int, a)]
rTuples row = zipWith (\col char -> (row, col, char)) [0 ..]

-- Function to convert a list of list of a to a list of tuples
-- >>> rcTuples ["ab", "de"]
-- [(0,0,'a'),(0,1,'b'),(1,0,'d'),(1,1,'e')]
rcTuples :: [[a]] -> [(Int, Int, a)]
rcTuples strings = concat $ zipWith rTuples [0 ..] strings
