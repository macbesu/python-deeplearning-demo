-- Think about how you'd implement that in an imperative fashion.
-- You'd probably set up a variable to hold the maximum value so far and then you'd loop through the elements of a list and if an element is bigger than then the current maximum value, you'd replace it with that element.
-- The maximum value that remains at the end is the result. Whew! That's quite a lot of words to describe such a simple algorithm!
-- Now let's see how we'd define it recursively.
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
  | x > maxTail = x
  | otherwise = maxTail
  where maxTail = maximum' xs

-- An even clearer way to write this function is to use max. 
-- If you remember, max is a function that takes two numbers and return the bigger of them. 
-- Here's how we could rewrite maximum' by using max:
maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "maximum of empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum'' xs)

-- Num is not a subclass of Ord.
-- That means that what constitutes for a number doesn't really have to adhere to an ordering.
-- So that's why we have to specify both the Num and Ord class constrains when doing addition or subtraction and also comparison.
-- > :i Num
-- > :i Ord
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
  | n <= 0  = []
  | otherwise = x:replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
  | n <= 0     = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs

-- reverse simply reverses a list. Think about the edge condition. What is it?
-- Come on ... it's the empty list! An empty list reversed equals the empty list itself.
-- O-kay. What about the rest of it? 
-- Well, you could say that if we split a list to a head and a tail,
-- the reversed list is equal to the reversed tail and then the head at the end.
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x:repeat' x

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x     = True
    | otherwise  = a `elem'` xs


-- There's a very cool algoritm for sorting called quicksort.
-- It's a very clever way of sorting items.
-- While it takes upwards of 10 lines to implement quicksort in imperative languages,
-- the implementation is much shorter and elegant in Haskell.
-- Quicksort has become a sort of poster child for Haskell.

-- Also notice that we defined it using the verb is to define the algorithm instead of saying do this, 
-- do that, then do that...
-- That's the beauty of functional programming!
-- https://doc.yonyoucloud.com/doc/wiki/project/haskell-guide/images/quicksort.png
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted  = quicksort [a | a <- xs, a > x]
    in smallerSorted  ++ [x] ++ biggerSorted