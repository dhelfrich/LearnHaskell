main = do
        let myCar = Car {company = "Subaru", model= "Forester", year= 2001}
        print myCar

data Car = Car { company :: String
               , model   :: String
               , year    :: Int
               } deriving (Show)
tellCar :: Car -> String
tellCar (Car {company = c, model = m, year = y}) =
    "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

data IntMaybe = INothing | IJust Int
