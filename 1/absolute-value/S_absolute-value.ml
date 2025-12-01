(*
# Absolute value

Implement a function with the following type:
f : int -> int

such that f x is the absolute value of x.

Before starting the exercise, experiment with utop or [TryOCaml](try.ocamlpro.com) to learn a few arithmetic operators in OCaml:
(* integer subtraction *)
2 - 5;;

(* integer opposite *)
-3;;

(* mixing integer subtraction with opposite *)
2 - (-5);;

(* testing the less-than relation *)
2 < 5;;
5 < 2;;

Recall that you can use any expression of type `bool` as a guard in a conditional expression:
if 2 < 5 then 2 else 5;;
if 5 < 2 then 2 else 5;;
*)

(*let abs1 x = x * x / x	ERRORE, DIVISIONE PER 0 *)

let abs2 x =
	if x < 0 then
		-x
	else
		x

let abs3 x = if x < 0 then -x else x;;

let abs4 x = if x>0 then x else x * -1;;

;;
assert((abs2 0) = 0);;
assert((abs2 3) = 3);;
assert((abs2 (-3)) = 3);;

assert((abs3 0) = 0);;
assert((abs3 3) = 3);;
assert((abs3 (-3)) = 3);;

assert((abs4 0) = 0);;
assert((abs4 3) = 3);;
assert((abs4 (-3)) = 3);;