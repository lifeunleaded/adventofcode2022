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

symbolscore :: String -> String -> Int
symbolscore "A" "X" = 3
symbolscore "A" "Y" = 1
symbolscore "A" "Z" = 2
symbolscore "B" "X" = 1
symbolscore "B" "Y" = 2
symbolscore "B" "Z" = 3
symbolscore "C" "X" = 2
symbolscore "C" "Y" = 3
symbolscore "C" "Z" = 1
symbolscore _ _ = 0

resultscore :: [String] -> Int
resultscore [a,b] = case b of
    ("X") -> 0 + symbolscore a b
    ("Y") -> 3 + symbolscore a b
    ("Z") -> 6 + symbolscore a b
    (_) -> 0
