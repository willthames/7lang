colours = ["black", "white", "blue", "yellow", "red"]

combo :: [String] -> [(String,String)]

combo l = [ (x,y) | x <- l, y <- l, x < y ]
