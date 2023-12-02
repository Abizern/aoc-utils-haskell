module AOCUtils.Strings where

import Data.Char (isDigit)

-- | Is the Char a vowel
-- >>> isVowel 'a'
-- True
-- >>> isVowel 'c'
-- False
isVowel :: Char -> Bool
isVowel c = c `elem` "aeiouAEIOU"

-- | Is the Char a consonant
-- >>> isConsonant 'c'
-- True
-- >>> isConsonant 'e'
-- False
isConsonant :: Char -> Bool
isConsonant = not . isVowel

extractNumber :: String -> Int
extractNumber s = read [c | c <- s, isDigit c]
