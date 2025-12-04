(*
Best offer
You are given three offers, each represented with the type int option. An offer is Some(x) means that x is the amount of the offer, while None means that no offer is made.

Write a function of type:
best_offer : int option -> int option -> int option -> int option
that takes three offers and returns the highest one. If none of the offers are valid (i.e., all are None), the function should return None.

Examples
best_offer (Some 100) (Some 200) (Some 150) = Some 200
best_offer (Some 100) None (Some 150) = Some 150
best_offer None None None = None
best_offer None (Some 300) None = Some 300
*)

(* best_offer : int option -> int option -> int option -> int option *)

(* let best_offer (a:int) (b:int) (c:int) = 4 *)

type offer = Some of int | None

let best_offer2 a b c =
	if (a=None && b=None && c=None) then
		None
	else if (a>b && a>c) then
		a
	else if (b>c) then
		b
	else
		c
;;

let best_offer x y z = match x, y, z with
	| None, None, None -> None
	| _ when (x > y &&  x > z) -> x
	| _ when (y > z) -> y
	| _ -> z
;;

(* let best_offer a b c = match a, b, c with
	| None, None, None -> None
	| _ -> None *)

;;
assert(best_offer None None None = None);;
assert(best_offer (Some 10) (Some 10) (Some 10) = (Some 10));;
assert(best_offer (Some 20) (Some 10) (Some 10) = (Some 20));;
assert(best_offer (Some 10) (Some 30) (Some 10) = (Some 30));;
assert(best_offer (Some 10) (Some 10) (Some 40) = (Some 40));;
assert(best_offer (Some 50) (Some 10) (Some 50) = (Some 50));;

assert(best_offer (Some 11) (Some 22) None = (Some 22));;
assert(best_offer None (Some 22) (Some 33) = (Some 33));;
assert(best_offer (Some 11) None (Some 33) = (Some 33));;

assert(best_offer (Some 1) None None = (Some 1));;
assert(best_offer None (Some 2) None = (Some 2));;
assert(best_offer None None (Some 3) = (Some 3));;

assert(best_offer (Some 100) (Some 200) (Some 150) = Some 200);;
assert(best_offer (Some 100) None (Some 150) = Some 150);;
assert(best_offer None None None = None);;
assert(best_offer None (Some 300) None = Some 300);;