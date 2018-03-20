import Data.List
import Data.Char

add  :: Integer -> Integer -> Integer
add x y =  x + y

-- 1: inlist [2,3,2,4,7,9] 7
inlist :: [Int] -> Int -> Bool
inlist x y = elem y x

-- 2: exactlyonce [2,3,2,4,3] 3
-- //TODO : exactlyonce [1..] 15
exactlyonce :: [Int] -> Int -> Bool
exactlyonce x y = listLengthOne (y `elemIndices` x)

-- 3: equalones [1,2,0] [3,5,1,1]
equalones :: [Int] -> [Int] -> Bool
equalones xs ys = countElement 1 xs == countElement 1 ys

-- 4: replacenew 2 [3,6,9] -- Return a list each element (x-y)*(x-y)
replacenew :: Int -> [Int] -> [Int]
replacenew x xs = map (mult x) xs

-- 5: addthemup [[1,3],[3,7]]
addthemup :: [[Int]] -> Int
addthemup xss = foldr (*) 1 (map (sum) xss)

 -- square y = y*y

-- 6: repeatnew f 1 2 = f 2
-- repeatnew :: (a -> a) -> a -> a
-- repeatnew f x = f (f x)

repeatnew :: (a -> a) -> Int -> a -> a

repeatnew _ 0 input   = input
repeatnew f 1 input   = f input
repeatnew f num input = repeatnew f (num - 1) (f input)


-- FUNCTIONS --

--2
listLengthOne :: [Int] -> Bool
listLengthOne xs = length xs == 1

--3
countElement :: Int -> [Int] -> Int
countElement x = length . filter (==x)

--4
mult :: Int -> Int -> Int
mult x y = (x-y)*(x-y)
