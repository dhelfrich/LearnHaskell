import Data.Char
import Data.List


main :: IO ()
main = print "hi" 

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]
