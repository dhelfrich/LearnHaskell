import System.Environment   

main :: IO ()
main = do 
{-
    args <- getArgs 
    let num = read (args!!0)
    let out = pythags num 
    print out
-}
    let out = pythags
    print out 

pythags :: [(Int,Int,Int)]
pythags = [ (x, y, z) | z <- [1..500], x <- [1..z], y <- [x..z], x^2 + y^2 == z^2 ]
        
