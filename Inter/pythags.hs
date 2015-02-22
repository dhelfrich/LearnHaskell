import System.Environment   

main :: IO ()
main = do 
    args <- getArgs 
    let num = read $ head args 
    print num
    let out = pythags num 
    print out

pythags :: Int -> [(Int,Int,Int)]
pythags n = [ (x, y, z) | z <- [1..n], x <- [1..z], y <- [x..z], f x y z 2 , (gcd x y == 1) && (gcd x z == 1) && (gcd z y == 1)]
    where f :: Int -> Int -> Int -> Int -> Bool
          f x y z e = x^e + y^e == z^e        


