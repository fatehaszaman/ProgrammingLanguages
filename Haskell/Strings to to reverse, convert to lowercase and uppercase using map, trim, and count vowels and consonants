--- Strings
----------

import Data.Char

-- functions to reverse, convert to lowercase and uppercase using map, trim, and count vowels and consonants of a string
reverseString :: String -> String
reverseString string = reverse string 

reverseString' :: String -> String
reverseString' [] = []
reverseString' (x : xs) = reverseString' xs ++ [x]

stringToLower :: String -> String
stringToLower string = map toLower string

stringToUpper :: String -> String
stringToUpper string = map toUpper string

stringLength :: String -> Int 
stringLength [] = 0
stringLength (x :xs) = 1 + stringLength xs

isVowel :: Char -> Bool
isVowel letter = 
  if toLower letter == 'a' ||
    toLower letter == 'e' ||
    toLower letter == 'i' ||
    toLower letter == 'o' ||
    toLower letter == 'u' then True else False 
    
isVowel':: Char -> Bool
isVowel' letter = letter `elem` ['a', 'e', 'i','o', 'u']

main :: IO ()
main = do

   let education = "education"

   putStr "\"education\" to uppercase using map "
   print (stringToUpper education)

   putStr "\"education\" reversed is "
   print (reverseString education)
   
   putStr "\"education\" reversed is "
   print (reverseString' education)
   
   putStr "\"education\" length is "
   print (stringLength education)
   
   let letter= 'x'
   print (isVowel letter)
