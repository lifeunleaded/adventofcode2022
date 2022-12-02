import System.IO  
import Control.Monad
import Data.List

main = do  
        let list = []
        handle <- openFile "day1_test_input" ReadMode
        contents <- hGetContents handle
        let elves = lines contents
        let list' = f elves [0]
        let list = reverse list'
        print "List:"
        print list
        let max = maximum list
        print "Max:"
        print max
        let sorted = sort list
        print "Sorted:"
        print sorted
        let reversesorted = reverse sorted
        print "Reverse sorted:"
        print reversesorted
        let max3 = take 3 reversesorted
        print max3
        let max3sum = sum max3
        print "Top 3:"
        print max3
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