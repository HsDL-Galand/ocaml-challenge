(*
Highest card wins
Consider a simple card game between a player and the dealer, with the following rules:

if neither the player nor the dealer have the Joker, then the one with the highest card wins;
if both the player and the dealer have the Joker, then the dealer wins;
otherwise, the one with the Joker wins.
We represent a card with the following type:

type card = Joker | Val of int;;
where the value of the card is assumed to be in the range [1,10].

Write a function with the following type:

win : card -> card -> bool
which returns true iff the player wins (we assume that the card of the player is the first parameter of win).
*)

type card = Joker | Val of int

(* win : card -> card -> bool *)
(* let win (p : card) (d : card) : bool = true *)
let win1 p d =
	(*if (p<1 || p>10) || (d<1 || d>10) then
		failwith("Out of range")
	else*) if ((p > d) || (p = Joker)) && not(d = Joker) then
	(* else if (Val p > Val d) || (Val p=Joker) && Val d <> Joker then *) (*ALTERNATIVA CORRETTA*)
		true
	else
		false

(* let win2 (Val p) (Val d) =
	if (Val p<Val 1 || Val p>Val 10) || (Val d<Val 1 || Val d>Val 10) then
		failwith("Out of range")
	else if (Val p > Val d) || (Val p = Joker) && not(Val d = Joker) then
	(* else if (Val p > Val d) || (Val p = Joker) && Val d <> Joker then *)
		true
	else
		false *)

let win3 p d = match p, d with
	(* | Joker, Joker -> false *)
	| _, Joker -> false
	| Joker, _ -> true
	| p, d when p > d -> true
	| _ -> false

;;
assert(win1 (Joker) (Joker) = false);;
assert(win1 (Val 3) (Joker) = false);;
assert(win1 (Joker) (Val 5) = true);;

assert(win1 (Val 1) (Val 1) = false);;
assert(win1 (Val 1) (Val 2) = false);;
assert(win1 (Val 2) (Val 1) = true);;
assert(win1 (Val 8) (Val 9) = false);;
assert(win1 (Val 10) (Val 9) = true);;

assert(win3 (Joker) (Joker) = false);;
assert(win3 (Val 3) (Joker) = false);;
assert(win3 (Joker) (Val 5) = true);;

assert(win3 (Val 1) (Val 1) = false);;
assert(win3 (Val 1) (Val 2) = false);;
assert(win3 (Val 2) (Val 1) = true);;
assert(win3 (Val 8) (Val 9) = false);;
assert(win3 (Val 10) (Val 9) = true);;