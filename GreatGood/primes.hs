
main :: IO ()
main = do print "hi"

isNotDivisible :: Integral a => a -> a -> Bool
isNotDivisible x y = y `mod` x /= 0

filterHead :: [Integer] -> [Integer]
filterHead = filter =<< isNotDivisible . head


