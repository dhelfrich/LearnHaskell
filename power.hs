main = putStrLn (show ( power 3 4))

power _ 0 = 1
power x y = (power x (y-1))*x
