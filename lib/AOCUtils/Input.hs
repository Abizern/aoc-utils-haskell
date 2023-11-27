
-- |
--    The module proovides helpers to load inputs for the solutions. It requires the inputs to be in ../inputs/<yyyy>/day<xx>.txt format.
--
--    There are also helpers to extract them into common formats that can be further processed.
module AOCUtils.Input
  ( 
    getRawInput,
  )
where

import System.Environment (getArgs)
import Text.Printf (printf)

getRawInput :: Int -> Int -> IO String
getRawInput y d = do
  args <- getArgs
  case args of
    [] -> readFile (printf "inputs/%d/day%02d.txt" y d)
    "+" : input : _ -> pure input
    fp : _ -> readFile fp
