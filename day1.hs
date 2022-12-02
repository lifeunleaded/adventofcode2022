import System.IO  
import Control.Monad
import Data.List

main = do  
        let list = []
        handle <- openFile "day1_input" ReadMode
        contents <- hGetContents handle
        let elves = lines contents
        let list' = f elves [0]
        let list = reverse list'
        let max = maximum list
        print "Max:"
        print max
        let sorted = sort list
        let reversesorted = reverse sorted
        let max3 = take 3 reversesorted
        let max3sum = sum max3
        print "Top 3 sum:"
        print max3sum
        hClose handle   

readInt :: String -> Int
readInt [] = 0
readInt s = read s

f :: [String] -> [Int] -> [Int]
f [] is = is
f ([]:ss) is = f ss is ++ [0]
f (s:ss) is = init (f ss is) ++ [last (f ss is) + readInt s]