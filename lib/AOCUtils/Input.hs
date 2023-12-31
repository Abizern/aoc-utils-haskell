-- |
--    The module proovides helpers to load inputs for the solutions. It requires the inputs to be in ../inputs/day<xx>.txt format.
--
--    There are also helpers to extract them into common formats that can be further processed.
module AOCUtils.Input
  ( getRawInput,
    makeTitle,
    newlines,
    spacedNumbers,
  )
where

import Data.List.Split (splitOn)
import Text.Printf (printf)

-- | This is a convenience function to load data for interactively running in the REPL
getRawInput :: Int -> IO String
getRawInput d = readFile (printf "inputs/day%02d.txt" d)

-- | Creates an underlined title for nicer results display.
-- | >>> makeTitle "--- Day 01 Some Crazy Title ---"
-- "--- Day 01 Some Crazy Title ---\n-------------------------------\n"
makeTitle :: String -> String
makeTitle s = mconcat [s, "\n", replicate (length s) '-', "\n"]

-- | Splits a string on empty lines
newlines :: String -> [String]
newlines = splitOn "\n\n"

-- | Splits a line of space delimited numbers into an list of Int
-- >>> spacedNumbers "  11   12 13"
-- [11,12,13]
spacedNumbers :: String -> [Int]
spacedNumbers = map read . words
