(*
There are four blood groups, A, B, AB and O:

type blood_group = A | B | AB | O
A blood donation is possible only if the blood group of the donor is compatible with the blood group of the recipient.

The compatibility relation is illustrated in the directed graph below,
where an edge from x to y indicates that a patient with blood group x can give blood to a patient with blood group y.

Define a function check_groups that takes the blood groups of two different patients and checks if the first patient can donate blood to the second patient. The type must be:

check_groups : blood_group -> blood_group -> bool
For example, the following asserts must pass:

assert (check_groups O AB = true);;
assert (check_groups A B = false);;
assert (check_groups AB AB = true);;

*)
type blood_group = A | B | AB | O
(* check_groups : blood_group -> blood_group -> bool*)
let check_groups x y = match x, y with
	| O, _ -> true
	| _, AB -> true
	| _ when (x==y) -> true					(*questo QUANDO questo ALLORA questo*)
(*	| _ -> if(x==y) then true else false	(*scrittura uguale a quella di sopra*)
	| _ -> x==y								(*scrittura *)*)
	| _ -> false

(*
x   y	RES
O   O	true	-
O   A	true	-
O   B	true	-
O  AB	true	-

A   O	false
A   A	true	---
A   B	false
A  AB	true	--

B   O	false
B   A	false
B   B	true	---
B  AB	true	--

AB  O	false
AB  A	false
AB  B	false
AB AB	true	--
*)

;;
assert (check_groups O AB = true);;
assert (check_groups A B = false);;
assert (check_groups AB AB = true);;

assert (check_groups  O  O = true);;
assert (check_groups  O  A = true);;
assert (check_groups  O  B = true);;
assert (check_groups  O AB = true);;

assert (check_groups  A  O = false);;
assert (check_groups  A  A = true);;
assert (check_groups  A  B = false);;
assert (check_groups  A AB = true);;

assert (check_groups  B  O = false);;
assert (check_groups  B  A = false);;
assert (check_groups  B  B = true);;
assert (check_groups  B AB = true);;

assert (check_groups AB  O = false);;
assert (check_groups AB  A = false);;
assert (check_groups AB  B = false);;
assert (check_groups AB AB = true);;