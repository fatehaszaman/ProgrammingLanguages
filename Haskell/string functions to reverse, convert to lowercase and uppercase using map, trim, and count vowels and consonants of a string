import Data.Char

-- functions to reverse, convert to lowercase and uppercase using map, trim, and count vowels and consonants of a string

stringToLower :: String -> String
stringToLower string = map toLower string

stringToUpper :: String -> String
stringToUpper string = map toUpper string

reverseString :: String -> String
reverseString [] = []
reverseString (x:xs) = reverseString xs ++ [x]

reverseStrings :: String -> String
reverseStrings string= reverse string

stringLength :: String -> Int
stringLength [] = 0
stringLength (x:xs) = 1+stringLength xs

trimString :: String -> String
trimString [] = []
trimString (x:xs) = if x/=' ' then x:trimString xs else trimString xs


isVowel :: Char -> Bool
isVowel letter = 
  if toLower letter == 'a'|| 
     toLower letter == 'e'||
     toLower letter == 'i'||
     toLower letter == 'o'||
     toLower letter == 'u'
  then True else False

isVowel' :: Char -> Bool
isVowel' letter = 
  letter `elem` ['a','e','i','o', 'u']

countVowels :: String -> Int
countVowels letters = vowels 0 letters
  where 
  --helper functions
  vowels :: Int -> String -> Int
  vowels count [] = count
  vowels count (x :xs) = if isVowel x 
                        then vowels (count + 1) xs 
                        else vowels count xs 
  
  
countVowelsAndConsonants :: String -> (Int,Int)
countVowelsAndConsonants letters = vowelsAndConsonants (0,0) letters
  where
  vowelsAndConsonants::(Int,Int) -> String->(Int,Int)
  vowelsAndConsonants(vowels,consonants)[]=(vowels,consonants)
  vowelsAndConsonants (vowels,consonants) (x:xs)  | isVowel x = vowelsAndConsonants(vowels+1, consonants) xs
                                                  |otherwise =vowelsAndConsonants(vowels,consonants+1)xs


-- functions to extract values from tuples

-- first :: (Int, Int) -> Int
-- first (x, _) = x
 
-- second :: (Int, Int) -> Int
-- second (_, x) = x


main :: IO ()
main = do

   let education = "educAtion "
   let sentence = " this coding works"

   putStr "\"eduCation\" to uppercase using map "
   print (stringToUpper education)
   putStr "using function 'reverseString' is: "
   print (reverseString education)
   putStr "reverse string  using 'reverse' is: "
   print (stringToUpper(reverse education))
   
   print (trimString education)
   print (countVowelsAndConsonants(education))
   
   putStr "using other function 'reverseStrings' :"
   print (stringToUpper(reverseStrings education))
   
   putStr "stringLength of education is: "
   print (stringLength education)
   
   let letter = 'x'
   
   putStr "using function is vowel function:  \n"
   print (isVowel letter)
   
   putStr "using OTHER function is vowel function: \n"
   print (isVowel' letter)
   
   print (countVowels education)
