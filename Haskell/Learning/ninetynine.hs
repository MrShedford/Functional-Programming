-- Question 1 
myLast lst = last lst

--Question 2
myButLast lst = last (init lst)

--Question 3
elementAt lst k =
    lst !! k

--Question 4
myLength lst = length lst

--Question 5
myReverse inp = reverse inp

--Question 6
isPalindrome lst = 
    if (reverse lst) == lst
        then True
        else False

--Question 7
data NestedList a = Elem a | List [NestedList a]
flatten :: NestedList a -> [a]
flatten (Elem a   )   = [a]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)
flatten (List [])     = []

--Question 8
compress (x:ys@(y:_))
    | x == y    = compress ys
    | otherwise = x : compress ys
compress ys = ys

--Question 9
-- pack::[a] -> [[a]]
-- pacl li
--     | null li = []
--     | null (tail li) = [(head li)]
--     | (head li) == (head (tail li)) = []

pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack [x] = [[x]]
pack (x:xs) = if x `elem` (head (pack xs))
                then (x:(head (pack xs))):(tail (pack xs))
                else [x]:(pack xs)

    