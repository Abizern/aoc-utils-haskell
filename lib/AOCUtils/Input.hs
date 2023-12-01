-- |
--    The module proovides helpers to load inputs for the solutions. It requires the inputs to be in ../inputs/day<xx>.txt format.
--
--    There are also helpers to extract them into common formats that can be further processed.
module AOCUtils.Input
  ( getRawInput,
    makeTitle,
  )
where

import Text.Printf (printf)

-- | This is a convenience function to load data for interactively running in the REPL
getRawInput :: Int -> IO String
getRawInput d = readFile (printf "inputs/day%02d.txt" d)

-- | >>> makeTitle "--- Day 01 Some Crazy Title ---"
-- "--- Day 01 Some Crazy Title ---\n-------------------------------\n"
makeTitle :: String -> String
makeTitle s = mconcat [s, "\n", replicate (length s) '-', "\n"]
