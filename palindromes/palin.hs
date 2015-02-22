import System.Environment
import Data.List

main :: IO [()]
main = do
    args <- getArgs
    file <- readFile "input.txt"
    let first = read $ args !! 0
        end = read $ args !! 1
        inputs = drop first . take end $ lines file
        outputs = map optiSplit inputs
    print inputs
    print $ lstsubs $ head inputs
    mapM print outputs 

--Uses divide and consquer strategy.
--Splits into two parts; finds all palindromes spanning both parts
--For each of these pieces, it recursively calls itself on the substring
--above and below the piece, and minimizes over all the pieces
optiSplit :: String -> [String]
optiSplit [] = []
optiSplit [a] = [[a]]
optiSplit str = getShortest $ optiSplit' str mids
  where 
    l = length str `div` 2
    mids = middleParts (lstsubs str) l

optiSplit' :: String -> [(Int, [String])] -> [[String]]
optiSplit' [] [] = []
optiSplit' str [] = [optiSplit str1 ++ optiSplit str2]
  where 
    (str1, str2) = splitAt l str
    l = length str `div` 2
optiSplit' str mids = do
  (n, mids') <- mids
  mids'' <- mids'
  let (str1, _)  = splitAt n str
      (_, str2)  = splitAt (n + length mids'') str
  return $ optiSplit str1 ++ [mids''] ++ optiSplit str2

getShortest :: [[String]] -> [String]
getShortest = foldl1 minLength

minLength x y = if length x < length y then x else y

middleParts :: [[String]] -> Int -> [(Int, [String])]
middleParts lst cut = filter (\ (_, x) -> (not.null) x) $ middleParts' lst cut 0 
  where
    middleParts' lst 0 _ = []
    middleParts' (x:xs) cut n = (n, filter (\y -> length y > cut) x) : middleParts' xs (cut - 1) (n + 1)

--Returns a list of lists where each element is a palindrome and list !! i
--contains the palindromes that start with the ith character in the string
--we traverse this list in a particular way to generate partitions 
lstsubs:: String -> [[String]]
lstsubs str = map (filter isPalin) $ consSubseqs str
  where
    isPalin str' = str' == reverse str'
    consSubseqs :: String -> [[String]]
    consSubseqs x = (fil $ map fil $ map inits $ tails x)
      where fil = filter (not . null)

--This algorithm works, but it seems to be too slow
shortestSplit :: String -> [String]
shortestSplit x = getShortest $ foldSub [] $ (lstsubs $ x)

foldSub :: [[String]] -> [[String]] -> [[String]]
foldSub [] [] = []
foldSub ac [] = ac
foldSub [] (x:xs) = do
    ac' <- x
    foldSub (return [ac']) xs
foldSub ac lst = do
    ac' <- ac 
    let l = length . last $ ac'
    let lst' = drop (l-1) lst 
    remainder <- foldSub [] lst'
    return $ ac' ++ remainder



addBlanks :: [String] -> [[String]]
addBlanks a = addBlanks' a []
  where
    addBlanks' :: [String] -> [[String]] -> [[String]]
    addBlanks' [] ac = ac
    addBlanks' (x:xs) ac = addBlanks' xs $ ac ++ [[x]] ++ replicate (length x - 1) []
    






{- Just used this to outline the foldsub' function
foldSub :: [String] -> [String] -> [String]
foldSub [] [] = []
foldSub ac [] = ac
foldSub [] (x:xs) = foldSub [x] xs
foldSub ac lst = ac ++ foldSub [] (lst')
  where
    lst' = drop (l - 1) lst
    l = length . last $ ac
-}

--Nondeterministic fold over list

--splitPalin :: String -> [String]

