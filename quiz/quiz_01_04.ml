(*
Definire per pattern matching una funzione OCaml con tipo:

foo : int -> int -> int -> int -> bool

e tale che foo a0 a1 a2 a3 vale true se e solo se esiste qualche indice "i" tale che: 

(0 <= i <= 3) && (ai = a(i+1)) && (ai = 0)

Fatto questo, individuare i test che passano.
*)

(* let foo (a : int) (b : int) (c : int) (d : int) : bool = true *)
let foo a0 a1 a2 a3 = match a0, a1, a2, a3 with
	| 0, 0, _, _ -> true
	| _, 0, 0, _ -> true
	| _, _, 0, 0 -> true
	| _ -> false

let foo1 = function (* match anonym1, anonym2, anonym3, anonym4 with*)
	| 0, 0, _, _
	| _, 0, 0, _
	| _, _, 0, 0 -> true
	| _ -> false

;;
assert(foo 0 0 1 2);;
assert(foo 2 3 0 0);;
assert(foo 3 0 0 4);;
(* assert(foo 4 0 5 0);; *)
(* assert(foo 0 5 0 6);; *)
(* assert(foo 0 6 7 0);; *)