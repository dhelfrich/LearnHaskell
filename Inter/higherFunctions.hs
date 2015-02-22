import Data.Char
main :: IO ()
main = do
    let list = ["I", "Linux", "a", "for", "have", "thing"]
    print (quickSort' compare list)
    print (quickSort' compareInsensitive list)

compareInsensitive :: String -> String -> Ordering
compareInsensitive x y = compare (map toUpper x) (map toUpper y)

quickSort' :: (Ord a) => (a -> a -> Ordering) -> [a] -> [a]
-- No matter how we compare two things the base case doesn't change,
-- -- so we use the _ "wildcard" to ignore the comparison function.
quickSort' _ [] = []
  
  -- c is our comparison function
quickSort' c (x : xs) = quickSort' c less ++ x : equal ++ quickSort' c more
  where
      less  = filter (\y -> y `c` x == LT) xs
      equal = filter (\y -> y `c` x == EQ) xs
      more  = filter (\y -> y `c` x == GT) xs 
