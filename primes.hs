
main = do
    print $ map (\n -> (n,isPrime n)) [3..10]
    
isNotDivisible :: Integral a => a -> a -> Bool
isNotDivisible x y = y `mod` x /= 0

filterHead :: [Integer] -> [Integer]
filterHead = filter =<< isNotDivisible . head

isPrime n = n > 1 &&
              foldr (\p r -> p*p > n || ((n `rem` p) /= 1 && r)) True primes

primes = 2 : filter isPrime [3,5..]
