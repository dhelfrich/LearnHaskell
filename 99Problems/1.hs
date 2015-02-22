
main :: IO ()
main = do
    print $ myLast [2,2,3,4]
    print $ myLast ['a'..'z']

myLast :: [a] -> a
myLast  [x] = x
myLast (x:xs) = myLast xs
