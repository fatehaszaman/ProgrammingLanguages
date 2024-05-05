import Data.Char
-- functions to extract values from tuples
first :: (Int, Int) -> Int
first (x, _) = x

second :: (Int, Int) -> Int
second (_, x) = x

hasVowel :: Int -> (Int, Int, Int, Int, Int) -> Bool
hasVowel 1 (x, _, _, _, _) = x /= 0
hasVowel 2 (_, x, _, _, _) = x /= 0
hasVowel 3 (_, _, x, _, _) = x /= 0
hasVowel 4 (_, _, _, x, _) = x /= 0
hasVowel 5 (_, _, _, _, x) = x /= 0
hasVowel _ (_, _, _, _, x) = False

-- functions to count vowels and consonants
isVowel :: Char -> Bool
isVowel letter = if toLower letter == 'a' || 
                    toLower letter == 'e' || 
                    toLower letter == 'i' || 
                    toLower letter == 'o' || 
                    toLower letter == 'u' 
                    then True else False


countVowels :: String -> Int
countVowels letters = vowels 0 letters
   where
      vowels :: Int -> String -> Int
      vowels counter [] = counter
      vowels counter (x : xs) = if isVowel x 
        then vowels (counter + 1) xs else vowels counter xs

countVowelsAndConsonants :: String -> (Int, Int)
countVowelsAndConsonants letters = vowelConsonants (0, 0) letters
   where
      vowelConsonants :: (Int, Int) -> String -> (Int, Int)
      vowelConsonants (vowels, consonants) [] = (vowels, consonants)
      vowelConsonants (vowels, consonants) (x : xs) 
       | isVowel x = vowelConsonants (vowels + 1, consonants) xs
       | otherwise = vowelConsonants  (vowels, consonants + 1) xs

countAllVowels :: String -> (Int, Int, Int, Int, Int)
countAllVowels word = (aCount, eCount, iCount, oCount, uCount)
  where
    (vowelCount, _) = countVowelsAndConsonants word
    aCount = countVowel 'a'
    eCount = countVowel 'e'
    iCount = countVowel 'i'
    oCount = countVowel 'o'
    uCount = countVowel 'u'
    countVowel :: Char -> Int
    countVowel vowel = vowelCount - countVowels (filter (/= vowel) word)
    
    -- returns a tuple with the number of times each vowel is found
-- for example, given the word "euphoric" the function returns (0, 1, 1, 1, 1),which means that "euphoric" does not have vowel 'a'

hasAllVowels :: String -> Bool
hasAllVowels str = all (`elem` str) "aeiou"
-- 'elem' string checking if it is present
-- returns True is the input string has all the vowels and False otherwise

main :: IO ()
main = do
   let education = "education"
   let euphoria = "euphoria"
   let euphoric = "euphoric"
   let count = countVowelsAndConsonants education
   putStr "\"education\" has "
   putStr (show (first(count)))
   putStr " vowels and "
   putStr (show (second(count)))
   putStr " consonants \n"
   putStr "\"euphoric\" has the vowels "
   print (countAllVowels euphoric)
   putStr "\"education\" has all the vowels is "
   print (hasAllVowels education)
   putStr "\"euphoria\" has all the vowels is "
   print (hasAllVowels euphoria)
   putStr "\"euphoric\" has all the vowels is "
   print (hasAllVowels euphoric)
