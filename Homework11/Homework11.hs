-- Simion Cartis
-- CHAPTER 6 Q7

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) | x < y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys
{-
ghci> merge [2,5,6] [1,3,4]
[1,2,3,4,5,6]
ghci> merge [2,5,6] [1,3,4,5]
[1,2,3,4,5,5,6]
ghci>
-}

-- CHAPTER 6 Q8
halve :: [a] -> ([a], [a])
halve xs = (take ((length xs) `div` 2) xs,drop ((length xs) `div` 2) xs)

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort firstHalf) (msort secondHalf)
        where
            (firstHalf, secondHalf) = halve xs
{-
ghci> msort [5,2,6,1,0]
[0,1,2,5,6]
ghci> msort [5,4,3,2,1]
[1,2,3,4,5]
-}