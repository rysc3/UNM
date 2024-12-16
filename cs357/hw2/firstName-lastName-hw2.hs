
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
perfects :: Int -> [Int]
perfects = undefined

-- Problem 2: Scalar Product
-- Define 'scalarproduct' function as described in the homework
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct = undefined

-- Problem 3: Top N
-- Define 'topN' function as described in the homework
topN :: Int -> [(String, Int)] -> [String]
topN = undefined

-- Problem 4: Riffle
-- Define 'riffle' function as described in the homework
riffle :: [a] -> [a] -> [a]
riffle = undefined

-- Problem 5: Library Functions
-- Define 'and', 'concat', 'replicate', '!!!', and 'elem' functions as described in the homework
and' :: [Bool] -> Bool
and' = undefined

concat' :: [[a]] -> [a]
concat' = undefined

replicate' :: Int -> a -> [a]
replicate' = undefined

(!!!) :: [a] -> Int -> a
(!!!) = undefined

elem' :: Eq a => a -> [a] -> Bool
elem' = undefined

-- Problem 6: Iota Iota
-- Define 'iotaIota' function without using list comprehension
iotaIota :: Int -> [(Int, Int)]
iotaIota = undefined

-- Problem 7: Matrix Map
-- Define 'matrixMap' using the 'map' function
matrixMap :: (a -> b) -> [[a]] -> [[b]]
matrixMap = undefined

-- Problem 8: Merge
-- Define 'merge' function for merging two sorted lists
merge :: Ord a => [a] -> [a] -> [a]
merge = undefined

-- Problem 9: Merge Sort
-- Define 'msort' using 'merge', and first define 'halve'
msort :: Ord a => [a] -> [a]
msort = undefined

halve :: [a] -> ([a], [a])
halve = undefined

-- Problem 10: Goldbach
-- Define 'goldbach' that returns all unique prime pairs summing to an even number
goldbach :: Int -> [(Int, Int)]
goldbach = undefined
