import Data.List
-- import Data.List (nub, sort)
-- import Data.List hiding (nub)
import qualified Data.Map as M -- use M.filter

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

result1 = intersperse '.' "Monkey"
result2 = intersperse 0 [1,2,3,4,5]

result3 = intercalate "  " ["hey", "there", "guys"]
result4 = intercalate [0,0,0] [[1,2,3],[4,5,6],[7,8,9]]

-- transposes a list of lists. If you look at a list of lists as a 2D matrix, 
-- the columns become the rows and vice versa.
result5 = transpose [[1,2,3],[4,5,6],[7,8,9]]

result6 = concat ["foo", "bar", "car"]
result7 = concat [[1,2,3],[4,5,6],[7,8,9]]

result8 = any (==4) [2,3,5,6,1,4]
result9 = all (>4) [6,9,10]
result10 = all (`elem` ['A'..'Z']) "HEYGUYSWhatsup"
result11 = any (`elem` ['A'..'Z']) "HEYGUYSWhatsup"

-- iterate takes a function and a starting value.
-- It returns all the results in the form of an infinite list.
result12 = take 10 $ iterate (*2) 1

result13 = splitAt 3 "HEYGUS"

--------------------------------------------------------------------------------------------------------------------
-- Maybe I don't need to take all notes, this part is just some API. 😂
-- If I need, I can just check them on http://learnyouahaskell.com/modules and https://www.haskell.org/hoogle.
--------------------------------------------------------------------------------------------------------------------