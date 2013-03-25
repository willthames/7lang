import Data.Char

todigit :: Char -> Int
todigit c = ord(c) - ord('0')

strtonum :: String -> Float -> Float

strtonum ('$':rest) n = strtonum rest n
strtonum (',':rest) n = strtonum rest n
strtonum ('.':rest) n = n + fractional rest
strtonum (d:rest) n = strtonum rest (n * 10.0 + fromIntegral(todigit d))

fractional :: String -> Float
fractional [] = 0
fractional (d:rest) = 0.1 * (fromIntegral(todigit d) + fractional rest)

parsenum :: String -> Float
parsenum x = strtonum x 0.0
