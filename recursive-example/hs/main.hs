module Main where
import Text.Printf

findSolution :: Integer -> String
findSolution target =
    case find 1 "1" of
       Just a -> a
       Nothing -> "no solution"
    where
       find :: Integer -> String -> Maybe String
       find x acc
         | x == target = Just acc
         | x > target  = Nothing
         | otherwise   = case (plus5, times3) of
                           (Just a, _) -> Just a
                           (_, Just a) -> Just a
                           (Nothing, Nothing) -> Nothing
                         where
                           plus5  = (find (x + 5) (printf "(%s + 5)" acc))
                           times3 = (find (x * 3) (printf "(%s * 3)" acc))

main :: IO ()
main = putStrLn $ findSolution 253
