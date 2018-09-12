divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- The only special thing about sections is using -. From the definition of sections,
-- (-4) would result in a function that takes a number and subtracts 4 from it.
-- However, for convenience, (-4) means minus four. 
-- So if you want to make a function that subtracts 4 from the number it gets as a parameter,
-- partially apply the subtract function like so: (subtract 4).

-- Functions can take functions as parameters and also return functions.
-- To illustrate this, we're going to make a function that takes a function and then applies it twice to something!
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

result1 = zipWith' (+) [4,2,5,6] [2,6,2,3]
result2 = zipWith' max [6,3,2,1] [7,3,1,5]
result3 = zipWith' (++) ["foo ","bar ","baz "] ["fighters","hoppers","aldrin"]
result4 = zipWith' (*) (replicate 5 2) [1..]
result5 = zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where g x y = f y x

-- But because functions are curried by default, the second pair of parentheses is really unnecessary, 
-- because -> is right associative by default. (a -> b -> c) -> (b -> a -> c) is the same as (a -> b -> c) -> (b -> (a -> c)), 
-- which is the same as (a -> b -> c) -> b -> a -> c
flip'' :: (a -> b -> c) -> b -> a -> c  
flip'' f y x = f x y  

result6 = flip' zip [1,2,3,4,5] "hello"  
result7 = zipWith (flip' div) [2,2..] [10,8,6,4,2]  
result8 = map (+3) [1,5,3,1,6]  
result9 = map (replicate 3) [3..6]
result10 = filter (>3) [1,5,3,2,1,6,4,3,2,1]  
result11 = let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]


-- We can achieve the same functionality in a more readable way by using filter:
quicksort :: (Ord a) => [a] -> [a]    
quicksort [] = []    
quicksort (x:xs) =     
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort (filter (>x) xs)   
    in  smallerSorted ++ [x] ++ biggerSorted  

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000, 99999..])
  where p x = x `mod` 3829 == 0

result12 = sum (takeWhile (<10000) [m | m <- [n^2 | n <- [1..]], odd m])
result13 = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))

-- Next, we'll be dealing with Collatz sequences.
-- We take a natural number. If that number is even, we divide it by two. 
-- If it's odd, we multiply it by 3 and then add 1 to that.
-- It is thought that for all starting numbers, the chains finish at the number 1.
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd n = n:chain (n*3 + 1)
