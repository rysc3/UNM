{-
Submission rules:

- All text answers must be given in Haskell comment
  underneath the problem header.

- You must submit a single .hs file with the
  following name: firstName-lastName-hw3.hs.
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

- You will lose 10 points if you include a *main* function in your file.
-}

-- Problem 1
curry' :: ((a, b) -> c) -> a -> b -> c
curry' f x y = f (x, y)
-- DONE --

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f (x, y) = f x y
-- DONE --


-- Problem 2
unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x | p x = [] 
               | otherwise = h x : unfold p h t (t x)
-- DONE --

chop8 :: [a] -> [[a]]
chop8 = unfold null (take 8) (drop 8)
-- DONE --

map' :: (a -> b) -> [a] -> [b]
map' f = unfold null (f . head) tail
-- DONE -- 

iterate' :: (a -> a) -> a -> [a]
iterate' f = unfold (\_ -> False) id f
-- DONE --


-- Problem 3
concatER :: [[a]] -> [a]
concatER [] = [] 
concatER (x:xs) = x ++ concatER xs
-- DONE --

concatFR :: [[a]] -> [a]
concatFR = foldr (++) []
-- DONE --

concatFL :: [[a]] -> [a]
concatFL = foldl (++) []
-- DONE --


-- Problem 4
disjunction2 :: (a -> Bool) -> (a -> Bool) -> a -> Bool
disjunction2 p1 p2 x = (p1 x) || (p2 x)
-- DONE --


-- Problem 5
disjunction :: [a -> Bool] -> a -> Bool
disjunction ps x = foldr (\y acc -> y x || acc) False ps
-- DONE --


-- Problem 6
deleteDupes :: Eq a => [a] -> [a]
-- I can't figure out how to put this in sorted order without importing something, but ex. 2 returns the list unsorted so I assume that means it's allowed
deleteDupes xs = foldr (\x acc -> if (elem x acc) then acc else x : acc) [] xs
-- DONE -- 


-- Problem 7
tally :: (a -> Bool) -> [a] -> Int
tally p xs = foldl (\acc x -> if (p x) then (acc + 1) else acc) 0 xs
-- DONE --


-- Problem 8
bangBang :: [a] -> Int -> a
bangBang xs n = foldr (\(x, y) acc -> if (y == n) then x else acc) (last xs) (zip xs [0..])   -- zips xs with it's index
-- DONE --


-- Problem 9
increasing :: Ord a => [a] -> Bool
increasing xs = foldr (\(x, y) acc -> x <= y && acc) True (zip xs (tail xs))  -- Creates the chain from class, (1,2),(2,3)...
-- DONE --


-- Problem 10
decimate :: [a] -> [a]
decimate xs = foldl (\acc (i, x) -> if (i `mod` 10 == 0) then acc else acc ++ [x]) [] (zip [1..] xs)  -- gives indexes with xs
-- DONE --


-- Problem 11
encipher :: Eq a => [a] -> [b] -> [a] -> [b]
encipher xs ys zs = map (\x -> switch x (zip xs ys)) zs
  where
    switch z ((c1, c2):rest)
      | z == c1 = c2
      | otherwise = switch z rest


-- Problem 12
prefixSum :: Num a => [a] -> [a]
prefixSum xs = reverse (pref xs 0 [])
  where 
    pref :: Num a => [a] -> a -> [a] -> [a]
    pref [] _ acc = acc 
    pref (x:xs) cur acc = pref xs (cur + x) (cur + x : acc)
-- DONE --


minesweeper :: [String] -> [String]
minesweeper grid = map (map countMines) indexGrid
  where
    indexGrid = indexTheGrid grid
    height = length grid    -- Height == length of a given grid
    width = gridWidth grid

    {-
      Create a 2D grid, with tuples representing the (x,y) coordinates of each postiion, determined by the width and height 
      of each item passed into minesweeper. We calculate the width and height separately so that the board passed in doesn't need to be squared.

      expanded
      (0,0), (1,0) ...
      (0,1), (1,1)
      ...

      flat
      [[(0,0), (1,0)], [(0,1), (1,1)]]
    -}
    indexTheGrid :: [String] -> [[(Int, Int)]]
    indexTheGrid grid = [[(x, y) | x <- [0..width-1]] | y <- [0..height-1]]

    -- length of a row == width
    gridWidth :: [String] -> Int
    gridWidth xs = length (head xs)

    {-
      Loop through each position,
      - if pos has a mine, return the mine 
      - if not, we increment the surrounding positions using the grid
    -}
    countMines :: (Int, Int) -> Char
    countMines (x, y)
      | cell == '*' = '*'  -- Check if cell is a mine
      | otherwise = intToDigit ( countMinesAround x y )
      where
        cell = checkCell grid x y

    {-
      Extracts the value we have in a given cell, when we input the coordinates
    -}
    checkCell :: [String] -> Int -> Int -> Char
    -- (!!) :: [a] -> Int -> a
    checkCell grid x y = (grid !! y) !! x   -- getCell grid 0 0     => "*"

    countMinesAround :: Int -> Int -> Int
    countMinesAround x y = length ( filter isMine adjacentCells )
      where
        adjacentCells = [(x', y') | x' <- [x-1..x+1], y' <- [y-1..y+1], inGrid x' y']  -- Select all cells that surround our given cell, pending they pass the inGrid condition
        inGrid x' y' = x' >= 0 && y' >= 0 && x' < width && y' < height   -- Checks if position is within the grid
        isMine (x', y') = checkCell grid x' y' == '*'    -- is mine


intToDigit :: Int -> Char
intToDigit 0 = '.'  -- replace for null values
intToDigit 1 = '1'
intToDigit 2 = '2'
intToDigit 3 = '3'
intToDigit 4 = '4'
intToDigit 5 = '5'
intToDigit 6 = '6'
intToDigit 7 = '7'
intToDigit 8 = '8'
intToDigit 9 = '9'
-- intToDigit 10 = '*'   -- add value for mines
-- DONE --