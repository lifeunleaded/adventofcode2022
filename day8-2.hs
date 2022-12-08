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
        let viewfromwest = fromLists (map scoreFromDir rows)
        let viewfromeast = fromLists (map reverse (map scoreFromDir (map reverse rows)))
        let viewfromnorth = fromLists (Data.List.transpose (map scoreFromDir (Data.List.transpose rows)))
        let viewfromsouth = fromLists (Data.List.transpose (map reverse (map scoreFromDir (map reverse (Data.List.transpose rows)))))
        let viewtotal = matrixMult [viewfromwest,viewfromeast,viewfromnorth,viewfromsouth]
        let viewmax = maximum (map maximum (toLists viewtotal))
        print viewmax
        hClose handle   

readInt :: [Char] -> Int
readInt (x:xs) = read [x] + readInt xs
readInt [] = 0

matrixMult :: [Matrix Int] -> Matrix Int
matrixMult (x:xs) = foldr (elementwise (*)) x xs

scoreFromDir :: String -> [Int]
scoreFromDir (x:xs) = case findIndex (>=x) xs of
    Nothing -> (length xs):scoreFromDir xs
    Just y -> y+1:scoreFromDir xs
scoreFromDir (x:[]) = [0]
scoreFromDir [] = []

