factorial n = product [1..n]
-- average ns = sum ns `div` length ns
average ns = div (sum ns) (length ns)
