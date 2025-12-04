(*
Even and odd
Write a function with the following type:

is_even : int -> bool
such that is_even x is true iff x is even. Bonus: do not use the if-then-else construct.

Now, consider a simple game between two players, say A and B, with the following rules:

A and B choose a number between 1 and 5 (any other number is considered incorrect);
the winner is A if she played a correct number, and the sum of the two numbers is even;
the winner is B if he played a correct number, and the sum of the two numbers is odd;
if one player has chosen a correct number and the other has not, then the first one wins;
if both players have chosen an incorrect number, then no one wins.
Write a function to determine the winner of the game, with type:

val win : int -> int -> int
such that win a b evaluates to:

1, if the first player wins (i.e., the one who played the number a);
-1, if the second player wins;
0, if no one wins.
*)

(* is_even : int -> bool *)
(* let is_even (x : int) : bool = true *)
let is_even x =
	if (x mod 2) = 0 then
		true
	else
		false

(* val win : int -> int -> int *)
(* let win (a : int) (b : int) : int = 0 *)
let win a b =
	if (a<1 || a>5) && (b<1 || b>5) then
		0 (*nobody wins*)
	else if (b<1 || b>5) then
		1 (*a wins*)
	else if (a<1 || a>5) then
		(-1) (*b wins*)
	else if is_even (a+b) then
		1
	else
		(-1)

		(* a pari; b dispari *)


let is_even x = match x with
	| _ when (x mod 2 = 0) -> true
	| _ -> false

let win a b = match a, b with
	| _ when ((a < 1 || a > 5) && (b < 1 || b > 5)) -> 0
	| _ when (a < 1 || a > 5) -> -1 
	| _ when (b < 1 || b > 5) -> 1
	| _ when (is_even (a+b)) -> 1
	| _ -> -1

(*
invalid invalid 0
_, invalid 1
invalid, _ (-1)
*)


;;
assert(is_even 0 = true);;
assert(is_even 1 = false);;
assert(is_even 2 = true);;
assert(is_even 3 = false);;
assert(is_even (-1) = false);;
assert(is_even (-2) = true);;

assert(win (-1) (-1) = 0);;	(*Pareggio*)
assert(win 0 0 = 0);;		(*Pareggio*)

assert(win 1 0 = 1);;		(*Vince A*)
assert(win 0 1 = (-1));;	(*Vince B*)
assert(win 1 1 = 1);;		(*Vince A*)
assert(win 2 1 = (-1));;	(*Vince B*)
assert(win 3 1 = 1);;		(*Vince A*)
assert(win 4 1 = (-1));;	(*Vince B*)
assert(win 5 1 = 1);;		(*Vince A*)

assert(win 2 0 = 1);;		(*Vince A*)
assert(win 0 2 = (-1));;	(*Vince B*)
assert(win 1 2 = (-1));;	(*Vince B*)
assert(win 2 2 = 1);;		(*Vince A*)
assert(win 3 2 = (-1));;	(*Vince B*)
assert(win 4 2 = 1);;		(*Vince A*)
assert(win 5 2 = (-1));;	(*Vince B*)

assert(win 1 1 = 1);;		(*Vince A*)
assert(win 2 2 = 1);;		(*Vince A*)
assert(win 3 3 = 1);;		(*Vince A*)
assert(win 4 4 = 1);;		(*Vince A*)
assert(win 5 5 = 1);;		(*Vince A*)

assert(win 5 6 = 1);;
assert(win 5 7 = 1);;
assert(win 6 5 = (-1));;
assert(win 7 5 = (-1));;
assert(win 6 6 = 0);;	(*Pareggio*)