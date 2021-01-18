#!/usr/bin/env runghc

-- run <script>

import Data.List (intersect,)
import Data.List.Utils (countElem,)
import Data.Time.Calendar (DayOfWeek( Friday,Saturday,Sunday ),dayOfWeek,fromGregorian,toGregorian,)
import Data.Time.Clock (getCurrentTime,utctDay,)

nrWeekends :: Integer -> Int -> Int
nrWeekends y m = minimum $ (\l -> map (\x -> countElem x l) [Friday,Saturday,Sunday]) $ map (dayOfWeek.(fromGregorian y m)) [1..31]

main = do
  curY <- getCurrentTime >>= return.(\(y,_,_)->y).toGregorian.utctDay
  mapM_ print $ filter ((5<=).(\[y,m]-> nrWeekends y $ fromInteger m)) $ sequence [[1900..curY],[1..12]]
