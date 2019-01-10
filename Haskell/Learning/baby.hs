doubleMe x = x + x  

doubleUs x y = doubleMe x + doubleMe y   

doubleSmallNumber x = if x > 100
    then x
    else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  

removeNonUppercase :: [Char] -> [Char]  
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']] 

addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

circumference :: Float -> Float  
circumference r = 2 * pi * r

circumference' :: Double -> Double  
circumference' r = 2 * pi * r 

sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"  

factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1) 

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                 = "You're a whale, congratulations!"  

initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname    

replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x  
