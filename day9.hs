import System.IO  
import Control.Monad
import Data.List
import Data.Matrix

main = do  
        handle <- openFile "day9_input" ReadMode
        contents <- hGetContents handle
        let movestrings = lines contents
        let moves = foldr1 (++) (map readMove movestrings)
        let headcoords = (1,1):headPos moves (1,1)
        let onecoords = scanl tailPos (1,1) headcoords
        let twocoords = scanl tailPos (1,1) onecoords
        let threecoords = scanl tailPos (1,1) twocoords
        let fourcoords = scanl tailPos (1,1) threecoords
        let fivecoords = scanl tailPos (1,1) fourcoords
        let sixcoords = scanl tailPos (1,1) fivecoords
        let sevencoords = scanl tailPos (1,1) sixcoords
        let eightcoords = scanl tailPos (1,1) sevencoords
        let tailcoords = scanl tailPos (1,1) eightcoords
        print "Part 1:"
        print (length (nub onecoords))
        print "Part 2:"
        print (length (nub tailcoords))

readIntStr :: String -> Int
readIntStr x = read x

readInt :: Char -> Int
readInt x = read [x]

readMove :: String -> [Char]
readMove x = take (readIntStr((words x)!!1)) (iterate id (x!!0))

headPos :: [Char] -> (Int,Int) -> [(Int,Int)]
headPos (c:cs) (x,y) = case c of
    'R' -> (x+1,y):headPos cs (x+1,y)
    'L' -> (x-1,y):headPos cs (x-1,y)
    'U' -> (x,y+1):headPos cs (x,y+1)
    'D' -> (x,y-1):headPos cs (x,y-1)
headPos [] (x,y) = [(x,y)]

tailPos :: (Int,Int) -> (Int,Int) -> (Int,Int)
tailPos (tx,ty) (hx,hy)
    | (abs (tx-hx) > 1) || (abs (ty-hy) > 1) = (tx+(signum (hx-tx)),ty+(signum (hy-ty)))
    | otherwise = (tx,ty)