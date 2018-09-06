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
headOflostNumbers = head lostNumbers
tailOflostNumbers = tail lostNumbers
lastOflostNumbers = last lostNumbers
initOflostNumbers = init lostNumbers

isNullOrNotOflostNumbers = null lostNumbers
isNullOrNotOfAnEmptyList = null []

reverseLostNumbers = reverse lostNumbers

take3OflostNumbers = take 3 lostNumbers
take1OflostNumbers = take 1 lostNumbers
take0OflostNumbers = take 0 lostNumbers

drop3OflostNumbers = drop 3 lostNumbers
drop1OflostNumbers = drop 0 lostNumbers
drop0OflostNumbers = drop 100 lostNumbers