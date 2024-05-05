
--- Lists and recursion

import Data.Char

-- Returns a list of characters to uppercase

charToUpper :: String -> String
charToUpper [] = []
charToUpper (x : xs) = toUpper x : charToUpper xs

-- Returns a list of characters to lowercase

charToLower :: String -> String
charToLower [] = []
charToLower (x : xs) = toLower x : charToLower xs

-- Main program

main :: IO ()				   
main = do
   
   let hello = "Hello" 
   let helloUpper = charToUpper hello
   let helloLower = charToLower hello
   
   putStr "Hello "
   print (hello)
   
   putStr "Hello to uppercase "
   print (helloUpper)

   putStr "Hello to lowercase "
   print (helloLower)
