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
mult Zero n2 = Zero
mult (Succ n1) n2 = add n2 (mult n1 n2)
-- DONE --

-- Tests

-- >>> mult Zero (Succ Zero)
-- Zero

-- >>> mult (Succ (Succ Zero)) (Succ (Succ (Succ Zero)))
-- Succ (Succ (Succ (Succ (Succ (Succ Zero)))))

-- >>> mult (Succ (Succ (Succ Zero))) (Succ (Succ (Succ Zero)))
-- Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))))

-- Problem 2 (Exercise 8.3)

data Tree a = Leaf a | Node (Tree a) (Tree a)
    deriving (Eq, Show)

balanced :: Tree a -> Bool
balanced tree = go tree
  where 
    leaves :: Tree a -> Int   -- leaves for a subtree
    leaves (Leaf _) = 1
    leaves (Node l r) = leaves l + leaves r   -- recursively sum leaves from all subtrees 

    -- check if tree is balanced using leaves 
    -- int -> Bool, return
    go (Leaf _) = True  -- base, leaves themselves are trivially balanced 
    go (Node l r) = abs (leaves l - leaves r) <= 1 && go l && go r
-- DONE --

-- Tests

-- >>> balanced (Node (Node (Leaf 1) (Leaf 2)) (Node (Leaf 3) (Node (Leaf 4) (Leaf 5))))
-- True

-- >>> balanced (Node (Node (Node (Leaf 1) (Leaf 1)) (Leaf 2)) (Node (Leaf 3) (Node (Leaf 4) (Leaf 5))))
-- True

-- >>> balanced (Node (Node (Node (Node (Leaf 1) (Leaf 1)) (Leaf 1)) (Leaf 2)) (Node (Leaf 3) (Node (Leaf 4) (Leaf 5))))
-- False

-- Problem 3 (Exercise 8.4) 

-- balance :: [a] -> Tree a
-- balance xs = go xs 
--   where 
--     -- Function to split a list into two halves that differ by at most 1
--     listSplit :: [a] -> ([a], [a])
--     listSplit ys = splitAt (length ys `div` 2) ys
    
--     -- Recursive function to build a balanced tree from a list
--     go :: [a] -> Tree a
--     go [x]    = Leaf x
--     go xs     = Node (go left) mid (go right)
--         where
--             (left, mid:right) = listSplit xs

balance :: [a] -> Tree a
balance xs = go xs
  where
    listSplit :: [a] -> ([a], [a])
    listSplit ys = splitAt (length ys `div` 2) ys

    go [x] = Leaf x
    go xs = Node (go l) (go r)
      where
        (l, r) = listSplit xs
-- DONE --

-- Tests

-- >>> balance [1,2,3,4,5]
-- Node (Node (Leaf 1) (Leaf 2)) (Node (Leaf 3) (Node (Leaf 4) (Leaf 5)))

-- Problem 4 (Exercise 8.5)

data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f _ (Val x) = f x
folde f g (Add x y) = g (folde f g x) (folde f g y)
-- DONE --

-- Tests

-- >>> folde (+1) (*) (Add (Add (Val 1) (Val 2)) (Val 3))
-- 24

-- >>> folde (\i -> [i]) (++) (Add (Add (Val 1) (Val 2)) (Val 3))
-- [1,2,3]

-- Problem 5 (Exercise 8.6)

eval :: Expr -> Int
eval expr = folde id (+) expr

size :: Expr -> Int
size expr = folde (\x -> 1) (+) expr
-- DONE --

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
real (ComplexInteger x y) = x

imaginary :: ComplexInteger -> Int
imaginary (ComplexInteger x y) = y

instance Eq ComplexInteger where
  (ComplexInteger x y) == (ComplexInteger z w) = (x == z) && (y == w)

instance Show ComplexInteger where
  show (ComplexInteger x y) = show x ++ "+" ++ show y ++ "i"

instance Num ComplexInteger where
  (ComplexInteger x1 y1) + (ComplexInteger x2 y2) = ComplexInteger (x1 + x2) (y1 + y2)
  (ComplexInteger x1 y1) * (ComplexInteger x2 y2) = ComplexInteger (x1 * x2 - y1 * y2) (x1 * y2 + y1 * x2)
