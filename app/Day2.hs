modifyNth :: Int -> (a -> a) -> [a] -> [a]
modifyNth _ _ [] = []
modifyNth n newValFn (x : xs)
  | n == 0 = newValFn x : xs
  | otherwise = x : replaceNth (n -1) (newValFn x) xs

replaceNth :: Int -> a -> [a] -> [a]
replaceNth n newVal = modifyNth n (const newVal)

atHaltCode :: [Int] -> Int -> Bool
atHaltCode arr i = arr !! i == 99

updateInput :: [Int] -> Int -> [Int]
updateInput arr i
  | (arr !! i) == 1 = h ++ [a + b] ++ t
  | (arr !! i) == 2 = h ++ [a * b] ++ t
  | otherwise = error "Shouldn't be here"
  where
    a = arr !! (arr !! (i + 1))
    b = arr !! (arr !! (i + 2))
    c = arr !! (i + 3)
    h = take c arr
    t = drop (c + 1) arr

untilHaltCode :: Int -> [Int] -> [Int]
untilHaltCode i arr
  | arr !! i == 99 = arr
  | otherwise = untilHaltCode (i + 4) (updateInput arr i)

replaceNounAndVerb :: Int -> Int -> [Int] -> [Int]
replaceNounAndVerb noun verb arr = replaceNth 2 verb $ replaceNth 1 noun arr

runProgramWithNounAndVerb :: Int -> Int -> [Int] -> [Int]
runProgramWithNounAndVerb noun verb arr = untilHaltCode 0 (replaceNounAndVerb noun verb arr)

producesOutput :: Int -> [Int] -> (Int, Int) -> Bool
producesOutput output arr (noun, verb) = output == head (runProgramWithNounAndVerb noun verb arr)

main :: IO ()
main = do
  let input = [1, 0, 0, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3, 2, 13, 1, 19, 1, 10, 19, 23, 1, 6, 23, 27, 1, 5, 27, 31, 1, 10, 31, 35, 2, 10, 35, 39, 1, 39, 5, 43, 2, 43, 6, 47, 2, 9, 47, 51, 1, 51, 5, 55, 1, 5, 55, 59, 2, 10, 59, 63, 1, 5, 63, 67, 1, 67, 10, 71, 2, 6, 71, 75, 2, 6, 75, 79, 1, 5, 79, 83, 2, 6, 83, 87, 2, 13, 87, 91, 1, 91, 6, 95, 2, 13, 95, 99, 1, 99, 5, 103, 2, 103, 10, 107, 1, 9, 107, 111, 1, 111, 6, 115, 1, 115, 2, 119, 1, 119, 10, 0, 99, 2, 14, 0, 0] :: [Int]

  --part 1
  print $ head $ runProgramWithNounAndVerb 12 2 input
  
  --  part 2
  let (noun, verb) = head $ filter (producesOutput 19690720 input) [(n, v) | n <- [0, 1 .. 99], v <- [0, 1 .. 99]]
  print $ 100 * noun + verb

--   print something
