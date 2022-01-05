import Text.Printf

findSolution target = formatSolution
  where
    formatSolution :: String
    formatSolution =
      case find 1 "1" of
        Just a -> a
        Nothing -> "no solution"
    find :: Integer -> String -> Maybe String
    find x acc
      | x == target = Just acc
      | x > target  = Nothing
      | otherwise   = getFirstValid
      where
        getFirstValid =
          case (plus5, times3) of
            (Just x, _) -> Just x
            (_, Just x) -> Just x
            (Nothing, Nothing) -> Nothing
          where
            plus5  = (find (x + 5) (printf "(%s + 5)" acc))
            times3 = (find (x * 3) (printf "(%s * 3)" acc))

main :: IO ()
main = putStrLn $ findSolution 253