-- DONE --

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
chopN _ [] = [] 
chopN n xs = if length xs >= n then take n xs : chopN n (drop n xs) else []

-- Tests

-- >>> chopN 4 [1..10]
-- [[1,2,3,4],[5,6,7,8]]

-- >>> chopN 8 [1..10]
-- [[1,2,3,4,5,6,7,8]]

-- >>> chopN 1 [1..10]
-- [[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]]

-- >>> chopN 2 [1..10]
-- [[1,2],[3,4],[5,6],[7,8],[9,10]]
-- DONE --

-- Problem 8  

subAlphabet :: (Eq a, Enum a) => a -> a -> [a] -> [a]
subAlphabet startLetter endLetter specialLetters = specialLetters ++ filter (`notElem` specialLetters) [startLetter..endLetter]
-- DONE --

-- Tests

-- >>> subAlphabet 'A' 'Z' "ZEBRAS"
-- "ZEBRASCDFGHIJKLMNOPQTUVWXY"

-- >>> subAlphabet 1 26 [1,4,6,2,9,10,23,17]
-- [1,4,6,2,9,10,23,17,3,5,7,8,11,12,13,14,15,16,18,19,20,21,22,24,25,26]

-- Problem 9

data Polynomial = Constant Int | MoreTerms Int Polynomial

p = MoreTerms 3 (MoreTerms 4 (Constant 5))
q = MoreTerms 6 (MoreTerms 10 (MoreTerms 35 (Constant 7)))

-- instance Show
instance Show Polynomial where
  show p = showPoly p 0 
    where 
      showPoly (Constant n) exp = show n ++ "x^" ++ show exp
      showPoly (MoreTerms n rest) exp 
        | n == 0 = showPoly rest (exp + 1) 
        | exp == 0 = show n ++ "+" ++ showPoly rest (exp + 1)
        | exp == 1 = show n ++ "x+" ++ showPoly rest (exp + 1)
        | otherwise = show n ++ "x^" ++ show exp ++ "+" ++ showPoly rest (exp+ 1)


-- instance Num
instance Num Polynomial where
  (+) (Constant a) (Constant b) = Constant (a + b)
  (+) (Constant a) (MoreTerms b p) = MoreTerms b (p + Constant a)
  (+) (MoreTerms a p) (Constant b) = MoreTerms a (p + Constant b)
  (+) (MoreTerms a p1) (MoreTerms b p2) = MoreTerms a (p1 + MoreTerms b p2)
  (*) (Constant a) (Constant b) = Constant (a * b)
  (*) (Constant a) (MoreTerms b p) = MoreTerms (a * b) (Constant a * p)
  (*) (MoreTerms a p) (Constant b) = MoreTerms (a * b) (p * Constant b)
  (*) (MoreTerms a p1) (MoreTerms b p2) = MoreTerms (a * b) (Constant a * p2 + p1 * MoreTerms b p2)


evalPoly :: Polynomial -> Int -> Int
evalPoly (Constant n) _ = n
evalPoly (MoreTerms n p) x = n + x * evalPoly p x
-- DONE --

-- Tests

-- >>> p
-- 3 + 4x + 5x^2

-- >>> evalPoly p 2
-- 31

-- Problem 10

data Pair a b = Pair a b

-- instance (Eq a, Eq b) => Eq (Pair a b) where
instance (Eq a, Eq b) => Eq (Pair a b) where
  (Pair x1 y1) == (Pair x2 y2) = x1 == x2 && y1 == y2

-- instance (Ord a, Ord b) => Ord (Pair a b) where
instance (Ord a, Ord b) => Ord (Pair a b) where
  compare (Pair x1 y1) (Pair x2 y2)
    | x1 == x2 && y1 == y2 = EQ
    | x1 < x2 || (x1 == x2 && y1 < y2) = LT
    | otherwise = GT
-- DONE --

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
safeDivide' (Just x) (Just 0) = Nothing
safeDivide' (Just x) (Just y) = safeDivide x y
safeDivide' _ _ = Nothing

hm :: [Float] -> Maybe Float
hm xs = safeDivide' (Just $ fromIntegral (length xs)) (Just $ sum (map recip xs))
-- DONE --

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