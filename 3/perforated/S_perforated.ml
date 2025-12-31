(*
Perforated list
Write a function with type:

is_perforated : int list -> bool
that checks if a list of integers is perforated.
A list is said to be perforated if,
	for every pair of consecutive elements in the list,
there exists at least one integer strictly between them.

For example, the list [1;3;7] is perforated, because:

between the consecutive list elements 1 and 3 there exists some integer (e.g., 2);
between the consecutive list elements 3 and 7 there exists some integer (e.g., 5).
Instead, the list [1;3;2] is not perforated, because:

between the consecutive list elements 3 and 2 there exists no integer.
Here are some additional unit tests:

assert(is_perforated []);;
assert(is_perforated [1]);;
assert(is_perforated [1;2] = false);;
assert(is_perforated [1;3]);;
assert(is_perforated [1;5;2]);;
assert(is_perforated [1;3;2] = false);;
assert(is_perforated [1;4;2;0]);;
assert(is_perforated [1;3;2;0] = false);;
assert(is_perforated [1;3;5;2;4;7;3;1]);;
*)

let is_perforated l =
	let get_first list = match list with	(* restituisce il primo elemento di list *)
		| [] -> failwith("ERR1")
		| h::t -> h
	in
	let rec aux acc x = match x with
		| [] -> true
		(* | h::[] -> true *)
		| h::t -> if(h+1 = acc || h-1 = acc || h = acc) then false else (aux h t)
	in
	if (l = [] || l = get_first l::[])
		then true						(* true se la lista è ha meno di due numeri *)
		else aux ((get_first l + 99)) l	(* false se ha più di un elemento *)
		(* + 99 è un workaround per bypassare il primo controllo forzandolo a superarlo sempre *)

(*
[] true
h::[] true
h::t

[4;7;8]
elemento attuale confrontato con il precedente
(7+1 = 4 || 7-1 = 4) -> false else t
*)

;;
assert(is_perforated []);;
assert(is_perforated [1]);;
assert(is_perforated [1;2] = false);;
assert(is_perforated [1;3]);;
assert(is_perforated [1;5;2]);;
assert(is_perforated [1;3;2] = false);;
assert(is_perforated [1;4;2;0]);;
assert(is_perforated [1;3;2;0] = false);;
assert(is_perforated [1;3;5;2;4;7;3;1]);;
assert(is_perforated [7;7;2] = false);;
assert(is_perforated [-1; -3; -5]);; (* Test numeri negativi *)
assert(is_perforated [-1; -2] = false);;

(********************************************************** \/ GEMINI \/ **********************************************************)

let rec is_perforated = function
  | [] | [_] -> true
  | a :: b :: t -> abs (a - b) > 1 && is_perforated (b :: t)

;;
assert (is_perforated []);;
assert (is_perforated [1; 3; 5]);;
assert (is_perforated [1; 2; 4] = false);;
assert (is_perforated [1; 1] = false);;