--- Lists and recursion

import Data.Char

-- Integral data type is a typeclass whose instances support integer division and conversion to the Integer type
-- functions even and odd require an Integral data type

-- Returns a list with the digits from the input list

digitsOfList :: String -> String
digitsOfList [] = []
digitsOfList (x : xs) | isDigit x = x : digitsOfList xs
                      | otherwise = digitsOfList xs
  
-- Returns the min value of a list of integer numbers

minOfList :: [Int] -> Int
minOfList (x : []) = x
minOfList (x : xs) = x `min` minOfList xs

maxOfList :: [Int] -> Int
maxOfList (x : []) = x
maxOfList (x : xs) = x `max` maxOfList xs

sumEvenNumbers :: Integral a => [a] -> a
sumEvenNumbers [] = 0
sumEvenNumbers (x : xs ) = if even x then x  +  sumEvenNumbers  xs else  sumEvenNumbers xs-- Main program


sumOddNumbers :: Integral a => [a]  -> a
sumOddNumbers [] = 0
sumOddNumbers (x : xs) = if odd x then  x + sumOddNumbers xs  else sumOddNumbers xs

numToSquare :: Num a => [a] -> [a]
numToSquare [] = []
numToSquare (x : xs) = x*x : numToSquare xs

-- Returns the square of the elements of a list of numbers using map

numToSquareUsingMap :: Num a => [a] -> [a]
numToSquareUsingMap x = map (^2) x

-- Returns a list having n times the element x

addToList :: Int -> a -> [a]
addToList 0 x  = []
addToList n x  = x : addToList(n - 1) x

main :: IO ()				   
main = do
   
   let vowels = ["a","e","i","o","u"]
   let numbers = [1,2,3,4,5,6,7,8,9,10]
   
   putStr "Min of numbers "
   print (minOfList numbers)
   
   putStr "Max of numbers "
   print (maxOfList numbers)

   -- list containing letters and digits
   
   let lettersDigits = "1a2e3i4o5u"

   putStr "LettersDigits "
   print (lettersDigits)
   
   putStr "Digits "
   print (digitsOfList lettersDigits)
