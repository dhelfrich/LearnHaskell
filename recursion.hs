{-
 - 1. replicate :: Int -> a -> [a], which takes a count and an element and returns the list which is that element repeated that many times.
 - E.g. replicate 3 'a' = "aaa". (Hint: think about what replicate of anything with a count of 0 should be; a count of 0 is your 'base case'.)
 - 
 - 2. (!!) :: [a] -> Int -> a, which returns the element at the given 'index'. The first element is at index 0, the second at index 1, and so on.
 - Note that with this function, you're recursing both numerically and down a list[5].
 -
 - 3. (A bit harder.) zip :: [a] -> [b] -> [(a, b)], which takes two lists and 'zips' them together, so that the first pair in the resulting list is the 
 - first two elements of the two lists, and so on. E.g. zip [1,2,3] "abc" = [(1, 'a'), (2, 'b'), (3, 'c')]. If either of the lists is shorter than the other,
 - you can stop once either list runs out. E.g. zip [1,2] "abc" = [(1, 'a'), (2, 'b')].
 - 
 - 4. Define length using an auxiliary function and an accumulating parameter, as in the loop-like alternate version of factorial.
 -}

main :: IO()
main = 
    putStrLn (show (rep 20 'a')++ show (el "abcdefg" 4) ++ show (zi "abcd" "zyxw") ++ show (len "abcdefghijklmno"))

rep :: Int -> a -> [a]
rep 0 _ = []
rep n a = a : rep (n-1) a

el :: [a] -> Int -> a
el [] _         = error "Index too large"     
el (x:_) 0     = x
el (_:xs) n     = el xs (n-1) 

zi :: [a] -> [b] -> [(a,b)]
zi _ []             = [] 
zi [] _             = []
zi (x:xs) (y:ys)    = (x,y): zi xs ys

len :: [a] -> Int
len a = go a 0
    where
    go [] result = result
    go (_:xs) result = go xs (result + 1)

