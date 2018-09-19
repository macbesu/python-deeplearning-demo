main = do
    putStrLn "hello, world"
    putStrLn "hey, what's your name?"
    name <- getLine
    putStrLn ("hey " ++ name ++ ", you rock!")