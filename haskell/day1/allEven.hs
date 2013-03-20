import Test.HUnit
import Data.List

allEven_given :: [Integer] -> [Integer]
allEven_given [] = []
allEven_given (h:t) = if even h then h:allEven_given t else allEven_given t

allEven_comp :: [Integer] -> [Integer]
allEven_comp l = [ x | x <- l, even x]

allEven_filter :: [Integer] -> [Integer]
allEven_filter list = filter even list 

allEven_rmodd :: [Integer] -> [Integer]
allEven_rmodd list = list \\ [ x | x <- list, odd x]

givenTest = allEven_given [1,2,3,4,5] ~=? [2,4]
compTest = allEven_comp [1,2,3,4,5] ~=? [2,4]
filterTest = allEven_filter [1,2,3,4,5] ~=? [2,4]
rmoddTest = allEven_rmodd [1,2,3,4,5] ~=? [2,4]

tests :: Test
tests = TestList [ TestLabel "Test given" givenTest,
                   TestLabel "Test comp" compTest,
                   TestLabel "Test filter" filterTest,
                   TestLabel "Test remove odd" rmoddTest]

main :: IO Counts
main = do runTestTT tests
