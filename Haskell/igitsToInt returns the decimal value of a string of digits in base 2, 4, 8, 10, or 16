import Data.Char

-- digitsToInt returns the decimal value of a string of digits in base 2, 4, 8, 10, or 16

digitsToInt :: String -> Int -> Int
digitsToInt str base = intFromDigits 0 str
  where
      intFromDigits :: Int -> String -> Int
      intFromDigits value [] = value --base case
      intFromDigits value (x : xs) = intFromDigits (base * value + digitToInt x) xs 
      --recursive function to mult the base with the value

-- digitsToInt [] dig = dig ...we need str to int then base case
--digitsToInt (x:xs) dig = digitsToInt xs (dig * 10 + digitToInt x)



-- decimalToInt returns the decimal value of a string of a decimal string
decimalToInt :: String -> Int
decimalToInt decimal = intFromDigits 0 decimal
--takes string and starts function with initial value of 0 and the input string.

   where
      intFromDigits :: Int -> String -> Int
      intFromDigits value [] = value --base case
      intFromDigits value (x : xs) = intFromDigits (10 * value + digitToInt x) xs
    

  --Multiply accumulated value by 10 then add the digit value of the current char 'x', continue with xs


-- decimalToInt [] dec= dec  base case
-- decimalToInt (x:xs) = (decimalToInt xs) * 10 ++ digitToInt x

-- decimalToInt [] = 0  base case
-- decimalToInt (x:xs) = (decimalToInt x) * 2 ++ digitToInt xs



-- binaryToInt returns the decimal value of a binary string
binaryToInt :: String -> Int
binaryToInt bits = binToInt 0 bits
   where
      binToInt :: Int -> String -> Int
      binToInt value [] = value  
      binToInt value (x : xs) = binToInt (2 * value + digitToInt x) xs
      
-- Main program

main :: IO ()                   
main = do

   let binary = "1010" -- 10 decimal
   let octal = "14" -- 12 decimal
   let decimal = "2022" -- 2022 decimal
   let hexadecimal = "1AF" -- 431 decimal
   
   putStr "Binary number "
   print (binary)

   let binaryValue = binaryToInt binary
   
   putStr "Binary value is "
   print (binaryValue)
   
   putStr "Binary value + 2 is "
   print (2 + binaryValue)
   
   putStr "Octal number "
   print (octal)

   let octalValue = digitsToInt octal 8
   
   putStr "Octal value is "
   print (octalValue)
   
   putStr "Octal value + 5 is "
   print (5 + octalValue)
   
   putStr "Decimal number "
   print (decimal)
   
   let decimalValue = decimalToInt decimal

   putStr "Decimal value is "
   print (decimalValue)
   
   putStr "Decimal value + 2 is "
   print (2 + decimalValue)

   putStr "Decimal value + 2 is "
   print (2 + digitsToInt decimal 10)
   
   putStr "Hexadecimal number "
   print (hexadecimal)
   
   let hexadecimalValue = digitsToInt hexadecimal 16
   
   putStr "Hexadecimal value is "
   print (hexadecimalValue)
   
   putStr "Hexadecimal value + 4 is "
   print (4 + hexadecimalValue)
