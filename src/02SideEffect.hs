module SideEffect where

echo :: IO ()
-- `do` is a macro to make code 
-- looks more imperative (will discuss in detail later)
echo = do 

  -- `<-` in do block extract value from IO
  -- in this case `getLine :: IO String` so
  -- name becomes `String`
  input <- getLine

  -- put string to console
  putStrLn input

hello :: IO ()
hello = do
  -- `let` is a declaration
  let greet = "Hello " 
  putStrLn "What's your name?:"
  name <- getLine
  putStrLn $ greet ++ name ++ "!"

getValidatedLine :: [String] -> IO (String, Bool)
getValidatedLine valids = do
  input <- getLine
  return $ (input, input `elem` valids)

checkIfTwoInputsValid :: IO ()
checkIfTwoInputsValid = do
  let valids = ["hello", "hi"]
  putStrLn "input 1:"
  (input1, valid1) <- getValidatedLine valids
  putStrLn "input 2:"
  (input2, valid2) <- getValidatedLine valids
  
  putStrLn $
    if valid1 && valid2 then 
      "Both `" ++
      input1 ++ "` and `" ++
      input2 ++  "` are valid"
    else if not valid1 && not valid2 then
      "Both `" ++
      input1 ++ "` and `" ++
      input2 ++  "` are invalid"
    else if valid1 then
      "Only input 1 `" ++ input1 ++ "`" ++ " is valid"
    else 
      "Only input 2 `" ++ input2 ++ "`" ++ " is valid"


----------------------------------------------------------
-- Exercise --

-- 1. creates function that type "yes" or "ok" to confirm
--    with custom prompt, must use `getValidatedLine` function
-- example 
{- 
  > confirm "Are you sure?"`
  yes
  "confirmed"

  > confirm "Are you ok?"`
  ok
  "comfirmed"

  > confirm "Are you nuts?"`
  no
  "rejected"
-}


--{-
confirm :: String -> IO ()
confirm prompt = do
  putStrLn prompt
  (_, valid) <- getValidatedLine ["yes", "ok"]
  putStrLn $ if valid then "comfirmed" else "rejected"
---}