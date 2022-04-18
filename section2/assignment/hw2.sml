(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* Q1a *)
fun all_except_option e = 
   case e of 
      (s, []) => NONE
      | (s, x::xs) => 
         case same_string(s, x) of
	         true => SOME xs
            | false => 
               case all_except_option(s, xs) of
		            NONE => NONE
		            | SOME y => SOME (x::y)

(* Q1b *)
fun get_substitutions1 e = 
   case e of 
      ([], target) => []
      | (first::rest, target) => 
         let
            val names' = get_substitutions1(rest, target);
            val current_names = all_except_option(target, first);
         in
            case current_names of
               NONE => names'
               | SOME names => names @ names'
         end

(* Q1c *)
fun get_substitutions2(list, target) = 
   let
      fun f(xs, acc) = 
      case xs of
         [] => acc
         | x::xs' => 
            case all_except_option(target, x) of
               NONE => acc
               | SOME names => f(xs', acc@names)
   in
     f(list, [])
   end

(* Q1d *)
fun similar_names(list, name) = 
   let
      val {first = f, middle = m, last = l} = name
      fun make_names (xs) = 
         case xs of
            [] => []
            | x::xs' => {first = x, middle = m, last = l}::(make_names(xs'))
   in
     name::make_names(get_substitutions2(list, f))
   end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

(* Q2a *)
fun card_color card =
   case card of
	   (Clubs, _) => Black
      | (Spades, _)  => Black
      | (_, _) => Red

(* Q2b *)
fun card_value card =
   case card of
	   (_, Ace) => 11
      | (_, Num x) => x
      | (_, _) => 10
      
(* Q2c *)
fun remove_card(cs, c, e) = 
   case cs of 
      [] => raise e
      | first::rest => if first = c then rest else first::remove_card(rest, c, e)


(* Q2d *)
fun all_same_color cs = 
   case cs of 
      [] => true
      | [_] => true (* single element *)
      | first::(next::rest) => card_color(first) = card_color(next) andalso all_same_color(next::rest)

(* Q2e *)
fun sum_cards cs = 
   let
     fun accumulator(xs, acc) = 
         case xs of 
            [] => acc
            | x::xs' => accumulator(xs', card_value(x) + acc)
   in
     accumulator(cs, 0)
   end

(* Q2f *)
fun score(cs, goal) = 
   let
      val sum = sum_cards cs
      val same_color = all_same_color cs
      val goal_sum_diff = goal - sum
      val sum_goal_diff = sum - goal
      val prelim = case sum > goal of 
                     true => 3 * sum_goal_diff
                     | false => goal_sum_diff
   in
      case same_color of
         true => prelim div 2 
         | false => prelim
   end

(* Q2g *)
fun officiate(cs, moves, goal) = 
   let
      fun loop(held_cards, deck, rest_moves, goal) = 
         case rest_moves of 
            [] => score(held_cards, goal)
            | (Discard c::rest_moves') => loop(remove_card(cs, c, IllegalMove), deck, rest_moves', goal)
            | (Draw::rest_moves') => case deck of 
                           [] => score(held_cards, goal)
                           | first::rest => if sum_cards(first::held_cards) > goal
                                             then score(first::held_cards, goal)
                                             else loop(first::held_cards, rest, rest_moves', goal)
   in
      loop([], cs, moves, goal)
   end
