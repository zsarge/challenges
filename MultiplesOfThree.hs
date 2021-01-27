-- inspired by https://www.reddit.com/r/csharp/comments/l5y160/i_dont_know_why_but_i_cant_seem_to_wrap_my_head/

import Data.List

applyRule x
  | mod x 3 == 0 = "*"
  | otherwise = show x

main = do 
    putStrLn "What limit would you like to go to?"
    limit <- getLine

    let list = [applyRule x | x <- [1..(read limit)]]

    print $ intercalate "" list

