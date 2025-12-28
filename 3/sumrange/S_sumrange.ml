(*
Sum range
Define a function with type:

sumrange : int -> int -> int
such that sumrange a b sums the numbers in the range [a,b]. If the range is empty, then the result is zero.

Here are some unit tests:

assert (sumrange 0 1 = 1);;
assert (sumrange 1 3 = 6);;
assert (sumrange 3 2 = 0);;
*)

(* [3;4;5] *)
let sumrange a b =
	let rec aux acc x = (* x: elemento attuale *)
		if	(x > b) (* (x = b+1) giusto anche questo, ma meno elegante*)
			then acc
			else aux (acc+x) (x+1)
	in
(*	if (a>b)
		then 0
	else aux 0 a*) (* superfluo *)
	aux 0 a

let rec sumrange2 a b =
	if (a>b)
		then 0
		else a + sumrange2 (a+1) b

;;
assert (sumrange 0 1 = 1);;
assert (sumrange 1 3 = 6);;
assert (sumrange 3 2 = 0);;
assert (sumrange 3 3 = 3);;

assert (sumrange2 0 1 = 1);;
assert (sumrange2 1 3 = 6);;
assert (sumrange2 3 2 = 0);;
assert (sumrange2 3 3 = 3);;

(********************************************************** \/ GEMINI \/ **********************************************************)

let rec sumrange a b =
  if a > b then 0
  else a + sumrange (a + 1) b