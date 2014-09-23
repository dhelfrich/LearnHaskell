{-
- You are given a function plusOne x = x + 1. Without using any other (+)s,
- define a recursive function addition such that addition x y adds x and
- y together.
-}

main = putStrLn( show (add 100 67))

plusOne x = x + 1

add x 0 = x
add x y = plusOne (add x (y-1))

