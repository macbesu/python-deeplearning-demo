lostNumbers = [1, 2, 3, 5, 10]
lostStrList = ['2', '3', '4', '5']
lostStr = "2345"

-- ['2', '3', '4', '5'] is actually just syntactic sugar for '2':'3':'4':'5':[]
lostStrListAppend = '2':'3':'4':'5':[]

strBool1 = lostStrList == lostStr
strBool2 = lostStrList == lostStrListAppend

-- That's not a problem when dealing with lists that aren't too big.
-- But putting something at the end of a list that's fifty million entries long is going to take a while.
newStr = lostStrList ++ " " ++ lostStr 

lostStrListIndex0 = lostStrList !! 0
lostStrListIndex1 = lostStrList !! 1

nestedList = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]] ++ [[1,1,1,1]]

-- "head []": Exception: Prelude.head: empty list 
-- When using head, tail, last and init, be careful not to use them on empty lists.
headOfLostNumbers = head lostNumbers
tailOfLostNumbers = tail lostNumbers
lastOfLostNumbers = last lostNumbers
initOfLostNumbers = init lostNumbers

isNullOrNotOfLostNumbers = null lostNumbers
isNullOrNotOfAnEmptyList = null []

reverseLostNumbers = reverse lostNumbers

take3OfLostNumbers = take 3 lostNumbers
take1OfLostNumbers = take 1 lostNumbers
take0OfLostNumbers = take 0 lostNumbers

drop3OfLostNumbers = drop 3 lostNumbers
drop1OfLostNumbers = drop 0 lostNumbers
drop0OfLostNumbers = drop 100 lostNumbers

maximumOfLostNumbers = maximum lostNumbers
minimumOfLostNumbers = minimum lostNumbers

sumOfLostNumbers = sum lostNumbers
productOfLostNumbers = product lostNumbers

elemOfLostNumbers1 = 2 `elem` lostNumbers
elemOfLostNumbers2 = 6 `elem` lostNumbers

-- Watch out when using floating point numbers in ranges!
-- Because they are not completely precise (by definition), 
-- their use in ranges can yield some pretty funky results.
-- Advice is not to use them (floating point numbers) in list ranges.
range1 = [1..20]
range2 = ['a'..'z']
range3 = ['K'..'Y']
range4 = [20,19..1]

-- Sure, you could do [13,26..24*13]. But there's a better way as belows.
-- Because Haskell is lazy, it won't try to evaluate list immediately because it would never finish.
-- It'll wait to see what you want to get out of that infinite lists.
-- And here it sees you just want the first 24 elements and it gladly obliges.
range5 = take 24 [13,26..]

cycle1 = take 10 (cycle [1, 2, 3])
cycle2 = take 12 (cycle "LOL ")

repeat1 = take 10 (repeat 5)
repeat2 = replicate 3 10

setComprehension1 = [x * 2 | x <- [1..10]]
setComprehension2 = [x * 2 | x <- [1..10], x * 2 >= 12]
setComprehension3 = [x | x <- [50..100], x `mod` 7 == 3]
setComprehension4 = [x | x <- [10..20], x /= 13, x /= 14, x /= 19]
setComprehension5 = [x * y | x <- [2,5,10], y <- [8,10,11], x * y > 50]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x ]
boomBangsResult1 = boomBangs [2..13]

-- How about a list comprehension that combines a list of adjectives and a list of nouns ...
-- for epic hilarity
nouns = ["hobo","frog","pope"]
adjectives = ["lazy","grouchy","scheming"]
listComprehension = [adjectives ++ " " ++ nouns | adjectives <- adjectives, nouns <- nouns]

-- Ok. Let's write our own version of length! We'll call it length'.
length' xs = sum [ 1 | _ <- xs]
lengthOfLostNumbers = length' lostNumbers

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
removeNonUppercaseResult1 = removeNonUppercase "Hahaha! Ahahaha!"
removeNonUppercaseResult2 = removeNonUppercase "IdontLIKEFROGS"

nestedList2 = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
nestedListResult1 = [ [ x | x <- xs, even x ] | xs <- nestedList2 ]
