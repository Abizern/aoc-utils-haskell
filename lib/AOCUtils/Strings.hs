module AOCUtils.Strings where

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
