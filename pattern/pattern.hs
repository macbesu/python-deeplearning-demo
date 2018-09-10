lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you'are out of luck, pal!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5!"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)

-- To add together two vectors, we add their x components separately
-- and then their y components separately.
-- Here's how we would have done it if we didn't know about pattern matching:
-- ↓
-- addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
-- addVectors a b = (fst a + fst b, snd a + snd b)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- fst and snd extract the components of pairs. But what about triples?
-- Well, there are no provided functions that do that but we can make our own.
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- Let's make our own implementation of the head function.
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- The syntax for case expressions is pretty simple:
-- case <expression> of <pattern> -> result
--                      <pattern> -> result
--                      <pattern> -> result
--                      ...
head'' :: [a] -> a
head'' xs = case xs of [] -> error "No head for empty lists!"
                       (x:_) -> x

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of []  -> "emplty."
                                               [x] -> "a singleton list."
                                               xs  -> "a longer list."

describeList' xs = "The list is" ++ what xs
  where what []  = "empty."
        what [x] = "a singleton list."
        what xs  = "a longer list."