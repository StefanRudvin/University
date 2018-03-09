import Data.Char
import Data.Maybe
import Data.List
import qualified Data.Map hiding (map)
import Text.Printf

main = do
    src <- readFile "grades"
    let pairs   = map (split.words) (lines src)
    let grades  = foldr insert Data.Map.empty pairs
    mapM_ (draw grades) (sort (Data.Map.keys grades))
  where
    insert (s, g) = Data.Map.insertWith (++) s [g]
    split [name,mark] = (name, read mark)

draw g s = printf "%s\t%s\tAverage: %f\n" s (show marks) avg
  where
    marks = Data.Map.findWithDefault (error "No such student") s g
    avg   = sum marks / fromIntegral (length marks) :: Double
