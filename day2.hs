import System.IO  
import Control.Monad
import Data.List

main = do  
        let list = []
        handle <- openFile "day2_input" ReadMode
        contents <- hGetContents handle
        let games = lines contents
        let results = map words games
        let score = map resultscore results
        let totalscore = sum score
        print totalscore
        hClose handle   

symbolscore :: String -> Int
symbolscore "X" = 1
symbolscore "Y" = 2
symbolscore "Z" = 3
symbolscore _ = 0

resultscore :: [String] -> Int
resultscore [a,b] = case (a,b) of
    ("A","X") -> 3 + symbolscore b
    ("A","Y") -> 6 + symbolscore b
    ("A","Z") -> symbolscore b
    ("B","Y") -> 3 + symbolscore b
    ("B","Z") -> 6 + symbolscore b
    ("B","X") -> symbolscore b
    ("C","Z") -> 3 + symbolscore b
    ("C","X") -> 6 + symbolscore b
    ("C","Y") -> symbolscore b
    (_,_) -> 0
