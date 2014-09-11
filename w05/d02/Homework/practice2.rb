def make_chocolate(small_bars_given, big_bars_given, goal_weight)
 big_bars_needed = goal_weight / 5

 #do we have enough big bars for the need? How many should we use? ALL THE big_bars_given


 if big_bars_given <= big_bars_needed
 	big_bars_used = big_bars_given
 else 
 	big_bars_used = big_bars_needed