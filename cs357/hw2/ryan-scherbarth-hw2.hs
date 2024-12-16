
{-
- You must submit a single .hs file with the
  following name: firstName-lastName-hw2.hs.
  Failure to do so will result in -10 points.

- You will lose 10 points if you put a module statement
  at the top of the file.

- You will lose 10 points for any import statements you have
  in your file and will automatically miss any problems you used
  an imported function on.

- If your file doesn't compile you will lose 10 points and miss any
  problems that were causing the compilation errors.

- This means that any function which is causing compiler errors should
  be commented out. There will be no partial credit.

- You must use the skeleton file provided and must not alter any type
  signature. If you alter a type signature you will automatically miss
  that problem.

- You will lose 10 points if you include a main function in your file.
-}

-- Problem 1: Perfect Numbers
-- Define 'perfects' function as described in the homework
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [ x | x <- [1..n], ( (sum (factors x) ) - x ) == x ]

-- Problem 2: Scalar Product
-- Define 'scalarproduct' function as described in the homework
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct [] [] = 0
scalarproduct (x:xs) (y:ys) = (x * y) + scalarproduct xs ys

-- Problem 3: Top N
-- Define 'topN' function as described in the homework
topN :: Int -> [(String, Int)] -> [String]
topN _ [] = []
topN n xs = [ x | (x,y) <- xs, y > n-1]


-- Problem 4: Riffle
-- Define 'riffle' function as described in the homework
riffle :: [a] -> [a] -> [a]
riffle a [] = a
riffle [] b = b
riffle (x:xs) (y:ys) = x : y : riffle xs ys

-- Problem 5: Library Functions
-- Define 'and', 'concat', 'replicate', '!!!', and 'elem' functions as described in the homework
and' :: [Bool] -> Bool
and' [] = True 
and' (x:xs) = x && and' xs

ins = [[1], [2], [3], [4]]
concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' i x = x : replicate' (i - 1) x


(!!!) :: [a] -> Int -> a
(!!!) (x:xs) 1 = x
(!!!) (x:xs) i = (!!!) xs (i-1)

ins2 = [1,2,3,4,5]
elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x (y:ys) = x == y || elem' x ys

-- Problem 6: Iota Iota
-- Define 'iotaIota' function without using list comprehension
iotaIota :: Int -> [(Int, Int)]
iotaIota 0 = []
iotaIota n = listBuilder(1, 1)
  where 
    next :: (Int, Int) -> (Int, Int) 
    listBuilder :: (Int, Int) -> [(Int, Int)] 
    listBuilder (a, b) = if (a == n && b == n) then [(a, b)] else (a, b):listBuilder(next(a,b))
    next (a, b) = if b == n then (a+1, 1) else (a, b+1)

-- Problem 7: Matrix Map
-- Define 'matrixMap' using the 'map' function
matrixMap :: (a -> b) -> [[a]] -> [[b]]
matrixMap _ [] = []
matrixMap x (y:ys) = map x y : matrixMap x ys

-- Problem 8: Merge
-- Define 'merge' function for merging two sorted lists
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] b = b
merge a [] = a
merge (x:xs) (y:ys) = if x < y then x : merge xs (y:ys) else y : merge (x:xs) ys

-- Problem 9: Merge Sort
-- Define 'msort' using 'merge', and first define 'halve
msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort (fst (halve xs))) (msort (snd (halve xs)))

halve :: [a] -> ([a], [a])
halve [] = ([], [])
halve xs = (take (length xs `div` 2) xs, drop (length xs `div` 2) xs)

-- Problem 10: Goldbach
-- Define 'goldbach' that returns all unique prime pairs summing to an even number
prime :: Int -> Bool 
prime n = factors n == [1,n]

goldbach :: Int -> [(Int, Int)]
goldbach 0 = []
goldbach n = [(x,y) | x <- [1..n], y <- [1..n], prime x, prime y, x<=y, x+y == n]
