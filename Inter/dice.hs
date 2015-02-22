{- Implement a function rollNDiceIO :: Int -> IO [Int] that, given an integer
- (a number of die rolls), returns a list of that number of pseudo-random integers between 1 and 6.
-}

import Control.Monad
import System.Random
 
main :: IO ()
main = do 
          print clumsyRollDice
          print clumsyRollDice

rollDiceIO :: IO (Int, Int)
rollDiceIO = liftM2 (,) (randomRIO (1,6)) (randomRIO (1,6))


rollNDiceIO :: Int -> IO [Int] 
rollNDiceIO n = replicateM n (randomRIO (1, 6))

clumsyRollDice :: (Int, Int)
clumsyRollDice = (n, m)
        where
        (n, g) = randomR (1,6) (mkStdGen 9)
        (m, _) = randomR (1,6) g


digit :: Int -> String -> Maybe Int
digit i s | i > 9 || i < 0 = Nothing
          | otherwise      = do
        let (c:_) = s
        if [c] == show i then Just i else Nothing

binChar :: String -> Maybe Int
binChar s = digit 0 s `mplus` digit 1 s
