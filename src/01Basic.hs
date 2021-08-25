module Basic where
import Data.List

-- this is single line comment

{-
this is block comment
so we can go multiple line
--}

{-
using repl:
`:h` show help
`:l path/to/File.hs` or `:load` load the module
`:r` reload the module
`:doc` shows documentation
`:t` shows type information of function
`:i` shows more info about function or type
`:{
 ..
 :}` multiline
-}

integer = 1 -- value
double = 3.0
bool = True -- or `False`
char = 'c'
string = "hello world"

{- Haskell is a STATICALLY TYPED language,
not defining type makes the compiler infered the most generic type for you.
check it with `:t` in the repl.
-}

integer' :: Integer
integer' = 1

---------------------------------------------------

-- More to try out in the repl
{-
7 + 12 -- 19
3 * 11 -- 33
6 - 2 -- 4
11 / 8 -- 1.375

-- Integer division
11 `div` 8 -- 1

-- Remainder (`mod` in many language)
11 `rem` 8 -- 3

-- Note that Haskell does not use `!`
not True -- False 

-- Note that Haskell does not use `!=`
10 /= 9 -- True 

10 == 9 -- False
True && False -- False
False || True -- True
4 > 2 -- True
18 <= 13 -- False

[1, 2] ++ [3, 4] -- [1, 2, 3, 4]
"Hello" ++ "world" -- "Hello world"

fst ("a", "b") -- "a"
snd ("a", "b") -- "b"


if (even 2) then "even" else "odd" -- "even"

case "1" of
  "1" -> "first"
  "2" -> "second"
  "3" -> "third"
  _   -> "don't care"
-}

inc n = n + 1 -- function

inc' :: Integer -> Integer
inc' n = n + 1

surround :: String -> String -> String
surround s i = s ++ i ++ s

nSurround :: Int -> String -> String -> String
nSurround n s i =
  rs ++ i ++ rs
  where
    -- rs :: String
    rs = intercalate "" (take n (repeat s))
    -- rs = intercalate "" $ take n $ repeat s

nSurround' :: Int -> String -> String -> String
nSurround' n s i =
  let
    rs = intercalate "" (take n (repeat s))
  in
    rs ++ i ++ rs
    
-- `let` and `where` can have more than one binding
-- `repeat` is an example of LAZY



-- function application
{-
inc 1 -- inc(1)
surround "`" "Hello" -- surround("`", "Hello")
-}

-- Actully, everything is function
{-
7 + 12 == (+) 7 12
11 `div` 8 == div 11 8
-}

-- You can also think about value as function that takes no argument

----------------------------------------------------------
-- Exercise --

-- 1. create function that check if a number is even
{-
even' :: _ -> _
even' n = _
--}

-- 1. create html tag function
-- tag "div" "content" -> "<div>content</div>
{-
tag :: String -> String -> String
tag t c = _
--}

-- 3. create function construct html list
-- repeatedHtmlList 3 "a" -> "<ul><li>a</li><li>a</li><li>a</li></ul>"
-- Hint: can use the function defined above
{-
repeatedHtmlList :: Int -> String -> String
repeatedHtmlList n s = _
--}