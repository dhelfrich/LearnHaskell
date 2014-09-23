{-
- Write a program that asks the user for his or her name. If the name is one of Simon, John or Phil, 
- tell the user that you think Haskell is a great programming language. If the name is Koen, 
- tell them that you think debugging Haskell is fun (Koen Classen is one of the people who works on Haskell 
- debugging); otherwise, tell the user that you don't know who he or she is.
- (As far as syntax goes there are a few different ways to do it; write at least a version using if / then / else.)
-}
main = do
    putStrLn "What is your name?"
    name <- getLine
    if (name == "Simon") || (name == "John") || (name == "Phil")
        then putStrLn "I think Haskell is a great programming language"
        else if name == "Koen"
            then putStrLn "Debugging Haskell is fun"
            else putStrLn "I don't know who you are"
                        
