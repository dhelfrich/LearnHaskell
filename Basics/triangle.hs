main = do
    putStrLn "The base?"
    base <- getLine
    putStrLn "The height"
    height <- getLine
    putStrLn ("The area is " ++ show (((read base) * (read height))/2))
