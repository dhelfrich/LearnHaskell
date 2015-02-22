
module Main (main) where

main :: IO ()
main = do print $ rev ['a'..'h']

rev :: [a] -> [a]
rev [] = []
rev a = last a : rev (init a)

