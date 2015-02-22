{-
main = readFile input >>= return . reverse >>= writeFile output 
 where input  = "input"
       output = "output"
-}


main = readFile input >>= return . reverse >>= writeFile output 
 where input  = "input"
       output = "output"
