(*
Guess a number
Write a function with type:

guess5 : int -> bool * int
with the following behaviour. When guess5 is applied to a parameter n, it first checks if n is in the range 1..5; if not, it fails.
Otherwise, it generates a random number r between 1 and 5, and it returns a pair (b,r), where b is true iff n equals to r.

Hint. Use the function:

Random.int(n)
to generate a random integer in the range 0..n-1.
*)

(* guess5 : int -> bool * int *)
(* let guess5 (n : int) : bool * int = true, 3 *)
let r = Random.int(5-1+1)
(* let r = Random.int(5)+1 *)
let guess5 n = 
	if n<1 || n>5 then
		failwith "fail"
	else if n = r then
		true, r
	else
		false, r

;;
(* NON HA SENSO FARE GLI ASSERT CON LA RANDOM *)
(* assert(guess5 3 = (true, 3));; *)

let guess5_2 n = match n with
	| _ when (n < 1 || n > 5) -> failwith("Out of range")
	| _ when ((Random.int(5)+1) = n) -> (true, n)
	| _ -> (false, n)

let guess5_3 n =
	if(n < 1 || n > 5)
		then failwith("Out of range")
		else let r = (Random.int(5)+1) in (n = r, r)

let guess5_4 n =
	if(n < 1 || n > 5)
		then failwith("Out of range")
		else	let r = (Random.int(5)+1) in
				let b = (n = r) in
				(b,r)
;;