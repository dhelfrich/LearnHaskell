{-
Exercises
Define the following functions recursively (like the definitions for sum, product and concat above), then turn them into a fold:
    and :: [Bool] -> Bool, which returns True if a list of Bools are all True, and False otherwise.
    or :: [Bool] -> Bool, which returns True if any of a list of Bools are True, and False otherwise.
Define the following functions using foldl1 or foldr1:
    maximum :: Ord a => [a] -> a, which returns the maximum element of a list (hint: max :: Ord a => a -> a -> a returns the maximum of two values).
    minimum :: Ord a => [a] -> a, which returns the minimum element of a list (hint: min :: Ord a => a -> a -> a returns the minimum of two values).
Use a fold (which one?) to define reverse :: [a] -> [a], which returns a list with the elements in reverse order.
Note that all of these are Prelude functions, so they will be always close at hand when you need them. (Also, that means you must use slightly different names in order to test your answers in GHCi.)
-}

main :: IO()
main = do let list1 = [True,True,False]
          let list2 = [True,True,True]
          let list3 = [False,False,False]
          let list4 = [3,6,1,5]
          print (and1 list1)
          print (and1 list2)
          print (and1 list3)
          print (or1 list1)
          print (or1 list2)
          print (or1 list3)
          print (maximum1 list4)
          print (minimum1 list4)
          print (reverse1 list4)


and1 :: [Bool] -> Bool
and1 = foldr (&&) True 


or1 :: [Bool] -> Bool
or1 = foldr (||) False

maximum1 :: Ord a => [a] -> a
maximum1 = foldr1 max 

minimum1 :: Ord a => [a] -> a
minimum1 = foldr1 min 

reverse1 :: [a] -> [a]
reverse1 = foldl consL []
    where consL x y = y:x
