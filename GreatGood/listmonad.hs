import Control.Monad

main :: IO () 
main = print listmonad

listmonad :: [Int]
listmonad = do
        a <- [1..5]  
        b <- [(*3), (+5)] 
        return $ b a
