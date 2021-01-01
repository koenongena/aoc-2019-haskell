module Lib
  ( modifyNth,
    replaceNth,
  )
where

modifyNth :: Int -> (a -> a) -> [a] -> [a]
modifyNth _ _ [] = []
modifyNth n newValFn (x : xs)
  | n == 0 = newValFn x : xs
  | otherwise = x : replaceNth (n -1) (newValFn x) xs

replaceNth :: Int -> a -> [a] -> [a]
replaceNth n newVal = modifyNth n (const newVal)
