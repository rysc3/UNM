
-- Homework 1 Due February 8th 11:59 pm

{-
Submission rules:

- All text answers must be given in Haskell comment underneath the problem header.
- You must submit a single .hsd file with the following name: firstName-lastName-hw1.hs.
  Failure to do so will result in -10 points.
- You will lose 10 points if you put a module statement at the top of the file.
- You will lose 10 points for any import statements you have in your file and will 
  automatically miss any problems you used an imported function on.
- If your file doesn't compile you will lose 10 points and miss any problems that 
  were causing the compilation errors.
- This means that any function which is causing compiler errors should be commented out.
  You can still get partial credit if a function has compiler errors.
- You must use the skeleton file provided and must not alter any type signature.
  If you alter a type signature you will automatically miss that problem.
-}

-- Problem 1 Prelude Types (1 pt each, 15 pts)
-- Give the type of each of the following builtin Haskell functions.
-- Provide your answers in Haskell comments below each function.

-- head ::
-- head :: GHC.Stack.Types.HasCallStack => [a] -> a

-- tail ::
-- tail :: GHC.Stack.Types.HasCallStack => [a] -> [a]

-- fst ::
-- fst :: (a, b) -> a

-- snd ::
-- snd :: (a, b) -> b

-- length ::
-- length :: Foldable t => t a -> Int

-- null ::
-- null :: t a -> Bool

-- take ::
-- null :: Foldable t => t a -> Bool

-- drop ::
-- drop :: Int -> [a] -> [a]

-- sum ::
-- sum :: (Foldable t, Num a) => t a -> a

-- product ::
-- product :: (Foldable t, Num a) => t a -> a

-- (++) ::
-- (++) :: [a] -> [a] -> [a]

-- (!!) ::
-- (!!) :: GHC.Stack.Types.HasCallStack => [a] -> Int -> a

-- elem ::
-- elem :: (Foldable t, Eq a) => a -> t a -> Bool

-- (:) ::
-- (:) :: a -> [a] -> [a]

-- last ::
-- last :: GHC.Stack.Types.HasCallStack => [a] -> a


-- Problem 2 More Types (1 pt each, 15 pts)
-- What is the type of the following Haskell expressions?
-- Provide your answers in Haskell comments below each expression.

-- True ::
-- True :: Bool

-- not True ::
-- not True :: Bool

-- not ::
-- not :: Bool -> Bool

-- 1 + 2 ::
-- 1 + 2 :: Num a => a

-- (+) 1 2 ::
-- (+) 1 2 :: Num a => a

-- (+) 1 ::
-- (+) 1 :: Num a => a -> a

-- (+) ::
-- (+) :: Num a => a -> a -> a

-- [True, False] ::
-- [True, False] :: [Bool]

-- [1, 2, 3] ::
-- [True, False] :: [Bool] :: [Bool]

-- [1, 2, 3] ++ [4, 5, 6] ::
-- [1, 2, 3] ++ [4, 5, 6] :: Num a => [a]

-- [] ::
-- [] :: [a]

-- [[]] ::
-- [[]] :: [[a]]

-- [[], []] ::
-- [[], []] :: [[a]]

-- take 10 [] ::
-- take 10 [] :: [a]

-- take 10 ::
-- take 10 :: [a] -> [a]

-- Problem 3 Layout (3 pts each, 15 pts)
-- Fix the error in each of the following pieces of code.

f = x + y
  where
    x = 1
    y = 2

g x y = x + y

foo x y = x + y

h = [1,2,3] ++ [4,5,6]

u = x * y
  where
    x = 1
    y = 2

-- Problem 4 Classes (3 pts each, 18 pts)
-- For each problem give a list of functions separated by commas.
-- For example, the Eq typeclass defines the (==), (/=) functions.
-- Provide your answers in Haskell comments below each question.

-- Which functions does the Ord typeclass define?
{-
  compare :: a -> a -> Ordering
  (<) :: a -> a -> Bool
  (<=) :: a -> a -> Bool
  (>) :: a -> a -> Bool
  (>=) :: a -> a -> Bool
  max :: a -> a -> a
  min :: a -> a -> a
-}

-- Which functions does the Show typeclass define?
{-
  showsPrec :: Int -> a -> ShowS
  show :: a -> String
  showList :: [a] -> ShowS
-}

-- Which functions does the Read typeclass define?
{-
  readsPrec :: Int -> ReadS a
  readList :: ReadS [a]
  GHC.Read.readPrec :: Text.ParserCombinators.ReadPrec.ReadPrec a
  GHC.Read.readListPrec :: Text.ParserCombinators.ReadPrec.ReadPrec
-}

-- Which functions does the Num typeclass define?
{-
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
-}

-- Which functions does the Integral typeclass define?
{-
  quot :: a -> a -> a
  rem :: a -> a -> a
  div :: a -> a -> a
  mod :: a -> a -> a
  quotRem :: a -> a -> (a, a)
  divMod :: a -> a -> (a, a)
  toInteger :: a -> Integer
-}

-- Which functions does the Fractional typeclass define?
{-
  (/) :: a -> a -> a
  recip :: a -> a
  fromRational :: Rational -> a
-}

-- Problem 5 Functions (37 pts)

-- (5 pts) (Chapter 4 Exercise 1)
halve :: [a] -> ([a], [a])
-- halve = undefined -- Define your function here
halve xs = (take n xs, drop n xs)
  where n = length xs `div` 2

-- (10 pts) (Chapter 4 Exercise 2)
fourth1 :: [a] -> a
-- fourth1 = undefined -- Define your function here using the head and tail functions.
fourth1 xs = head (tail (tail (tail xs)))

fourth2 :: [a] -> a
-- fourth2 = undefined -- Define your function here using the !! function.
fourth2 xs = xs !! 3

fourth3 :: [a] -> a
-- fourth3 = undefined -- Define your function here using pattern matching.
fourth3 (_:_:_:x:_) = x

-- (22 pts) (Chapter 4 Exercise 8)
luhnDouble :: Int -> Int
-- luhnDouble = undefined -- Define your function here
luhnDouble x = 
  if x * 2 > 9 
  then x * 2 - 9 
  else x * 2  

luhn :: Int -> Int -> Int -> Int -> Bool
-- luhn = undefined -- Define your function here
luhn x y z h = mod (luhnDouble x + y + luhnDouble z + h) 10 == 0
