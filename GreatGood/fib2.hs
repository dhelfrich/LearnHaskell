import Data.MemoTrie (memo)

fib2 :: Int -> Int
fib2 = memo fib
  where
    fib :: Int -> Int
    fib 0 = 0
    fib 1 = 1
    fib n = fib (n-1) + fib (n-2)

main :: IO ()
main = print (fib2 40)
