import System.Environment
main :: IO ()
main =  do
    args <- getArgs
    let num = read $ head args :: Integer
    print $ factorial num

factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x-1)
