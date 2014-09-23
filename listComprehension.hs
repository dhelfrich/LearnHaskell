
{-Write a returnDivisible :: Int -> [Int] -> [Int] function which filters a list of integers retaining only the numbers divisible by the integer passed as first argument. For integers x and n, x is divisible by n if (mod x n) == 0 (note that the test for evenness is a specific case of that).
Write, using list comprehension syntax, a function definition with no case analysis (that is, without multiple equations, if, case, or similar constructs) a [[Int]] -> [[Int]] function which, takes a list of lists of Int and returns a list of the tails of those lists using, as filtering condition, that the head of each [Int] must be larger than 5. Also, your function must not trigger an error when it meets an empty [Int], so you'll need to add an additional test to detect emptiness.
Does order matter when listing the conditions for list comprehension? (You can find it out by playing with the function you wrote for the first part of the exercise.)
Over this section we've seen how list comprehensions are essentially syntactic sugar for filter and map. Now work in the opposite direction and define alternative versions of the filter and map using the list comprehension syntax.
Rewrite doubleOfFirstForEvenSeconds using filter and map instead of list comprehension.
-}

main :: IO()
main = do let list2 = [1,5,7,3,2,7,9,100,8,30]
          let listlists = [[6,7,8,9],[1,5,7,8],[3,6],[6,7],[7,8],[]]
          print (returnDivisible 2 list2)
          print (returnHeadBigger5 listlists)


returnDivisible :: Int -> [Int] -> [Int]
returnDivisible n = filter (isDivisible n)
    where isDivisible x y = (y `mod` x) == 0

returnHeadBigger5 :: [[Int]] -> [[Int]]
returnHeadBigger5 listOflists = [ls | ls <- listOflists, not (null ls), head ls > 5] 
