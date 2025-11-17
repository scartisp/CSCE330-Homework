-- Simion Cartis
-- CHAPTER 4 Q8

luhnDouble :: Int -> Int
luhnDouble x | x*2 > 10 = x*2-9
             | otherwise = x*2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (d + luhnDouble c + b + luhnDouble a) `mod` 10 == 0

{- ghci> luhn 1 7 8 4
True
ghci> luhn 4 7 8 3
False
-}

-- CHAPTER 5 Q6
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (init (factors x)) == x]

{-
ghci> perfects 500
[6,28,496]
-}
