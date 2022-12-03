import System.IO  
import Control.Monad
import Data.Char
import Data.List

main = do  
        handle <- openFile "day3_input" ReadMode
        contents <- hGetContents handle
        let packs = lines contents
        let totalprioweight = sum (map prioweight packs)
        print totalprioweight
        hClose handle   

prioweight :: [Char] -> Int
prioweight x = sum (map charprio (intersect (nub (take half x)) (nub (take half (reverse x))))) where half = div (length x) 2

charprio :: Char -> Int
charprio a = (fromEnum a) - 96 + (boolToInt (isUpper a) * 58)

boolToInt :: Bool -> Int
boolToInt True = 1
boolToInt False = 0

