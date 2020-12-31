{- stack script
 --resolver lts-16.27
 --install-ghc
-}

calculateFuel :: Int -> Int
calculateFuel x = max 0 (x `div` 3 - 2)

calculateFuelRequirement :: Int -> Int
calculateFuelRequirement n
  | n <= 0 = 0
  | otherwise = fuel + calculateFuelRequirement fuel
  where
    fuel = calculateFuel n

main :: IO ()
main = do
  s <- readFile "input/day1.txt"
  let input = read <$> lines s
--  Part 1
  print $ sum $ map calculateFuel input
--  Part 2
  print $ sum $ map calculateFuelRequirement input
