import           Control.Monad.Writer 

newtype DiffList a = DiffList { getDiffList :: [a] -> [a] }

toDiffList :: [a] -> DiffList a
toDiffList xs = DiffList (xs++)

fromDiffList :: DiffList a -> [a]
fromDiffList (DiffList f) = f []

instance Monoid (DiffList a) where
    mempty = DiffList (\xs -> [] ++ xs)
    (DiffList f) `mappend` (DiffList g) = DiffList (\xs -> f (g xs))

main :: IO ()
main = do
        mapM_ putStrLn . fromDiffList . snd . runWriter $ finalCountDown 100000
        mapM_ putStrLn . snd . runWriter $ finalCountDownBad 100000


finalCountDown :: Int -> Writer (DiffList String) ()
finalCountDown 0 = do
    tell (toDiffList ["0"])
finalCountDown x = do
    finalCountDown (x-1)
    tell (toDiffList [show x])

finalCountDownBad :: Int -> Writer [String] ()
finalCountDownBad 0 = do
    tell ["0"]
finalCountDownBad x = do
    finalCountDownBad (x-1)
    tell [show x]
