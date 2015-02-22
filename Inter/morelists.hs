{-
-
- Exercises
- Write the following functions and test them out. Don't forget the type
- signatures.
-
- takeInt returns the first n items in a list. So takeInt
- 4 [11,21,31,41,51,61] returns [11,21,31,41].
- 
- dropInt drops the first n items in a list and returns the rest. so
- dropInt 3 [11,21,31,41,51] returns [41,51].
-
- sumInt returns the sum of the items in a list.
-
- scanSum adds the items in a list and returns a list of the running
- totals. So scanSum [2,3,4,5] returns [2,5,9,14].
-
- diffs returns a list of the differences between adjacent items. So diffs
- [3,5,6,8] returns [2,1,2]. (Hints: one solution involves writing an
- auxiliary function which takes two lists and calculates the difference
- between corresponding. Alternatively, you might explore the fact that
- lists with at least two elements can be matched to a (x:y:ys) pattern.)
-
- The first three functions are in Prelude, under the names take, drop, and
- sum.
-}


main :: IO ()
main = 
    do let list1 = [0,1,2,3,4,5,6,76,8]
       putStrLn (show list1)
       putStrLn (show (takeInt 5 list1))
       putStrLn (show (dropInt 5 list1))
       putStrLn (show (sumInt list1))
       putStrLn (show (scanSum list1))
       putStrLn (show (diffs list1))



takeInt :: Integer -> [a] -> [a]
takeInt 0 _         = []
takeInt 1 (x:_)    = [x]
takeInt n (x:xs)    = x : takeInt (n-1) xs

dropInt :: Integer -> [a] -> [a]
dropInt 0 x     = x
dropInt n (_:xs)= dropInt (n-1) xs

sumInt :: [Integer] -> Integer
sumInt [] = 0
sumInt (x:xs) = x + sumInt xs

scanSum :: [Integer] -> [Integer]
scanSum [] = []
scanSum (x:xs) = x: map (x+) (scanSum xs)

diffs :: [Integer] -> [Integer]
diffs (_:[])    = []
diffs (x:y:[])  = [abs (x-y)]
diffs (x:y:ys)  = abs (x-y) : diffs(y:ys)

