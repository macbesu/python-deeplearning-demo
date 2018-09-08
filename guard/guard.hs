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
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise                   = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        skinny = 18.5  
        normal = 25.0  
        fat = 30.0

--  Use where bindings to pattern match.
bmiTell4 :: (RealFloat a) => a -> a -> String
bmiTell4 weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you 're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise                   = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)  

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

