-- returns a list with powers of 2 up to n [1, 2, 4, ... , 2^n]
listPowersOfTwo :: Int -> [Int]
listPowersOfTwo x --takes integer x as input
  |x <= 0 = []    --base case, if x is 0 list will return empty
  |otherwise = 2^x : listPowersOfTwo (x-1)

-- quotient of an integer division calculated with subtractions
quotient :: Int -> Int -> Int   --takes two int as input and outputs an int
quotient x xs --dividend and divisor
  | xs == 0 = error "Division by zero"  --base case if divide by 0 then undefined
  | x >= xs = 1 + quotient (x - xs) xs --adds one each time x >= xs
  | otherwise = 0   -- x is less than xs
  

-- remainder of an integer division calculated with subtractions
remainder :: Int -> Int -> Int
remainder x xs
  | xs == 0 = error "Division by zero"
  | x >= xs = remainder (x - xs) xs
  |otherwise = x
  
-- multiplication of two numbers calculated with additions
multiply :: Int -> Int -> Int
multiply x xs
  | xs == 0 = 0
  | xs == 1 = x
  | otherwise = x + multiply x (xs - 1)

-- power calculated with multiplications
power :: Int -> Int -> Int
power x xs
-- trace code x = 5, xs= 3
  | xs == 0 = 1
  | xs == 1 = x
  | otherwise = x * power x (xs - 1) -- trace code x = 5, xs= 3

main :: IO ()
main = do
  putStr "Powers of two are "
  print (listPowersOfTwo 5)
  putStr "Quotient 9 2 is "
  print (quotient 9 2)
  putStr "Remainder 9 2 is "
  print (remainder 9 2)
  putStr "Product 9 2 is "
  print (multiply 9 2)
  putStr "Power 9 2 is "
  print (power 9 2)lists 
