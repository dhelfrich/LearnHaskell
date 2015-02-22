{-
- Exercises
- Use map to build functions that, given a list xs of Ints, return:
-   A list that is the element-wise negation of xs.
-   A list of lists of Ints xss that, for each element of xs, contains the
-   divisors of xs. You can use the following function to get the divisors:
-       divisors p = [ f | f <- [1..p], p `mod` f == 0 ]
-   The element-wise negation of xss.
-
- Implement a Run Length Encoding (RLE) encoder and decoder.
-   The idea of RLE is simple; given some input:
-   "aaaabbaaa"
-   compress it by taking the length of each run of characters:(4,'a'), (2,
-   'b'), (3, 'a')
-   The concat and group functions might be helpful. In order to use group,
-   you will need to import the Data.List module. You can access this by
-   typing :m Data.List at the ghci prompt, or by adding import Data.List to
-   your Haskell source code file.
-   What is the type of your encode and decode functions?
-   How would you convert the list of tuples (e.g. [(4,'a'), (6,'b')]) into
-   a string (e.g. "4a6b")?
-   (bonus) Assuming numeric characters are forbidden in the original string,
-   how would you parse that string back into a list of tuples?
-}
import Data.List

main :: IO()
main = do
    let strInt = [1,4,5,6]
    print (neg strInt)
    let str = "aaannnfngggggsss"
    let strCode = encode str
    print str
    print strCode
    let strDecode = decode strCode
    print strDecode
    let str2 = concatMap tuplesToString strCode
    print str2

neg :: [Int] -> [Int]
neg = map (*(-1)) 

encode :: Eq a => [a] -> [(Int, a)]
encode x = zip (nmap x) (hmap x) 
    where
        nmap y = map length (group y)
        hmap y = map head (group y)

decode :: [(Int,a)] -> [a]
decode x = concat (decode1 x)
    where
        decode1 = map flatten
        flatten (0,_) = []
        flatten (n,c) = c : flatten (n-1,c)

tuplesToString :: (Int,Char)->String
tuplesToString (x,y) = show x ++ [y]

--divisors p = [ f | f <- [1..p], p `mod` f == 0 ] 

