{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Control.Monad
import qualified Data.ByteString as BS
import System.Environment
import Text.XHtml (content)

score1 pair =
    case pair of
        ["A", "X"] -> 3 + 1
        ["A", "Y"] -> 6 + 2
        ["A", "Z"] -> 0 + 3
        ["B", "X"] -> 0 + 1
        ["B", "Y"] -> 3 + 2
        ["B", "Z"] -> 6 + 3
        ["C", "X"] -> 6 + 1
        ["C", "Y"] -> 0 + 2
        ["C", "Z"] -> 3 + 3

score2 pair =
    case pair of
        ["A", "X"] -> 0 + 3
        ["A", "Y"] -> 3 + 1
        ["A", "Z"] -> 6 + 2
        ["B", "X"] -> 0 + 1
        ["B", "Y"] -> 3 + 2
        ["B", "Z"] -> 6 + 3
        ["C", "X"] -> 0 + 2
        ["C", "Y"] -> 3 + 3
        ["C", "Z"] -> 6 + 1


readLines :: FilePath -> IO [String]
readLines = fmap lines . readFile

main :: IO ()
main = do
    args <- getArgs
    content <- readLines (args !! 0)
    let x = map words content
    print (sum $ map score1 x)
    print (sum $ map score2 x)