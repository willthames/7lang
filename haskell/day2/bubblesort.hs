bubble [] = []
bubble (h:[]) = [h] 
bubble (fst:sec:tail) = 
  if (fst < sec) then fst:bubble(sec:tail) else sec:bubble(fst:tail)

bubblesort :: Ord a => [a] -> [a]
bubblesort (list) = 
  if (attempt == list) then list else bubblesort(attempt)
      where attempt = bubble(list)
