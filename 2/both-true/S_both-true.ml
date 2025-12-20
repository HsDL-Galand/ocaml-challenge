(*
Both true
Write a function both_true that takes as input two predicates p and q, each of type 'a -> bool, and returns a new function that checks if both p and q are true for a given argument.

The function must have the following type:

both_true : ('a -> bool) -> ('a -> bool) -> 'a -> bool
Here are some unit tests:

let is_positive x = x > 0;;
let is_even x = x mod 2 = 0;;
let is_positive_and_even = both_true is_positive is_even;;
assert(is_positive_and_even 4 = true);;
assert(is_positive_and_even 3 = false);;
*)

(* both_true : ('a -> bool) -> ('a -> bool) -> 'a -> bool *)
let both_true (p : 'a -> bool) (q : 'a -> bool) : 'a -> bool =
	fun x -> (p x) && (q x)

let both_true1 p q =
	fun x -> (p x) && (q x)

let is_positive x = x > 0;;
let is_even x = x mod 2 = 0;;
let is_positive_and_even = both_true is_positive is_even;;
assert(is_positive_and_even 4 = true);;
assert(is_positive_and_even 3 = false);;

(*
Both true
Write a function both_true that takes as input two predicates p and q, each of type 'a -> bool, and returns a new function that checks if both p and q are true for a given argument.

The function must have the following type:

both_true : ('a -> bool) -> ('a -> bool) -> 'a -> bool
Here are some unit tests:

let is_positive x = x > 0;;
let is_even x = x mod 2 = 0;;
let is_positive_and_even = both_true is_positive is_even;;
assert(is_positive_and_even 4 = true);;
assert(is_positive_and_even 3 = false);;
*)

(* both_true : ('a -> bool) -> ('a -> bool) -> 'a -> bool *)
let both_true_10 p q v = if(p v)&&(q v) then true else false
let both_true_11 p q = fun x -> (p x) && (q x)

let is_positive_10 x = x > 0;;
let is_even_10 x = x mod 2 = 0;;
let is_positive_and_even_10 = both_true_10 is_positive_10 is_even_10;;
assert(is_positive_and_even_10 4 = true);;
assert(is_positive_and_even_10 3 = false);;

(*********************************************************** RISOLUZIONE 2025 ***********************************************************)

let both_true_2025 p q = fun x -> (p x && q x)

let is_positive x = x > 0;;
let is_even x = x mod 2 = 0;;
let is_positive_and_even = both_true_2025 is_positive is_even;;
assert(is_positive_and_even 4 = true);;
assert(is_positive_and_even 3 = false);;

(*********************************************************** \/ GEMINI \/ ***********************************************************)

let both_true p q x = p x && q x

(* Assert Tests *)
let () =
  let is_positive x = x > 0 in
  let is_even x = x mod 2 = 0 in
  assert (both_true is_positive is_even 4);
  assert (not (both_true is_positive is_even 3))