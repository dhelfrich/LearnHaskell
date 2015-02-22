module Main (main) where

import Control.Monad

main :: IO ()
main = print $ in3 (1,1)

type KnightPos = (Int,Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c,r) = do
    (c', r') <- [(c+2,r-1),(c+2,r+1),(c-2,r-1),(c-2,r+1)
               ,(c+1,r-2),(c+1,r+2),(c-1,r-2),(c-1,r+2)
               ]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return (c', r')


in3 :: KnightPos -> [KnightPos] 
in3 start = return start >>= moveKnight >>= moveKnight >>= moveKnight
