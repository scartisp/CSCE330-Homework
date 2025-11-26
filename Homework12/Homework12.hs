len :: [a] -> Int
len = (foldr (+) 0) . (map (const 1))
{-
ghci> len[4,5,6,3,2]
5
ghci> len[]
0
ghci> len [5]
1
-}