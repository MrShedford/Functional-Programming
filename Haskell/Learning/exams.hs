--2018 Aug
mapSkip :: (Int -> Int) -> [Int] -> [Int]

mapSkip fn x
        | null x = []
        | (length x) > 1 = fn (head x) : x !! 1 : mapSkip fn (drop 2 x)
        | otherwise = fn (head x) : []

--2018 Jan
tear :: (a -> Bool) -> [a] -> [[a]]
tear p x = (filter p x):(filter (not.p) x):[]
--2017 Aug
foo :: [Int] -> [Int] -> [Int]
foo (x) (y) = f 1 x y
    where
        f :: Int -> [Int] -> [Int] -> [Int]
        f z (xx) (yy)
            | (xx == []) && (yy == []) = []
            | xx == [] = yy
            | yy == [] = xx
            | (z `mod` 2 == 1) = take z xx ++ f (z+1) (drop z xx) yy
            | (z `mod` 2 == 0) = take z yy ++ f (z+1) xx (drop z yy)

--2017 Jan
weaveHunks :: Int -> [a] -> [a] -> [a]
weaveHunks _ xs [] = xs
weaveHunks _ [] ys = ys
weaveHunks n xs ys = (take n xs) ++ (take n ys) ++ weaveHunks n (drop n xs) (drop n ys)

weaveHunks2 :: (Ord a) => Int -> [a] -> [a] -> [a]

weaveHunks2 i [] [] = []
weaveHunks2 i (x) (y) = take i x ++ take i y ++ weaveHunks i (drop i x) (drop i y)


--2016 Aug 
tr :: (Ord a) => [[a]] -> [[a]]
tr (lst)
    | head lst == [] = []
    | otherwise = [map head lst] ++ tr (map tail lst)

--2016 Jan && 2015 Aug
revCount :: (Ord a) => [a] -> [Int] -> [a]
revCount [] [] = []
revCount (x) (y) = replicate (last y) (last x) ++ revCount (init x) (init y)

--2015 Jan
afterFilter :: (Ord a) => (a -> Bool) -> [a] -> [a]
afterFilter p [] = []
afterFilter p all@(x:xx:xs)
        | length all == 2 && p x = xx : []
        | length all == 2 = []
        | (p x) = xx : afterFilter p (xx:xs)
        | otherwise = afterFilter p (xx:xs)

--2014 Jan
mapEveryOther :: (a->a) -> [a] -> [a]
mapEveryOther p x
            | null x = []
            | (length x) > 1 = p (head x) : x !! 1 : mapEveryOther p (drop 2 x)
            | otherwise = p (head x) : []

--2014 Aug
--Define a function
-- sort :: (a -> a -> Bool) -> [a] -> [a]
 --which sorts a list according to the given predicate. 
sort :: (a -> a -> Bool) -> [a] -> [a]
sort _ [] = []
sort f (x:xs) =
    let smaller = sort f (filter (f x) xs)
        bigger  = sort f (filter (not . f x) xs)
    in smaller ++ [x] ++ bigger