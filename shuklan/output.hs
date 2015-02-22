module Main where

import System.IO

main = do
  fileName <- getLine
  putStrLn "writing to file..."
  writeFile fileName ['A'..'Z']
