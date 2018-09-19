-- The thing is that guards are a lot more readable when you have serveral conditions
-- and they play really nicely with patterns.
bmiTell1 :: (RealFloat a) => a -> String
bmiTell1 bmi
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you 're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise   = "You're a whale, congratulations!"

bmiTell2 :: (RealFloat a) => a -> a -> String
bmiTell2 weight height
  | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
  | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you 're ugly!"
  | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise                   = "You're a whale, congratulations!"

-- Since we repeat the same expression three times, 
-- it would be ideal if we could calculate it once, 
-- bind it to a name and then use that name instead of the expression.
bmiTell3 :: (RealFloat a) => a -> a -> String
bmiTell3 weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you 're ugly!"
  | bmi <= fat    = "You're fat! Lose some weight, fatty!"
  | otherwise     = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        skinny = 18.5  
        normal = 25.0  
        fat = 30.0

--  Use where bindings to pattern match.
bmiTell4 :: (RealFloat a) => a -> a -> String
bmiTell4 weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you 're ugly!"
  | bmi <= fat    = "You're fat! Lose some weight, fatty!"
  | otherwise     = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)  

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname

max' :: (Ord a) => a -> a -> a
max' a b
  | a > b     = a
  | otherwise = b

max'' a b | a > b = a | otherwise = b

compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b
  | a > b     = GT
  | a == b    = EQ
  | otherwise = LT

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^2
  in sideArea + 2 * topArea

-- The form is let <bindings> in <expression>.
result1 = [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]
result2 = 4 * (if 10 > 5 then 10 else 0) + 2
result3 = 4 * (let a = 9 in a + 1) + 2

-- Then can also be userd to introduce functions in a local scope.
result4 = [let square x = x * x in (square 5, square 3, square 2)]
result5 = (let a = 100; b = 200; c = 300 in a * b * c, let foo = "Hey "; bar = "there!" in foo ++ bar)

-- You can pattern match with let bindings. 
-- They're very useful for quickly dismantling a tuple into components and binding them to names and such.
result6 = (let (a,b,c) = (1,2,3) in a+b+c) * 100

-- We include a let inside a list comprehension much like we would a predicate,
-- only it doesn't filter the list, it only binds to names.
-- The names defined in a let inside a list comprehension are visible to the output function (the part before the |)
-- and all predicates and sections that come after of the binding.
-- So we could make our function return only the BMIs of fat people:
-- We can't use the bmi name in the (w, h) <- xs part because it's defined prior to the let binding.
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]