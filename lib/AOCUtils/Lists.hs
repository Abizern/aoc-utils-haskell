-- |
-- Functions to make working with lists a little easier
module AOCUtils.Lists
  ( alternate,
    pairs,
    successiveElems,
  )
where

-- |
-- >>> alternate [1 .. 10]
-- ([1,3,5,7,9],[2,4,6,8,10])
--
-- >>> alternate ['a' .. 'z']
-- ("acegikmoqsuwy","bdfhjlnprtvxz")
alternate :: [a] -> ([a], [a])
alternate l = alternate' l [] []

alternate' :: [a] -> [a] -> [a] -> ([a], [a])
alternate' [] a b = (reverse a, reverse b)
alternate' [_] a b = (reverse a, reverse b)
alternate' (x : y : xs) a b = alternate' xs (x : a) (y : b)

-- | Turns a list into a tuple of elements separated by n
-- >>> successiveElems 2 "abcde"
-- [('a','c'),('b','d'),('c','e')]
successiveElems :: Int -> [a] -> [(a, a)]
successiveElems n xs = zip xs $ drop n xs

-- | Turns a list into a tuple of successive elements
-- >>> pairs "abc"
-- [('a','b'),('b','c')]
-- >>> pairs [1, 2, 3]
-- [(1,2),(2,3)]
pairs :: [a] -> [(a, a)]
pairs = successiveElems 1
