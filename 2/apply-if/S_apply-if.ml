(*
Conditional application
Write a function apply_if that takes as input a predicate p, a function f, and a value x. The output is:

f x, if p x is true;
x, otherwise.
The function must have the following type:

apply_if : ('a -> bool) -> ('a -> 'a) -> 'a -> 'a
Here are some unit tests:

let is_even = fun x -> x mod 2 = 0;;
let is_odd = fun x -> not (is_even x);;
let double x = x * 2;;

assert(apply_if is_even double 4 = 8);;
assert(apply_if is_even double 5 = 5);;
assert(apply_if is_odd double 4 = 4);;
assert(apply_if is_odd double 5 = 10);;
*)

(* apply_if : ('a -> bool) -> ('a -> 'a) -> 'a -> 'a *)

let apply_if (p : 'a -> bool) (f : 'a -> 'a) : 'a -> 'a =
	fun x ->
		if p x then
			f x
		else
			x

let is_even = fun x -> x mod 2 = 0;;
let is_odd = fun x -> not (is_even x);;
let double x = x * 2;;

assert(apply_if is_even double 4 = 8);;
assert(apply_if is_even double 5 = 5);;
assert(apply_if is_odd double 4 = 4);;
assert(apply_if is_odd double 5 = 10);;

(*********************************************************** \/ SOLUZIONE 2025 \/ ***********************************************************)

let apply_if2 p f x =
	if (p x)
		then f x
		else x

let is_even = fun x -> x mod 2 = 0;;
let is_odd = fun x -> not (is_even x);;
let double x = x * 2;;

assert(apply_if2 is_even double 4 = 8);;
assert(apply_if2 is_even double 5 = 5);;
assert(apply_if2 is_odd double 4 = 4);;
assert(apply_if2 is_odd double 5 = 10);;

(********************************************************** \/ GEMINI \/ **********************************************************)

let apply_if p f x = if p x then f x else x

(* Assert Tests *)
let () =
  let is_even x = x mod 2 = 0 in
  let double x = x * 2 in
  assert (apply_if is_even double 4 = 8);
  assert (apply_if is_even double 5 = 5);
  assert (apply_if (fun _ -> false) double 10 = 10)