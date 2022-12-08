import System.IO  
import Control.Monad
import Data.Matrix
import Data.List
-- import Data.List.Split
-- import Data.Char

main = do  
        handle <- openFile "day8_input" ReadMode
        contents <- hGetContents handle
        let rows = lines contents
        let visiblefromwest = fromLists (map (visibleFromDir (-1)) rows)
        let visiblefromeast = fromLists (map reverse (map (visibleFromDir (-1)) (map reverse rows)))
        let visiblefromnorth = fromLists (Data.List.transpose (map (visibleFromDir (-1)) (Data.List.transpose rows)))
        let visiblefromsouth = fromLists (Data.List.transpose (map reverse (map (visibleFromDir (-1)) (map reverse (Data.List.transpose rows)))))
        let visible = matrixAnd [visiblefromwest,visiblefromeast,visiblefromnorth,visiblefromsouth]
        let visiblecount = sum (map countTrue (toLists visible))
        print visiblecount
        hClose handle   

readInt :: [Char] -> Int
readInt (x:xs) = read [x] + readInt xs
readInt [] = 0

matrixAnd :: [Matrix Bool] -> Matrix Bool
matrixAnd (x:xs) = foldr (elementwise (||)) x xs

countTrue :: [Bool] -> Int
countTrue (x:xs)
    | x = 1 + countTrue xs
    | otherwise = countTrue xs
countTrue [] = 0

visibleFromDir :: Int -> String -> [Bool]
visibleFromDir max (x:xs)
    | readInt [x] > max = True:visibleFromDir (readInt [x]) xs
    | otherwise = False:visibleFromDir max xs
visibleFromDir _ [] = []

