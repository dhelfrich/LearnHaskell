main :: IO ()
main = print $ dupli [1..9]

dupli :: [a] -> [a]
dupli x = foldr (\a b -> a:a:b) [] x 
