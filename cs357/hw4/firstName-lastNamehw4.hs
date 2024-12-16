{-
Submission rules:

- All text answers must be given in Haskell comment
  underneath the problem header.

- You must submit a single .hs file with the
  following name: firstName-lastName-hw4.hs.
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

-- Problem 1 (Exercise 8.1)

data Nat = Zero | Succ Nat
    deriving (Eq, Show)

nat2Int :: Nat -> Int
nat2Int Zero     = 0
nat2Int (Succ n) = 1 + nat2Int n

int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat n = Succ (int2Nat (n - 1))

add :: Nat -> Nat -> Nat
add Zero n2      = n2 
add (Succ n1) n2 = Succ (add n1 n2)

mult :: Nat -> Nat -> Nat
mult = undefined

-- Tests

-- >>> mult Zero (Succ Zero)
-- Zero

-- >>> mult (Succ (Succ Zero)) (Succ (Succ (Succ Zero)))
-- Succ (Succ (Succ (Succ (Succ (Succ Zero)))))

-- >>> mult (Succ (Succ (Succ Zero))) (Succ (Succ (Succ Zero)))
-- Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))))

-- Problem 2 (Exercise 8.3)

data Tree a = Leaf a | Node (Tree a) a (Tree a)
    deriving (Eq, Show)

balanced :: Tree a -> Bool
balanced = undefined

-- Tests

-- >>> balanced (Node (Node (Leaf 1) (Leaf 2)) (Node (Leaf 3) (Node (Leaf 4) (Leaf 5))))
-- True

-- >>> balanced (Node (Node (Node (Leaf 1) (Leaf 1)) (Leaf 2)) (Node (Leaf 3) (Node (Leaf 4) (Leaf 5))))
-- True

-- >>> balanced (Node (Node (Node (Node (Leaf 1) (Leaf 1)) (Leaf 1)) (Leaf 2)) (Node (Leaf 3) (Node (Leaf 4) (Leaf 5))))
-- False

-- Problem 3 (Exercise 8.4) 

balance :: [a] -> Tree a
balance = undefined

-- Tests

-- >>> balance [1,2,3,4,5]
-- Node (Node (Leaf 1) (Leaf 2)) (Node (Leaf 3) (Node (Leaf 4) (Leaf 5)))

-- Problem 4 (Exercise 8.5)

data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde = undefined

-- Tests

-- >>> folde (+1) (*) (Add (Add (Val 1) (Val 2)) (Val 3))
-- 24

-- >>> folde (\i -> [i]) (++) (Add (Add (Val 1) (Val 2)) (Val 3))
-- [1,2,3]

-- Problem 5 (Exercise 8.6)

eval :: Expr -> Int
eval = undefined

size :: Expr -> Int
size = undefined

-- Tests

-- >>> eval (Add (Add (Val 1) (Val 2)) (Val 3))
-- 6

-- >>> size (Add (Add (Val 1) (Val 2)) (Val 3))
-- 3

-- Tests
-- >>> eval (Add (Add (Val 1) (Val 2)) (Val 3))
-- 6

-- >>> size (Add (Add (Val 1) (Val 2)) (Val 3))
-- 3

-- Problem 6

data ComplexInteger = ComplexInteger Int Int 

real :: ComplexInteger -> Int
real = undefined

imaginary :: ComplexInteger -> Int
imaginary = undefined

instance Eq ComplexInteger where

instance Show ComplexInteger where

instance Num ComplexInteger where

-- Tests

-- >>> real (ComplexInteger 1 2)
-- 1

-- >>> imaginary (ComplexInteger 1 2)
-- 2

-- >>> (ComplexInteger 1 2) == (ComplexInteger 3 4)
-- False

-- >>> ComplexInteger 1 2
-- 1+2i

-- >>> (ComplexInteger 1 2) * (ComplexInteger 3 4)
-- -5+10i

-- Problem 7

chopN :: Int -> [a] -> [[a]]
chopN = undefined

-- Tests

-- >>> chopN 4 [1..10]
-- [[1,2,3,4],[5,6,7,8]]

-- >>> chopN 8 [1..10]
-- [[1,2,3,4,5,6,7,8]]

-- >>> chopN 1 [1..10]
-- [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]

-- >>> chopN 2 [1..10]
-- [[1,2],[3,4],[5,6],[7,8],[9,10]]

-- Problem 8  

subAlphabet :: (Eq a, Enum a) => a -> a -> [a] -> [a]
subAlphabet = undefined

-- Tests

-- >>> subAlphabet 'A' 'Z' "ZEBRAS"
-- "ZEBRASCDFGHIJKLMNOPQTUVWXY"

-- >>> subAlphabet 1 26 [1,4,6,2,9,10,23,17]
-- [1,4,6,2,9,10,23,17,3,5,7,8,11,12,13,14,15,16,18,19,20,21,22,24,25,26]

-- Problem 9

data Polynomial = Constant Int | MoreTerms Int Polynomial

p = MoreTerms 3 (MoreTerms 4 (Constant 5))

-- instance Show
-- instance Num

evalPoly :: Polynomial -> Int -> Int
evalPoly = undefined

-- Tests

-- >>> p
-- 3 + 4x + 5x^2

-- >>> evalPoly p 2
-- 33

-- Problem 10

data Pair a b = Pair a b

-- instance (Eq a, Eq b) => Eq (Pair a b) where

-- instance (Ord a, Ord b) => Ord (Pair a b) where

-- Tests

-- >>> Pair 1 2 == Pair 1 2
-- True

-- >>> Pair 1 2 == Pair 2 1
-- False


-- >>> Pair 1 2 < Pair 2 1
-- True

-- >>> Pair 1 2 > Pair 1 1
-- True

-- >>> Pair 1 2 > Pair 1 3
-- False


-- Problem 11

safeDivide :: Float -> Float -> Maybe Float
safeDivide x y = if y == 0 then Nothing else Just (x / y)

safeDivide' :: Maybe Float -> Maybe Float -> Maybe Float
safeDivide' = undefined

hm :: [Float] -> Maybe Float
hm = undefined

-- Tests

-- >>> hm [2.0, 2.0]
-- Just 2.0

-- >>> hm [1.0, 1.0]
-- Just 1.0

-- >>> hm [0.5, 0.5, 1.0]
-- Just 0.6

-- >>> hm [1.0, -1.0]
-- Nothing

-- >>> hm [1.0, -2.0, -2.0]
-- Nothing

-- >>> hm [1.0, -2.0]
-- Just 4.0