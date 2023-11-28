-- |
-- Functions to make working with lists a little easier
module AOCUtils.Lists (alternate) where

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
