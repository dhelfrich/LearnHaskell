module Main (main) where

main :: IO ()
main = print $ length $ sequence $ sequence $ sequence ([[1,2],[3,4]]::[[Int]])
