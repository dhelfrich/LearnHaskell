module Main (main) where

main :: IO ()
main = print "1"


maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max
