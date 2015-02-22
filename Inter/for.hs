main :: IO ()
main = do for 1 (<10) (+1) print
          map print [1..10]

for :: a -> (a -> Bool) -> (a -> a) -> (a -> IO ()) -> IO ()
for i p f job = if p i
                    then do job i
                            for (f i) p f job
                    else do return ()


                   

