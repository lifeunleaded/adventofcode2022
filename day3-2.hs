import System.IO  
import Control.Monad
import Data.Char
import Data.List

main = do  
        handle <- openFile "day3_input" ReadMode
        contents <- hGetContents handle
        let packs = lines contents
        let tripletlist = triplets packs
        let symbols = map nub (map (foldl1 intersect) tripletlist)
        let totalprioweight = sum (map charprio symbols)
        print totalprioweight
        hClose handle   

triplets :: [String] -> [[String]]
triplets [] = []
triplets (x:y:z:xs) = [x,y,z]:triplets xs

charprio :: [Char] -> Int
charprio [] = 0
charprio (a:as) = (fromEnum a) - 96 + (boolToInt (isUpper a) * 58) + charprio as

boolToInt :: Bool -> Int
boolToInt True = 1
boolToInt False = 0

