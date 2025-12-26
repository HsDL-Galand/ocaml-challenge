(*
Straight
Consider the following types to represent French-suited cards:

type suit = S | H | D | C;;
type card = Card of int * suit;;
Write a function with type:

straight : card * card * card * card * card -> bool
which evaluates to true iff the hand contains a straight,
	namely five cards in sequential order, possibly with different suites.
*)

type suit = S | H | D | C;;
type card = Card of int * suit;;

let straight (a,b,c,d,e) =
	let lista = [a;b;c;d;e] in
	let get_val (Card (v, _)) = v in
	let valori = List.map get_val lista in
	let valori_ordinati = List.sort compare valori in
	let check l = match l with
	| [a;b;c;d;e] when (a = b-1 && b = c-1 && c = d-1 && d = e-1) -> true
	| [1;10;11;12;13] -> true
	| _ -> false
in
check valori_ordinati
;;

assert(straight (Card(3,S), Card(4,H), Card(5,D), Card(6,C), Card(7,S)) = true);; (* Scala semplice *)
assert(straight (Card(4,H), Card(3,S), Card(7,S), Card(5,D), Card(6,C)) = true);; (* Disordinata *)
assert(straight (Card(1,S), Card(2,H), Card(3,D), Card(4,C), Card(5,S)) = true);; (* Asso basso *)
assert(straight (Card(10,S), Card(11,H), Card(12,D), Card(13,C), Card(1,S)) = true);; (* Asso alto *)
assert(straight (Card(3,S), Card(4,H), Card(6,D), Card(7,C), Card(8,S)) = false);; (* Buco (no scala) *)

(********************************************************** \/ GEMINI \/ **********************************************************)