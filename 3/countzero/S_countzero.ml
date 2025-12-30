(*
Count zeros of a function
Define a function with type:

countzero : (int -> int) -> int -> int -> int
Given as input a function f from integers to integers and two integers a and b,
countzero f a b counts the zeros of f in the interval [a,b],
i.e. the number of integer values x in the interval such that f(x)=0.

For instance, the following assert must pass:
assert (countzero (fun x -> x) (-10) 10 = 1);;
assert (countzero (fun x -> x) 1 10 = 0);;
assert (countzero (fun x -> x*x - 1) (-10) 10 = 2);;
assert (countzero (fun x -> (if x<0 then -x else x) - 1) (-10) 10 = 2);;
*)

let countzero f a b =
	let rec aux x acc =
		if		(x > b)
			then acc	(* Passo base: se non viene eseguita alcuna iterazione/ritorna il contatore*)
		else if	(f x = 0)
			then aux (x+1) (acc+1)	(* Se la funzione con quell'input fa zero, aumenta il contatore *)
			else aux (x+1) (acc)	(* Altrimenti passa alla prossima senza incrementare il contatore*)
	in
	aux a 0

(*
f 7 7 -> 0

f 3 5
f 3 = 0? acc++ skip
f 4 = 0? acc++ skip
f 5 = 0? acc++ skip
*)

;;
assert (countzero (fun x -> x) (-10) 10 = 1);;
assert (countzero (fun x -> x) 1 10 = 0);;
assert (countzero (fun x -> x*x - 1) (-10) 10 = 2);;
assert (countzero (fun x -> (if x<0 then -x else x) - 1) (-10) 10 = 2);;

(********************************************************** \/ GEMINI \/ **********************************************************)

let rec countzero f a b =
	if (a > b)
		then 0
		else (if f a = 0 then 1 else 0) + countzero f (a + 1) b

let rec countzero2 f a b =
	if (a > b)
		then 0
	else if (f a = 0)
		then 1 + countzero2 f (a + 1) b
		else 0 + countzero2 f (a + 1) b