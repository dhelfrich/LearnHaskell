import System.Environment
main :: IO ()
main =  do
    args <- getArgs
    let num = read $ head args :: Integer
    print $ factorial num

factorial :: Integer -> Integer
factorial x = 
        tailFact x 1
        where tailFact 0 a = a
              tailFact n a = tailFact (n-1) (n*a)
