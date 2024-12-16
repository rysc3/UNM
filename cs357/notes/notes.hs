-- Compile code: `gchi <FILE_NAME>`
-- Reload: `:r`
-- Type: `:t`
-- Shell Command in gchi: `:! <COMMAND>`

---- Type Signatures ----
-- v :: T 
-- v is of type T

-- `T -> U` 
-- Denotes a function (takes in T, returns U)

-- ex
prod :: Int -> Int -> Int
prod x y = x * y

notNot b = not (not b)


-- Basic Types: 
-- Bool, Char, String, Int, Float/double

-- List Types 
-- [T] is a list of T, type of list has nothing to do with its length

-- Tuples 
-- Denoted with parenthesis ()
-- ex: (Int, Float) means a tuple of an Int and a Float
-- type of a tuple does tell you uhow many elements it has
-- ex: :t (1, False, 1.0) :: (Fractional c, Num a) => (a, Bool, c)

-- Lambdas 
-- denoted as \[args] -> [body]
-- essentailly a localized function that doesn't have a name
-- generally use lambda when you can keep below 20 characters, otherwise make a normal function.
-- (\x -> x + 1)        == 2

-- Curried Functions
-- every function can be transformed into a function of 1 argument 

-- ex: prod x y = x * y
-- prod :: (Int, Int) -> Int 

