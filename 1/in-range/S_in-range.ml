(*
Write a function with type:

in_range : 'a -> 'a -> 'a -> bool
such that in_range x a b evaluates to true iff the value x belongs to the range a..b.
*)

(* in_range : 'a -> 'a -> 'a -> bool *)
(* let in_range x a b : bool = true *)
let in_range x a b =
	if x >= a && x <= b then
		true
	else
		false

let in_range x a b = match x, a, b with
	| _ when (x >= a && x <= b) -> true
	| _ -> false

;;
assert(in_range 1 1 1 = true);;
assert(in_range 2 2 2 = true);;
assert(in_range 1 2 2 = false);;
assert(in_range 1 1 2 = true);;
assert(in_range 1 0 2 = true);;
assert(in_range 0 (-1) 1 = true);;
assert(in_range (-3) (-4) (-2) = true);;
assert(in_range (-6) (-4) (-2) = false);;