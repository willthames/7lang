import Test.HUnit

rev :: [a] -> [a]
rev [] = []
rev (h:t) = rev t ++ [h]

revTest = rev [1,2,3,4,5] ~=? [5,4,3,2,1]

tests = TestList [ TestLabel "Test rev" revTest]

main :: IO Counts
main = do runTestTT tests
