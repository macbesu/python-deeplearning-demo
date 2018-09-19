tuple1 = [(1,2), (8,11), (4,5)]
tuple2 = [("dog", 2, 4), ("cat", 4, 16)]

-- These functions operate only on pairs.
-- They won't work on triples, 4-tuples, 5-tuples, etc.
-- We'll go over extracting data from tuples in different ways a bit later.
tupleResult1 = fst (8,11)
tupleResult2 = fst ("Wow", False)
tupleResult3 = snd (8,11)
tupleResult4 = snd ("Wow", False)

tupleResult5 = zip [1,2,3,4,5] [5,5,5,5,5]
tupleResult6 = zip [1..5] ["one", "two", "three", "four", "five"]

triangles1 = take 10 [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
triangles2 = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ]
triangles3 = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a + b + c == 24 ]
