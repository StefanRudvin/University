import Data.List
import Data.Char

-- 1: inlist
-- elem : Boolean if element y is in list x
inlist :: [Int] -> Int -> Bool
inlist x y = elem y x

-- 2: exactlyonce
-- This recursive solution works for lists such as  exactlyonce [15..] 15,
-- but will run indefinitely for lists such as exactlyonce [16..] 15.
-- Therefore it will not work for all infinite lists
exactlyonce :: [Int] -> Int -> Bool
exactlyonce [] y = False
exactlyonce (x:xs) y = (x == y) || exactlyonce xs y

-- 3: equalones
-- uses countElement helper function
-- countElement: returns the number of given element in given list
equalones :: [Int] -> [Int] -> Bool
equalones xs ys = countElement 1 xs == countElement 1 ys

-- 4: replacenew 2 [3,6,9]
-- uses mult helper function to abstract out the multiplication
-- mult: return (x-y)*(x-y)
replacenew :: Int -> [Int] -> [Int]
replacenew x xs = map (mult x) xs

-- 5: addthemup
-- use foldr to multiply all the outputs of map (sum) together
addthemup :: [[Int]] -> Int
addthemup xss = foldr (*) 1 (map (sum) xss)

-- 6: repeatnew
-- recursively run the function with input y while lowering x
repeatnew :: (a -> a) -> Int -> a -> a
repeatnew _ 0 x   = x -- Take care of edge case
repeatnew f 1 x   = f x
repeatnew f x y = repeatnew f (x - 1) (f y)

-- 7: antepenultimate1
-- use init xs twice to get antepenultimate value
-- Test edge case with xs < 3 as list will be too short to have antepenultimate
antepenultimate1 :: [Int] -> Bool
antepenultimate1 xs = if length xs < 3 then False else (last $ init $ init xs) == 1

-- 8: sequenceones
sequenceones :: [Int] -> Bool
sequenceones xs = [1, 1] `isInfixOf` xs

---- HELPER FUNCTIONS -----

-- countElement
countElement :: Int -> [Int] -> Int
countElement x = length . filter (==x)

-- mult
mult :: Int -> Int -> Int
mult x y = (x-y)*(x-y)

-- square
square y = y*y

---- EXAMPLES -----

-- 1.
-- Main> inlist [2,3,2,4,7,9] 7
-- True
-- Main> inlist [2..100] 101
-- False
-- Main> inlist [2..] 101
-- True
-- Main> inlist [9998..] 9999
-- True
-- Main> inlist [0..] 0
-- True

-- 2.
-- Main> exactlyonce [2,3,2,4,3] 3
-- False
-- Main> exactlyonce [3..30] 15
-- True
-- Main> exactlyonce [1,9999,2,4,2,9999,1000000] 9999
-- False
-- Main> exactlyonce [1,9999,2,4,2,9999,1000000] 1000000
-- True
-- Main> exactlyonce [15..] 15
-- True
-- Main> exactlyonce [16..] 15
-- Infinite loop

-- 3.
-- Main> equalones [1,2,0] [3,5,1,1]
-- False
-- Main> equalones [1,0] [0]
-- False
-- Main> equalones [1,0,0,1] [0,1,1,0]
-- True
-- Main> equalones [1,1,1,1,1,1,1,1] [1,4,2,1,1,1,1,1]
-- False
-- Main> equalones [1,1,1,1,1,1,1,1] [1,4,2,1,1,1,1,1,1,1]
-- True

-- 4.
-- Main> replacenew 2 [3,6,9]
-- [1,16,49]
-- Main> replacenew 8 [20,123,999]
-- [144,13225,982081]
-- Main> replacenew 100 [0,7,999]
-- [10000,8649,808201]

-- 5.
-- Main> addthemup [[1,3],[3,7]]
-- 40
-- Main> addthemup [[1,2,3],[9]]
-- 54
-- Main> addthemup [[1,2],[]]
-- 0
-- Main> addthemup [[1,2],[1,3],[4,5,7],[2]]
-- 384
-- Main> addthemup [[9999,9999],[19919191,191293,12312919],[0]]
-- 0
-- Main> addthemup [[9999,9999],[19919191,191293,12312919],[9999]]
-- 6483383728726806

-- 6.
-- Main> repeatnew square 1 2
-- 4
-- Main> repeatnew square 2 2
-- 16
-- Main> repeatnew square 4 1
-- 1
-- Main> repeatnew square 10 0.999
-- 0.35897928
-- Main> repeatnew square 23 1.000000000000001
-- 1.0000000093132257
-- Main> repeatnew (* 4) 4 4
-- 1024

-- 7.
-- Main> antepenultimate1 []
-- False
-- Main> antepenultimate1 [1,0,1,1,0]
-- True
-- Main> antepenultimate1 [1,0,0,1,1]
-- False
-- Main> antepenultimate1 [1,0,1,0,1,0]
-- False
-- Main> antepenultimate1 [1,1,1]
-- True
-- Main> antepenultimate1 [1,1]
-- False
-- Main> antepenultimate1 [0,0,0,0,0,0,0,0,0,1]
-- False

-- 8.
-- Main> sequenceones []
-- False
-- Main> sequenceones [1,0,1,1,0]
-- True
-- Main> sequenceones [1,0,0,1,0,1]
-- False
-- Main> sequenceones [1,0,1,0,1]
-- False
-- Main> sequenceones [1,0,1,1,1,1,1,1,1,1,1,1,1,1,1]
-- True
-- Main> sequenceones [99,99,99,99,1,1]
-- True
