module Main (main) where

main :: IO ()
main = print $ plus3 [3,4,5]



plus3 :: Num a => [a] -> [a]
plus3 = map (\x -> x + 3)
