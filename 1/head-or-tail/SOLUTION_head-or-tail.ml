(*
Head or tail
Write a function with the following type:

hot : unit -> string
such that hot() evaluates to the string "head" or "tail" depending on a bit generated uniformly at random.

Hint. Use the function:

Random.int(n)
to generate a random integer in the range 0..n-1.
*)

(* hot : unit -> string *)
(* let hot (n : unit) : string = "head" *)
let hot n =
	if (Random.int n) mod 2 = 0 then
		"head"
	else
		"tail"
(* QUESTA è SBAGLIATA *)


let hot_2() =
	if Random.int 2 = 0 then
		"head"
	else
		"tail"
;;
(* Gli assert non hanno molto senso di esistere, dato che è una generazione randomica*)
(* ERRORE: Random.int non accetta input < 0 *)
(* assert(hot (-2) = "head");; *)
(* assert(hot (-1) = "tail");; *)
(* assert(hot 0 = "head");; *)

(* assert(hot 1 = "tail");; *)
(* assert(hot 1 = "head");; *)
(* assert(hot 2 = "tail");; *)
(* assert(hot 2 = "head");; *)
(* assert(hot 3 = "tail");; *)
(* assert(hot 3 = "head");; *)

(* assert(hot_2() = "head");; *)
(* assert(hot_2() = "tail");; *)