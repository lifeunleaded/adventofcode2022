import System.IO  
import Control.Monad
import Data.Matrix

main = do  
        handle <- openFile "day10_input" ReadMode
        contents <- hGetContents handle
        let instructionStrings = lines contents
        let instructions = foldl1 (++) (map readInstr instructionStrings)
        let register = scanl (+) 2 instructions
        let sampleindex = take 6 (iterate (+ 40) 20)
        let signalvalue = map (getSignalValue register) sampleindex
        print "Part 1:"
        print (sum signalvalue)
        let cursor = take (length register) (iterate (+ 1) 1)
        let m = zero 6 40
        let rowfactor = foldl1 (++) (map (take (ncols m)) (map (iterate (id)) (take 6 (iterate (+ 40) 0))))
        let factoredregister = zipWith (+) register rowfactor
        let pixels = zipWith combine factoredregister cursor
        let display = fromLists (splitToList 40 pixels)
        print ("Part 2:")
        print display
   
readIntStr :: String -> Int
readIntStr x = read x

splitToList :: Int -> [a] -> [[a]]
splitToList _ [] = []
splitToList x l = (fst (splitAt x l)):(splitToList x (snd (splitAt x l)))

readInstr :: String -> [Int]
readInstr x = case ((words x) !! 0) of
    "addx" -> [0,(readIntStr ((words x) !! 1))]
    "noop" -> [0]
    _ -> []

getSignalValue :: [Int] -> Int -> Int
getSignalValue x i = (x !! (i-1)) * i

combine :: Int -> Int -> Int
combine x y = case ((abs (x-y)) < 2) of
    True -> 1
    otherwise -> 0
