(*
7, 11 and doubles
Write a function with type:

seven_eleven_doubles : unit -> bool * int * int
which throws two random dices d1,d2, and returns a triple (b,d1,d2) where b is true iff the sum of the two dices is 7 or 11, or if the two dices are equal.
*)

(* seven_eleven_doubles : unit -> bool * int * int *)
(* let seven_eleven_doubles() : bool * int * int = true, 1, 1 *)

let ad6 = 1+Random.int(6-1+1)
let bd6 = 1+Random.int(6-1+1)
let seven_eleven_doubles() =	(* SOLUZIONE MOLTO DISCUTIBILE *)
	if ad6+bd6=7 || ad6+bd6=11 || ad6=bd6 then
		true, ad6, bd6
	else
		false, ad6, bd6


let seven_eleven_doubles2() =
	let a =	Random.int(6)+1 in
	let b = Random.int(6)+1 in
		(a+b=7 || a+b=11 || a=b,a,b)


;;
(* NON HA SENSO FARE GLI ASSERT CON LA RANDOM *)
(* assert(seven_eleven_doubles() = (false, ad6, bd6)) *)